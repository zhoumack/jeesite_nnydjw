/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.google.common.collect.Maps;
import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.api.SendMessageApi;
import com.jfinal.qyweixin.sdk.msg.send.QiYeTextMsg;
import com.thinkgem.jeesite.common.mapper.ParseJsonUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.shenpi.entity.Paiche;
import com.thinkgem.jeesite.modules.shenpi.entity.Renwu;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;
import com.thinkgem.jeesite.modules.actfenpei.service.ActFenpeiUserService;
import com.thinkgem.jeesite.modules.shenpi.dao.RenwuDao;

/**
 * 任务安排Service
 * @author 刘伟
 * @version 2018-11-28
 */
@Service
@Transactional(readOnly = true)
public class RenwuService extends CrudService<RenwuDao, Renwu> {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private SystemService sysService;
	@Autowired
	private ActFenpeiUserService actFenpeiUserService;
	@Autowired
	private UserDao userDao;
	public Renwu get(String id) {
		return super.get(id);
	}
	
	public List<Renwu> findList(Renwu renwu) {
		return super.findList(renwu);
	}
	
	public Page<Renwu> findPage(Page<Renwu> page, Renwu renwu) {
		return super.findPage(page, renwu);
	}
	
	@Transactional(readOnly = false)
	public void save(Renwu renwu) {
		// 申请发起
		if (StringUtils.isBlank(renwu.getId())){
			renwu.setStatus("流程中");
			//通过preInsert（)获取新增的id
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("startUser", UserUtils.getUser().getName());
			vars.put("role", UserUtils.getRoleByUserId());
			renwu.preInsert();
			renwu.setIsNewRecord(true);
			// 启动流程
			String actProId=actTaskService.startProcess(ActUtils.PD_Renwu[0], ActUtils.PD_Renwu[1], renwu.getId(),UserUtils.getUser().getName()+"的工作安排",vars );
			//设置流程实例id
			renwu.getAct().setProcInsId(actProId);
			renwu.setProcInsId(actProId);
			renwu.getAct().setVars(vars);
			//设置流程状态
			try {
				auditSave(renwu);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 重新编辑申请		
		else{
			renwu.getAct().setComment(("1".equals(renwu.getAct().getFlag())?"[同意] ":"[销毁] "));
			// 完成流程任务
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("pass", "1".equals(renwu.getAct().getFlag())? "1" : "0");
			actTaskService.complete(renwu.getAct().getTaskId(), renwu.getAct().getProcInsId(), renwu.getAct().getComment(), UserUtils.getUser().getName()+"的派车申请", vars);
			super.save(renwu);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(Renwu renwu) {
		super.delete(renwu);
	}
	/**
	 * 审核审批保存
	 * @param testAudit
	 * @throws Exception 
	 */
	@Transactional(readOnly = false)
	public void auditSave(Renwu renwu) throws Exception {
		// 对不同环节的业务逻辑进行操作
		String taskDefKey = renwu.getAct().getTaskDefKey();
		if(StringUtils.isEmpty(taskDefKey)){
			TaskEntity task=actTaskService.getCurrentTask(renwu.getAct().getProcInsId());
			renwu.getAct().setTask(task);
			taskDefKey=task.getTaskDefinitionKey();
		}
		Map<String, Object> vars = Maps.newHashMap();
		String apply=renwu.getUser().getId();
		User Apply=UserUtils.get(apply);
		// 审核环节
		if ("audit".equals(taskDefKey)){
			Map<String, List<String>>  mapAudit=ParseJsonUtils.parseStringJson(renwu.getApprove());
			List<String> auditUser=sysService.getAssigns(mapAudit.get("departmentId"), mapAudit.get("userId"));
			super.save(renwu);
			if(UserUtils.getRoleByUserId().equals("fgld")){
				vars.put("bmld",  auditUser.get(0));
			}else{
				vars.put("executor",  auditUser.get(0));
			}
			String roleName=renwu.getAct().getVars().getMap().get("role").toString();
			vars.put("role", roleName);
			actTaskService.completeFirstTask(renwu.getAct().getProcInsId(), "申请","工作安排", vars);
			sendNextAssign(renwu.getAct().getProcInsId(),UserUtils.get(renwu.getUser().getId()).getName());
			return;
		}else if ("bmldfp".equals(taskDefKey)){//部门领导再度分配
			Map<String, List<String>>  mapAudit=ParseJsonUtils.parseStringJson(renwu.getTaskApprove());
			List<String> auditUser=sysService.getAssigns(mapAudit.get("departmentId"), mapAudit.get("userId"));
			vars.put("executor",  auditUser.get(0));
			renwu.setUserName(UserUtils.getUser().getName());
			super.save(renwu);
		}else if ("rwfk".equals(taskDefKey)){//执行人任务反馈
			String role=actTaskService.getVariable(renwu.getAct().getTaskId(), "role").toString();
			//保存执行人意见
			ActFenpeiUser afu=new ActFenpeiUser(ActUtils.PD_Renwu[0], renwu.getAct().getProcInsId(), "rwfk",UserUtils.getUser());
			afu.setTaskRemarks("endTime:"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"&remark:"+renwu.getRemarks());
			afu.setTaskComment(renwu.getAct().getFlag());
			actFenpeiUserService.save(afu);
			if(role.equals("fgld")){
				List<HistoricTaskInstance> bmld=actTaskService.histoicList(renwu.getAct().getProcInsId(), "", "bmldfp");
				String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createText(UserUtils.getUser().getName(), "", "工作安排", "已反馈任务",Apply.getName());
				SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), UserUtils.getByLoginName(bmld.get(0).getAssignee()).getId(), "", ApiConfigKit.getAgentId(), ""));
			}
		}
		// 提交流程任务
		renwu.getAct().setComment(ActUtils.getComment(renwu.getAct().getFlag(), renwu.getAct().getComment()));
		//提交流程并提交任务意见
		actTaskService.complete(renwu.getAct().getTaskId(), renwu.getAct().getProcInsId(), ActUtils.getComment(renwu.getAct().getFlag(), renwu.getAct().getComment()), vars);
		//ProcessInstance pi=actTaskService.getProcIns(qingjia.getAct().getProcInsId());
		//流程是否结束
		if(CollectionUtils.isEmpty(actTaskService.getCurrentTaskList(renwu.getAct().getProcInsId()))){
			Renwu r= get(renwu.getId());
			r.setStatus(renwu.getAct().getFlag());
			super.save(r);
			//发送消息给提交人
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createText(UserUtils.getUser().getName(), "/shenpi/yitijiao", "工作安排", "已反馈任务",Apply.getName());
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), apply, "", ApiConfigKit.getAgentId(), ""));
			return;
		}
		sendNextAssign(renwu.getAct().getProcInsId(),UserUtils.get(renwu.getUser().getId()).getName());
		//向申请者发送提示
	//	SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), qingjia.getUser().getId(), "", ApiConfigKit.getAgentId(), ""));
		//应向下一步执行人发送审批通知
	}
	public void sendNextAssign(String proInsId,String supplyName){
		if(actTaskService.getCurrentTaskList(proInsId).isEmpty()) return;
		List<Task>  tasks=actTaskService.getCurrentTaskList(proInsId);
		for(Task tk:tasks){
			TaskEntity task=(TaskEntity)tk;
			String assignName=task.getAssignee();
			if(StringUtils.isEmpty(assignName)){
				return;
			}
			String userId=UserUtils.getByLoginName(assignName).getId();
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),supplyName, "/shenpi/wode", "工作安排");
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
		}
		
	}
	public void sendApply(String proInsId,String supplyName){
		if(actTaskService.getCurrentTask(proInsId)==null) return;
		String assignName=actTaskService.getCurrentTask(proInsId).getAssignee();
		if(StringUtils.isEmpty(assignName)) return;
		String userId=UserUtils.getByLoginName(assignName).getId();
		String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextShenpi(UserUtils.getUser().getName(),supplyName, "/shenpi/wode", "工作安排");
		SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
	}
	
	public Role getRoleByUser(User user){
		Role role=new Role();
		role.setEnname("ganjing");
		String roleStr="";
		List<Role> roles=new ArrayList<Role>();
		if(user==null)
			roles=sysService.findRole(new Role(UserUtils.getUser()));
		else
			roles=sysService.findRole(new Role(user));
		
		for(Role r:roles){
			roleStr+=r.getEnname()+"|";
		}
		
		for(Role r:roles){
			if(r.getEnname().equals("fgld")){
				return r;
			}
			if(r.getEnname().equals("jwbzb_ld")){
				if(!roleStr.contains("fgld"))
					return r;
			};
			if(r.getEnname().equals("bmld")){
				if(!roleStr.contains("fgld")||!roleStr.contains("fgld"))
					return r;
			};
		}
		
		
		return role;
	}
}