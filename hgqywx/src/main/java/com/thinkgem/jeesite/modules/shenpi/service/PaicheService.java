/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.task.IdentityLink;
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
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;
import com.thinkgem.jeesite.modules.actfenpei.service.ActFenpeiUserService;
import com.thinkgem.jeesite.modules.shenpi.dao.PaicheDao;

/**
 * 派车申请Service
 * @author szx
 * @version 2018-10-17
 */
@Service
@Transactional(readOnly = true)
public class PaicheService extends CrudService<PaicheDao, Paiche> {

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
	
	public Paiche get(String id) {
		return super.get(id);
	}
	
	public List<Paiche> findList(Paiche paiche) {
		return super.findList(paiche);
	}
	
	public List<Paiche> findCaoSongList(Paiche paiche) {
		return dao.findCaoSongList(paiche);
	}
	
	public Page<Paiche> findPage(Page<Paiche> page, Paiche paiche) {
		return super.findPage(page, paiche);
	}
	
	@Transactional(readOnly = false)
	public void save(Paiche paiche) {
		// 申请发起
				if (StringUtils.isBlank(paiche.getId())){
					paiche.setStatus("流程中");
					//通过preInsert（)获取新增的id
					Map<String, Object> vars = Maps.newHashMap();
					vars.put("startUser", UserUtils.getUser().getName());
					paiche.preInsert();
					paiche.setIsNewRecord(true);
					// 启动流程
					String actProId=actTaskService.startProcess(ActUtils.PD_PaiChe[0], ActUtils.PD_PaiChe[1], paiche.getId(),UserUtils.getUser().getName()+"的派车申请",vars );
					//设置流程实例id
					paiche.getAct().setProcInsId(actProId);
					paiche.setProcInsId(actProId);
					paiche.getAct().setVars(vars);
					//设置流程状态
					try {
						auditSave(paiche);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				// 重新编辑申请		
				else{
					paiche.getAct().setComment(("1".equals(paiche.getAct().getFlag())?"[同意] ":"[销毁] "));
					// 完成流程任务
					Map<String, Object> vars = Maps.newHashMap();
					vars.put("pass", "1".equals(paiche.getAct().getFlag())? "1" : "0");
					actTaskService.complete(paiche.getAct().getTaskId(), paiche.getAct().getProcInsId(), paiche.getAct().getComment(), UserUtils.getUser().getName()+"的派车申请", vars);
					super.save(paiche);
				}
				
	}
	
	
	/**
	 * 审核审批保存
	 * @param testAudit
	 * @throws Exception 
	 */
	@Transactional(readOnly = false)
	public void auditSave(Paiche paiche) throws Exception {
		// 对不同环节的业务逻辑进行操作
		String taskDefKey = paiche.getAct().getTaskDefKey();
		if(StringUtils.isEmpty(taskDefKey)){
			TaskEntity task=actTaskService.getCurrentTask(paiche.getAct().getProcInsId());
			paiche.getAct().setTask(task);
			taskDefKey=task.getTaskDefinitionKey();
		}
		Map<String, Object> vars = Maps.newHashMap();
		//向申请者发送消息
	//	String sendTest="";
//		Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(paiche.getTaskApprove());
//		List<String> drivers=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
		// 审核环节
		if ("audit".equals(taskDefKey)){
			Map<String, List<String>>  mapAudit=ParseJsonUtils.parseStringJson(paiche.getApprove());
			List<String> driversAudit=sysService.getAssigns(mapAudit.get("departmentId"), mapAudit.get("userId"));
			super.save(paiche);
			if(driversAudit.size()>0){
				vars.put("dtleader",  driversAudit.get(0));
				vars.put("pcfgld",  driversAudit.get(0));
			}
			String roleName=getRoleByUser(null).getEnname();
			vars.put("role", roleName);
			vars.put("pass", "1");
			//vars.putAll(paiche.getAct().getVars().getMap());
			 //sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(v[0], "/shenpi/wode", "请假");
			if(paiche.getIscommon().equals("0")){
				vars.put("worktime", 0);
			}else{
				vars.put("worktime", 1);
			}
			actTaskService.completeFirstTask(paiche.getAct().getProcInsId(), "申请","公务用车", vars);
			List<User> users=userDao.findUserByRoleEnname("jwbzb_sjbz");
			List<String> usersIds=new ArrayList<String>();
			for(int i=0;i<users.size();i++){
				usersIds.add(users.get(i).getId());
			}
			//正常派车 并且 检务保障部领导
			if(paiche.getIscommon().equals("1")){
				if(roleName.equals("jwbzb_ld")||roleName.equals("fgld")){//检务保障部领导
					String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),UserUtils.get(paiche.getUser().getId()).getName(), "/shenpi/wode", "派车");
					SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
					return;
				}
				if(roleName.equals("bmld")){//部门领导
					String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),UserUtils.get(paiche.getUser().getId()).getName(), "/shenpi/wode", "公务用车");
					SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
					return;
				}
			}else{//非正常派车
				if(roleName.equals("fgld")){//分管领导
					String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),UserUtils.get(paiche.getUser().getId()).getName(), "/shenpi/wode", "公务用车");
					SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
					return;
				}
				if(roleName.equals("jwbzb_ld")){//检务保障部领导
				}
				if(roleName.equals("bmld")){//部门领导
				}
			}
			sendNextAssign(paiche.getAct().getProcInsId(),UserUtils.get(paiche.getUser().getId()).getName());
			return;
		}else if ("bmldrsp".equals(taskDefKey)){//申请部门领导人审批
			vars.put("worktime", 1);
			if(paiche.getIscommon().equals("0")){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(paiche.getTaskApprove());
				List<String> drivers=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("pcfgld",  drivers.get(0));
				vars.put("worktime", 0);
			}else{//群发消息jwbzb_sjbz
				if( "1".equals(paiche.getAct().getFlag())){
					List<User> users=userDao.findUserByRoleEnname("jwbzb_sjbz");
					List<String> usersIds=new ArrayList<String>();
					for(int i=0;i<users.size();i++){
						usersIds.add(users.get(i).getId());
					}
					//sendNextAssign(paiche.getAct().getProcInsId(),UserUtils.get(paiche.getUser().getId()).getName());
					String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),UserUtils.get(paiche.getUser().getId()).getName(), "/shenpi/wode", "公务用车");
					SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
				}
			}
		}else if ("fgldsp".equals(taskDefKey)){//分管领导审批
			if(paiche.getAct().getFlag().equals("1")){
				List<User> users=userDao.findUserByRoleEnname("jwbzb_sjbz");
				List<String> usersIds=new ArrayList<String>();
				for(int i=0;i<users.size();i++){
					usersIds.add(users.get(i).getId());
				}
				//sendNextAssign(paiche.getAct().getProcInsId(),UserUtils.get(paiche.getUser().getId()).getName());
				String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),UserUtils.get(paiche.getUser().getId()).getName(), "/shenpi/wode", "派车");
				SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
			}
		}else if ("nqfpjsy".equals(taskDefKey)){//保障部司机班长分配驾驶员
			Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(paiche.getTaskApprove());
			List<String> drivers=new ArrayList<String>();
			if("1".equals(paiche.getAct().getFlag()))
				 drivers=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
			vars.put("drivers", drivers);
		}else if ("fkpcxx".equals(taskDefKey)){//驾驶员反馈派车信息
			ActFenpeiUser afu=new ActFenpeiUser(ActUtils.PD_PaiChe[0], paiche.getAct().getProcInsId(), taskDefKey,UserUtils.getUser());
			StringBuffer sb=new StringBuffer();
			sb.append("driverPhone:"+paiche.getDriverPhone()+"&");
			sb.append("carNumeber:"+paiche.getCarNumeber());
	//		sb.append("hysj:"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(paiche.getHysj()));
			afu.setTaskComment(paiche.getAct().getComment());
			afu.setTaskRemarks(sb.toString());
			actFenpeiUserService.save(afu);
			String apply=paiche.getUser().getId();
			User Apply=UserUtils.get(apply);
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createText(UserUtils.getUser().getName(), "/shenpi/yitijiao", "派车", "已反馈派车信息",Apply.getName());
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), apply, "", ApiConfigKit.getAgentId(), ""));
			//查询司机班长的id 并发送消息
			List<HistoricTaskInstance> sjbz=actTaskService.histoicList(paiche.getAct().getProcInsId(), "", "nqfpjsy");
			sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createText(UserUtils.getUser().getName(), "", "派车", "已反馈派车信息",Apply.getName());
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), UserUtils.getByLoginName(sjbz.get(0).getAssignee()).getId(), "", ApiConfigKit.getAgentId(), ""));
		}else if ("txhysj".equals(taskDefKey)){//驾驶员填写回院时间
			ActFenpeiUser afu=new ActFenpeiUser(ActUtils.PD_PaiChe[0], paiche.getAct().getProcInsId(), "txhysj",UserUtils.getUser());
			afu.setTaskRemarks("hysj:"+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(paiche.getHysj()));
			afu.setTaskComment(paiche.getAct().getComment());
			actFenpeiUserService.save(afu);
			String apply=paiche.getUser().getId();
			User Apply=UserUtils.get(apply);
			//发送消息给提交人
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createText(UserUtils.getUser().getName(), "/shenpi/yitijiao", "公务用车", "已反馈回院时间",Apply.getName());
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), apply, "", ApiConfigKit.getAgentId(), ""));
			//发送消息给司机班长
			List<HistoricTaskInstance> sjbz=actTaskService.histoicList(paiche.getAct().getProcInsId(), "", "nqfpjsy");
			sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createText(UserUtils.getUser().getName(), "", "公务用车", "已反馈回院时间",Apply.getName());
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), UserUtils.getByLoginName(sjbz.get(0).getAssignee()).getId(), "", ApiConfigKit.getAgentId(), ""));
		}
		// 提交流程任务
		vars.put("pass", "1".equals(paiche.getAct().getFlag())? "1" : "0");
		paiche.getAct().setComment(ActUtils.getComment(paiche.getAct().getFlag(), paiche.getAct().getComment()));
		//提交流程并提交任务意见
		actTaskService.complete(paiche.getAct().getTaskId(), paiche.getAct().getProcInsId(), ActUtils.getComment(paiche.getAct().getFlag(), paiche.getAct().getComment()), vars);
		//ProcessInstance pi=actTaskService.getProcIns(qingjia.getAct().getProcInsId());
		//流程是否结束
		if(CollectionUtils.isEmpty(actTaskService.getCurrentTaskList(paiche.getAct().getProcInsId()))){
			paiche.setStatus(paiche.getAct().getComment());
			super.save(paiche);
			if(paiche.getAct().getFlag().equals("1"))return;
		}
		sendNextAssign(paiche.getAct().getProcInsId(),UserUtils.get(paiche.getUser().getId()).getName());
		//向申请者发送提示
	//	SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), qingjia.getUser().getId(), "", ApiConfigKit.getAgentId(), ""));
		//应向下一步执行人发送审批通知
	}
	
	@Transactional(readOnly = false)
	public void delete(Paiche paiche) {
		super.delete(paiche);
	}
	
	public void sendNextAssign(String proInsId,String supplyName){
		if(actTaskService.getCurrentTaskList(proInsId)==null) return;
		List<Task>  tasks=actTaskService.getCurrentTaskList(proInsId);
		for(Task tk:tasks){
			TaskEntity task=(TaskEntity)tk;
			String assignName=task.getAssignee();
			if(StringUtils.isEmpty(assignName)){
				return;
			}
			String userId=UserUtils.getByLoginName(assignName).getId();
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),supplyName, "/shenpi/wode", "公务用车");
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
		}
		
	}
	public void sendApply(String proInsId,String supplyName){
		if(actTaskService.getCurrentTask(proInsId)==null) return;
		String assignName=actTaskService.getCurrentTask(proInsId).getAssignee();
		if(StringUtils.isEmpty(assignName)) return;
		String userId=UserUtils.getByLoginName(assignName).getId();
		String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextShenpi(UserUtils.getUser().getName(),supplyName, "/shenpi/wode", "公务用车");
		SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
	}
	/**
	 * user 为空则 查询当前用户
	 * @param user
	 * @return 返回申请人角色ename
	 */
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
			if(r.getEnname().equals("fgld")||r.getEnname().equals("yld")){
				r.setEnname("fgld");
				return r;
			}
			if(r.getEnname().equals("jwbzb_ld")){
				if(!roleStr.contains("fgld"))
					return r;
			};
			if(r.getEnname().equals("bmld")){
				if(!roleStr.contains("fgld")||!roleStr.contains("jwbzb_ld"))
					return r;
			};
		}
		
		
		return role;
	}
}