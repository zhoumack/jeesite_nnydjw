/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.SystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.api.OAuthApi;
import com.jfinal.qyweixin.sdk.api.SendMessageApi;
import com.jfinal.qyweixin.sdk.msg.send.QiYeTextMsg;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.mapper.ParseJsonUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.store.service.QjckService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService2;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.oa.entity.TestAudit;
import com.thinkgem.jeesite.modules.qywx.web.OAuthQywxiController;
import com.thinkgem.jeesite.modules.shenpi.dao.QingjiaDao;

/**
 * 请假申请Service
 * @author szx
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class QingjiaService extends CrudService<QingjiaDao, Qingjia> {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private ActTaskService2 actTaskService2;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private SystemService sysService;
	@Autowired
	private QjckService qjckService;
	@Autowired
	public Qingjia get(String id) {
		return super.get(id);
	}
	public List<Qingjia> findCaoSongList(Qingjia qingjia) {
		return dao.findCaoSongList(qingjia);
	}
	
	public List<Qingjia> findList(Qingjia qingjia) {
		return super.findList(qingjia);
	}
	
	public Page<Qingjia> findPage(Page<Qingjia> page, Qingjia qingjia) {
		return super.findPage(page, qingjia);
	}
	public User getLeader(Office office){
		User leader=officeService.get(office).getPrimaryPerson();
		leader=UserUtils.get(leader.getId());
		return leader;
	}
	@Transactional(readOnly = false)
	public void save(Qingjia qingjia) {

		// 申请发起
		if (StringUtils.isBlank(qingjia.getId())){
			qingjia.setStatus("流程中");
			//通过preInsert（)获取新增的id
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("startUser", UserUtils.getUser().getName());
			vars.put("typeBusiness", DictUtils.getDictLabel(qingjia.getType(), "qingjiaType", "其他"));
		//	qingjia.setReason(qingjia.getAct().getComment());
			// 启动流程
			qingjia.preInsert();
			qingjia.setIsNewRecord(true);
			String actProId=actTaskService.startProcess(ActUtils.PD_QingJia[0], ActUtils.PD_QingJia[1], qingjia.getId(),"请假申请",vars );
			//设置流程实例id
			qingjia.getAct().setProcInsId(actProId);
			qingjia.getAct().setVars(vars);
			//设置流程状态
			try {
				auditSave(qingjia);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 重新编辑申请		
		else{
			qingjia.getAct().setComment(("1".equals(qingjia.getAct().getFlag())?"[同意] ":"[销毁] "));
			// 完成流程任务
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("pass", "1".equals(qingjia.getAct().getFlag())? "1" : "0");
			actTaskService.complete(qingjia.getAct().getTaskId(), qingjia.getAct().getProcInsId(), qingjia.getAct().getComment(),"请假申请", vars);
			super.save(qingjia);
		}
		
	}
	/**
	 * 审核审批保存
	 * @param testAudit
	 * @throws Exception 
	 */
	@Transactional(readOnly = false)
	public void auditSave(Qingjia qingjia) throws Exception {
		// 对不同环节的业务逻辑进行操作
		String taskDefKey = qingjia.getAct().getTaskDefKey();
		if(StringUtils.isEmpty(taskDefKey)){
			TaskEntity task=actTaskService.getCurrentTask(qingjia.getAct().getProcInsId());
			qingjia.getAct().setTask(task);
			taskDefKey=task.getTaskDefinitionKey();
		}
		Map<String, Object> vars = Maps.newHashMap();
		//qingjia.getAct().setComment(("1".equals(qingjia.getAct().getFlag())?"[同意] ":"[销毁] "));
		//驳回撤销返回一步
		if(qingjia.getAct().getFlag().equals("3")){
			Map<String, Object> map=new HashMap<String, Object>();
			if(qingjia.getAct().getVars()!=null) map=qingjia.getAct().getVars().getMap();
			map.put("comment", "[驳回]");
			//actTaskService2.backProcess(qingjia.getAct().getTaskId(),qingjia.getAct().getProcInsId(), map);
			
			actTaskService.taskBack(qingjia.getAct().getProcInsId(), map);
			return;
		}
		//向申请者发送消息
		String sendTest="";
		// 审核环节
		if ("audit".equals(taskDefKey)){
			super.save(qingjia);
			Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getApprove());
			List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
			vars.put("dtLeader",  dtLeaders.get(0));
			vars.put("type",Integer.parseInt(qingjia.getType()));
			vars.put("title", "请假申请");
			vars.putAll(qingjia.getAct().getVars().getMap());
			TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
			qingjia.getAct().setTaskId(task.getId());
			actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
			 //sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(v[0], "/shenpi/wode", "请假");
			//actTaskService.completeFirstTask(qingjia.getAct().getProcInsId(), "申请","请假申请", vars);
		}else if(taskDefKey.contains("audit_nj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_nj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_sj")){//事假
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_sj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_bj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_bj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_tqj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_tqj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_hj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_hj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_cj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_cj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_hlj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_hlj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_gaj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_gaj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_sangj")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				//为加签前的任务节点添加任务意见
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_sangj", vars, isJiaQian(qingjia));
			}
		}else if(taskDefKey.contains("audit_qt")){
			if(StringUtils.isNoneBlank(isJiaQian(qingjia))){
				Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(qingjia.getTaskApprove());
				List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
				vars.put("dtLeader",  dtLeaders.get(0));
				TaskEntity task=actTaskService.getCurrentTask(qingjia.getProcInsId());
				//为加签前的任务节点添加任务意见
				actTaskService.addComment(task.getId(), qingjia.getProcInsId(), ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
				ActivityImpl[] acts=actTaskService.insertTasksAfter(actTaskService.getProcIns(qingjia.getAct().getProcInsId()).getProcessDefinitionId(), qingjia.getProcInsId(), "audit_qt", vars, isJiaQian(qingjia));
			}
		}else{// 未知环节，直接返回
			return;
		}
		if(StringUtils.isEmpty(isJiaQian(qingjia))){
			vars.put("pass", "2".equals(qingjia.getAct().getFlag())? "0" : qingjia.getAct().getFlag());
			qingjia.getAct().setComment(ActUtils.getComment(qingjia.getAct().getFlag(), qingjia.getAct().getComment()));
			actTaskService.complete(qingjia.getAct().getTaskId(), qingjia.getAct().getProcInsId(), qingjia.getAct().getComment(), vars);
		}
		sendNextAssign(qingjia.getAct().getProcInsId(),UserUtils.get(qingjia.getUser().getId()).getName());
		processEnd(qingjia);
		//		// 提交流程任务
		
		//加签
	
		//ProcessInstance pi=actTaskService.getProcIns(qingjia.getAct().getProcInsId());
//		processEnd(qingjia);
//		sendNextAssign(qingjia.getAct().getProcInsId(),UserUtils.get(qingjia.getUser().getId()).getName());
		//向申请者发送提示
	//	SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), qingjia.getUser().getId(), "", ApiConfigKit.getAgentId(), ""));
		//应向下一步执行人发送审批通知
	}
	/**
	 * 通知下一个执行人
	 * @param proInsId 流程实例id
	 */
	public void sendNextAssign(String proInsId,String supplyName){
		if(actTaskService.getCurrentTask(proInsId)==null) return;
		String assignName=actTaskService.getCurrentTask(proInsId).getAssignee();
		if(StringUtils.isEmpty(assignName)) return;
		String userId=UserUtils.getByLoginName(assignName).getId();
		String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),supplyName, "/shenpi/wode", "请假");
		SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
	}
	public Map parseStringJson(String jsonString){
		Map map=(Map) JsonMapper.fromJsonString(jsonString, Map.class);
		String departmentId=map.get("departmentId").toString();
		String userId=map.get("userId").toString();
		if(StringUtils.isNoneBlank(departmentId)) {
			List dep=Arrays.asList(departmentId.toCharArray());
			map.put("departmentId", dep);
		}
		if(StringUtils.isNoneBlank(userId)) {
			List uid=Arrays.asList(userId.toCharArray());
			map.put("userId", uid);
		}
		return map;
	}
	 
	public String isJiaQian(Qingjia qingjia){
		if(StringUtils.isNoneBlank(qingjia.getTaskApprove())){
			String approve=StringEscapeUtils.unescapeHtml4(qingjia.getTaskApprove());//appJson
			Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(approve);
			List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
			return dtLeaders.get(0);
		}
		return "";
	}
	public void processEnd(Qingjia qingjia){
		if(actTaskService.getCurrentTask(qingjia.getAct().getProcInsId())==null){
			qingjia.setStatus("结束");
			super.save(qingjia);
			if(qingjia.getAct().getFlag().equals("1")){
				//更新请假天数
				Qingjia qj=new Qingjia();
				qj.setUser(qingjia.getUser());
				qj.setType(qingjia.getType());
				qj.setTotaldays(qingjia.getTotaldays());
				qjckService.updateDays(qingjia);
			}
			List<Act> actList =actTaskService.histoicFlowList(qingjia.getAct().getProcInsId(),"audit", "end");
			List<String> usersIds=new ArrayList<String>();
			Date actBeginDate = new Date();
			for(int i=0;i<actList.size();i++){
				if(i==0) actBeginDate=actList.get(i).getHistIns().getStartTime();
				if(StringUtils.isNoneBlank(actList.get(i).getAssignee()))
					usersIds.add(UserUtils.getByLoginName(actList.get(i).getAssignee()).getId());
			}
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createResultText(actBeginDate,
					UserUtils.get(qingjia.getUser().getId()).getName(),ActUtils.parseToFlag(qingjia.getAct().getFlag()), "请假");
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
		}
	}
}