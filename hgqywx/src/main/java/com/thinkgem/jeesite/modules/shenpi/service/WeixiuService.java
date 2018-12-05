/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.api.SendMessageApi;
import com.jfinal.qyweixin.sdk.msg.send.QiYeTextMsg;
import com.thinkgem.jeesite.common.mapper.ParseJsonUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.shenpi.entity.Weixiu;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.shenpi.dao.WeixiuDao;

/**
 * 维修申请Service
 * @author szx
 * @version 2018-10-16
 */
@Service
@Transactional(readOnly = true)
public class WeixiuService extends CrudService<WeixiuDao, Weixiu> {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private SystemService sysService;
	@Autowired
	private UserDao userDao;
	
	public Weixiu get(String id) {
		return super.get(id);
	}
	public List<Weixiu> findCaoSongList(Weixiu weixiu) {
		return dao.findCaoSongList(weixiu);
	}
	public List<Weixiu> findList(Weixiu weixiu) {
		return super.findList(weixiu);
	}
	
	public Page<Weixiu> findPage(Page<Weixiu> page, Weixiu weixiu) {
		return super.findPage(page, weixiu);
	}
	
	@Transactional(readOnly = false)
	public void save(Weixiu weixiu) {
		// 申请发起
		if (StringUtils.isBlank(weixiu.getId())){
			weixiu.setStatus("流程中");
			//通过preInsert（)获取新增的id
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("startUser", UserUtils.getUser().getName());
			
			weixiu.preInsert();
			weixiu.setIsNewRecord(true);
			String actProId="";
			if(weixiu.getUserName()==null||weixiu.getUserName().equals("")) {
				weixiu.setUser(UserUtils.getUser());
				actProId=actTaskService.startProcess(ActUtils.PD_SBWX[0], ActUtils.PD_SBWX[1], weixiu.getId(),"设备维修",vars );
				
			}else {
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(weixiu.getUserName());
				List<String> users=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				String trusterId=users.get(0);
				weixiu.setTruster(UserUtils.get(trusterId));
				weixiu.setUserName(weixiu.getUser().getName());
				actProId=actTaskService.startProcess(ActUtils.PD_SBWX[0], ActUtils.PD_SBWX[1], weixiu.getId(),"设备维修",vars );
			}
			//设置流程实例id
			weixiu.getAct().setProcInsId(actProId);
			weixiu.setProcInsId(actProId);
			weixiu.getAct().setVars(vars);
			//设置流程状态
			try {
				auditSave(weixiu);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 重新编辑申请		
		else{
			weixiu.getAct().setComment(("1".equals(weixiu.getAct().getFlag())?"[同意] ":"[销毁] "));
			// 完成流程任务
			Map<String, Object> vars = Maps.newHashMap();
			//vars.put("pass", "1".equals(weixiu.getAct().getFlag())? "0" : "1");
			actTaskService.complete(weixiu.getAct().getTaskId(), weixiu.getAct().getProcInsId(), weixiu.getAct().getComment(), "设备维修", vars);
			super.save(weixiu);
		}
		
	}
	/**
	 * 审核审批保存
	 * @param testAudit
	 * @throws Exception 
	 */
	@Transactional(readOnly = false)
	public void auditSave(Weixiu weixiu) throws Exception {
		// 对不同环节的业务逻辑进行操作
		String taskDefKey = weixiu.getAct().getTaskDefKey();
		if(StringUtils.isEmpty(taskDefKey)){
			TaskEntity task=actTaskService.getCurrentTask(weixiu.getAct().getProcInsId());
			weixiu.getAct().setTask(task);
			taskDefKey=task.getTaskDefinitionKey();
		}
		Map<String, Object> vars = Maps.newHashMap();
		//向申请者发送消息
		String sendTest="";
		super.save(weixiu);
		// 审核环节
		if ("audit".equals(taskDefKey)){
			vars.putAll(weixiu.getAct().getVars().getMap());
			 //sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(v[0], "/shenpi/wode", "请假");
			actTaskService.completeFirstTask(weixiu.getAct().getProcInsId(), "[申请]","设备维修", vars);
			List<User> users=userDao.findUserByRoleEnname("jwbzb_nq");
			List<String> usersIds=new ArrayList<String>();
			for(int i=0;i<users.size();i++){
				usersIds.add(users.get(i).getId());
			}
			//sendNextAssign(paiche.getAct().getProcInsId(),UserUtils.get(paiche.getUser().getId()).getName());
			String sendTest2=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),UserUtils.get(weixiu.getUser().getId()).getName(), "/shenpi/wode", "设备维修");
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest2), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
			return;
		}else if("audit2".equals(taskDefKey)){
			if(weixiu.getWorker()!=null&&!weixiu.getWorker().equals("")) {
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(weixiu.getWorker());
				List<String> zxrs=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				String zxr=zxrs.get(0);
				vars.put("zxr", zxr);		
				//vars.putAll(weixiu.getAct().getVars().getMap());
				sendNextAssign(weixiu.getAct().getProcInsId(),UserUtils.get(weixiu.getUser().getId()).getName());
			}
			
		}else if("audit3".equals(taskDefKey)){
			Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(weixiu.getWorker());
			List<String> zxr=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
			vars.put("zxr", zxr);		
			//vars.putAll(weixiu.getAct().getVars().getMap());			
			vars.put("isPass", weixiu.getAct().getFlag());
			String userId=UserUtils.getUser().getId();
			
		}else{// 未知环节，直接返回
			return;
		}
		// 提交流程任务
		vars.put("pass", "1".equals(weixiu.getAct().getFlag())? "1" : "0");
		weixiu.getAct().setComment("1".equals(weixiu.getAct().getFlag()) ? "同意 " : "不同意");
		actTaskService.complete(weixiu.getAct().getTaskId(), weixiu.getAct().getProcInsId(), weixiu.getAct().getComment(), vars);
		//ProcessInstance pi=actTaskService.getProcIns(qingjia.getAct().getProcInsId());
		sendNextAssign(weixiu.getAct().getProcInsId(),UserUtils.get(weixiu.getUser().getId()).getName());
		processEnd(weixiu);
		//向申请者发送提示
	//	SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), qingjia.getUser().getId(), "", ApiConfigKit.getAgentId(), ""));
		//应向下一步执行人发送审批通知
	}
	@Transactional(readOnly = false)
	public void delete(Weixiu weixiu) {
		super.delete(weixiu);
	}
	public void sendNextAssign(String proInsId,String applyName){
		if(actTaskService.getCurrentTask(proInsId)==null) return;
		String assignName=actTaskService.getCurrentTask(proInsId).getAssignee();
		if(StringUtils.isEmpty(assignName)) return;
		String userId=UserUtils.getByLoginName(assignName).getId();
		String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),applyName, "/shenpi/wode", "设备维修");
		SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
	}
	public void processEnd(Weixiu weixiu){
		if(actTaskService.getCurrentTask(weixiu.getAct().getProcInsId())==null){
			weixiu.setStatus(weixiu.getAct().getComment());
			super.save(weixiu);
			List<Act> actList =actTaskService.histoicFlowList(weixiu.getAct().getProcInsId(),"audit", "end");
			List<String> usersIds=new ArrayList<String>();
			Date actBeginDate = new Date();
			for(int i=0;i<actList.size();i++){
				if(i==0) actBeginDate=actList.get(i).getHistIns().getStartTime();
				if(StringUtils.isNoneBlank(actList.get(i).getAssignee()))
					usersIds.add(UserUtils.getByLoginName(actList.get(i).getAssignee()).getId());
			}
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createResultText(actBeginDate,
					UserUtils.get(weixiu.getUser().getId()).getName(),"1".equals(weixiu.getAct().getFlag())? "已处理" : "未处理", "设备维修");
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
		}
	}
	
}