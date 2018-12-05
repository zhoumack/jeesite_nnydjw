/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.poi.hssf.model.WorkbookRecordList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.google.common.collect.Maps;
import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.api.SendMessageApi;
import com.jfinal.qyweixin.sdk.msg.send.QiYeTextMsg;
import com.jfinal.qyweixin.sdk.msg.send.Text;
import com.thinkgem.jeesite.common.mapper.ParseJsonUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.shenpi.entity.Bgyplq;
import com.thinkgem.jeesite.modules.store.service.TBgypService;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.shenpi.dao.BgyplqDao;

/**
 * 耗材配件领取申请Service
 * @author szx
 * @version 2018-10-17
 */
@Service
@Transactional(readOnly = true)
public class BgyplqService extends CrudService<BgyplqDao, Bgyplq> {
	
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private SystemService sysService;
	@Autowired
	private TBgypService bgypService;
	@Autowired
	private UserDao userDao;

	public Bgyplq get(String id) {
		return super.get(id);
	}
	
	public List<Bgyplq> findList(Bgyplq bgyplq) {
		return super.findList(bgyplq);
	}
	
	public List<Bgyplq> findCaoSongList(Bgyplq bgyplq) {
		return dao.findCaoSongList(bgyplq);
	}
	public Page<Bgyplq> findPage(Page<Bgyplq> page, Bgyplq bgyplq) {
		return super.findPage(page, bgyplq);
	}
	
	@Transactional(readOnly = false)
	public void save(Bgyplq bgyplq) {
		// 申请发起
		if (StringUtils.isBlank(bgyplq.getId())){
			bgyplq.setStatus("流程中");
			//通过preInsert（)获取新增的id
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("startUser", UserUtils.getUser().getName());
			bgyplq.preInsert();
			bgyplq.setIsNewRecord(true);
			// 启动流程
			String actProId=actTaskService.startProcess(ActUtils.PD_Bgyplq[0], ActUtils.PD_Bgyplq[1], bgyplq.getId(),UserUtils.getUser().getName()+"的耗材配件申请",vars );
			//设置流程实例id
			bgyplq.getAct().setProcInsId(actProId);
			bgyplq.setProcInsId(actProId);
			bgyplq.getAct().setVars(vars);
			//设置流程状态
			try {
				auditSave(bgyplq, null);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 重新编辑申请		
		else{
			bgyplq.getAct().setComment(("1".equals(bgyplq.getAct().getFlag())?"[同意] ":"[销毁] "));
			// 完成流程任务
			Map<String, Object> vars = Maps.newHashMap();
			vars.put("pass", "1".equals(bgyplq.getAct().getFlag())? "1" : "0");
			actTaskService.complete(bgyplq.getAct().getTaskId(), bgyplq.getAct().getProcInsId(), bgyplq.getAct().getComment(), UserUtils.getUser().getName()+"的耗材配件申请", vars);
			super.save(bgyplq);
		}
	}
	
	/**
	 * 审核审批保存
	 * @param testAudit
	 * @throws Exception 
	 */
	@Transactional(readOnly = false)
	public void auditSave(Bgyplq bgyplq,String worker) throws Exception {
		// 对不同环节的业务逻辑进行操作
		String taskDefKey = bgyplq.getAct().getTaskDefKey();
		if(StringUtils.isEmpty(taskDefKey)){
			TaskEntity task=actTaskService.getCurrentTask(bgyplq.getAct().getProcInsId());
			bgyplq.getAct().setTask(task);
			taskDefKey=task.getTaskDefinitionKey();
		}
		Map<String, Object> vars = Maps.newHashMap();
		//向申请者发送消息
		String sendTest="";
		super.save(bgyplq);
		// 审核环节
		if ("audit".equals(taskDefKey)){
			Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(bgyplq.getApprove());
//			List<String> dtLeaders=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
//			vars.put("dtLeaders",  dtLeaders);
			vars.putAll(bgyplq.getAct().getVars().getMap());
			 //sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(v[0], "/shenpi/wode", "请假");
			actTaskService.completeFirstTask(bgyplq.getAct().getProcInsId(), "[申请]","耗材配件", vars);
			sendNextAssign(bgyplq.getAct().getProcInsId(), taskDefKey, bgyplq);
			return;
		}else if("audit2".equals(taskDefKey)){
			String isPass = bgyplq.getAct().getFlag();
			vars.put("isPass", isPass);
			if ("1".equals(isPass)) {
				//设置任务执行人
				vars.put("zxr", getTaskAssigns(worker));
			}
		}
		else if("audit_ck".equals(taskDefKey)){ //出库环节
			String isPass = bgyplq.getAct().getFlag();
			vars.put("isPass", isPass);
			if ("1".equals(isPass)) {
				//确认领取 - 扣除库存
				bgypService.outLib(
						bgyplq.getBgypId(),
						bgyplq.getItemnums());
			}
		}
		else if("audit3".equals(taskDefKey)){ //用户确认领取实物
			String isPass = bgyplq.getAct().getFlag();
			vars.put("isPass", isPass);

		}else{// 未知环节，直接返回
			return;
		}
		//当前任务的执行人- 名字
		//String assignName=UserUtils.getByLoginName(actTaskService.getCurrentTask(bgyplq.getAct().getProcInsId()).getAssignee()).getName();
		
		// 提交流程任务
		vars.put("pass", "1".equals(bgyplq.getAct().getFlag())? "1" : "0");
		bgyplq.getAct().setComment("1".equals(bgyplq.getAct().getFlag()) ? "同意 " : "不同意");
		actTaskService.complete(bgyplq.getAct().getTaskId(), bgyplq.getAct().getProcInsId(), bgyplq.getAct().getComment(), vars);
		//ProcessInstance pi=actTaskService.getProcIns(qingjia.getAct().getProcInsId());
		//流程是否结束
		if(actTaskService.getCurrentTask(bgyplq.getAct().getProcInsId())==null){
			bgyplq.setStatus(bgyplq.getAct().getComment());
			super.save(bgyplq);
		}
		
		
		sendNextAssign(bgyplq.getAct().getProcInsId(), taskDefKey, bgyplq);
		//向申请者发送提示
	//	SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), qingjia.getUser().getId(), "", ApiConfigKit.getAgentId(), ""));
		//应向下一步执行人发送审批通知
	}
	
	@Transactional(readOnly = false)
	public void delete(Bgyplq bgyplq) {
		super.delete(bgyplq);
	}
	
	
	
	public void sendNextAssign(String proInsId,String taskDefKey, Bgyplq bgyplq){
		
		
		
        if("audit".equals(taskDefKey)){ // 申请阶段 发的信息
//        	String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextApply(UserUtils.getUser().getName(),applyUser, "/shenpi/wode", "耗材配件");
//    		SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
    		String applyUser = UserUtils.get(bgyplq.getUser().getId()).getName();//申请人
    		
    		//向内勤发送
    		List<User> users=userDao.findUserByRoleEnname("jwbzb_nq");
			List<String> usersIds=new ArrayList<String>();
			for(int i=0;i<users.size();i++){
				usersIds.add(users.get(i).getId());
			}
			String sendTest2=Text.createTextApply(UserUtils.getUser().getName(),applyUser, "/shenpi/wode", "耗材配件");
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new Text(sendTest2), StringUtils.join(usersIds.toArray(), "|"), "", ApiConfigKit.getAgentId(), ""));
		}
        if("audit2".equals(taskDefKey)){ // 审核阶段 发的信息
        	if(actTaskService.getCurrentTask(proInsId)==null) return;
    		String assignName=actTaskService.getCurrentTask(proInsId).getAssignee();
    		
        	if(StringUtils.isEmpty(assignName)) return;
    		String userId=UserUtils.getByLoginName(assignName).getId();//执行人id
    		String applyUser = UserUtils.get(bgyplq.getUser().getId()).getName();//申请人名字
    		
        	String isPass = bgyplq.getAct().getFlag();
			if ("1".equals(isPass)) {
				//同意的时候才发信息
				String sendTest=Text.createTextConfirm(UserUtils.getUser().getName(), "/shenpi/wode", "耗材配件");
	    		SendMessageApi.sendTextMsg(new QiYeTextMsg(new Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
			}
        	
		}
        if("audit_ck".equals(taskDefKey)){ //出库环节
        	if(actTaskService.getCurrentTask(proInsId)==null) return;
    		String assignName=actTaskService.getCurrentTask(proInsId).getAssignee();
    		
        	if(StringUtils.isEmpty(assignName)) return;
    		String userId=bgyplq.getUser().getId();//申请人id
    		String applyUser = UserUtils.get(bgyplq.getUser().getId()).getName();//申请人名字
    		
        	System.out.println("ID----------:"+bgyplq.getApprove()); 
        	String taskAssigns = getAdit(bgyplq); //流程审核人
        	if (StringUtils.isNotEmpty(taskAssigns)) {
				String sendTest=Text.createTextChuku(applyUser, "/shenpi/wode?dbOrYb=false", "耗材配件");
    		    SendMessageApi.sendTextMsg(new QiYeTextMsg(new Text(sendTest), taskAssigns+"|"+userId, "", ApiConfigKit.getAgentId(), ""));
			}
        }
        //申请人确认环节
		if ("audit3".equals(taskDefKey)){
			String applyUser = UserUtils.get(bgyplq.getUser().getId()).getName();//申请人
			List<HistoricTaskInstance> applylist=actTaskService.histoicList(
					bgyplq.getAct().getProcInsId(),
					"",
					"audit"); //取出申请环节的任务
			List<HistoricTaskInstance> list=actTaskService.histoicList(
					bgyplq.getAct().getProcInsId(),
					"",
					"audit2"); //取出审核环节的任务
			List<HistoricTaskInstance> listCk=actTaskService.histoicList(
					bgyplq.getAct().getProcInsId(),
					"",
					"audit_ck"); //取出出库环节的任务
			Date startTime = applylist.get(0).getStartTime();//流程申请时间
			
			String sendTest=Text.createResultText(startTime,
					applyUser,
					ActUtils.parseToFlag(bgyplq.getAct().getFlag()),
					"耗材配件");
			
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new Text(sendTest),
					UserUtils.getByLoginName(list.get(0).getAssignee()).getId()+"|"+UserUtils.getByLoginName(listCk.get(0).getAssignee()).getId(),
					"",
					ApiConfigKit.getAgentId(),
					""));

		}
	}
	
	/**
	 * 获取用户标识
	 * @param worker 
	 * @return
	 */
	private String getTaskAssigns(String worker){
		String workeruser=StringEscapeUtils.unescapeHtml4(worker);
		Map<String, List<String>>  map=ParseJsonUtils.parseStringJson(workeruser);
		List<String> zxrs=sysService.getAssigns(map.get("departmentId"), map.get("userId"));
		String zxr=zxrs.get(0);
		return zxr;
	}
	
	/**
	 * 流程审核人
	 * @param bgyplq
	 * @return
	 */
	private String getAdit(Bgyplq bgyplq){
		List<Act> actList =actTaskService.histoicFlowList(bgyplq.getProcInsId(),"audit2", "audit2");
		if (!CollectionUtils.isEmpty(actList)) {
			return actList.get(0).getAssignee();
		}
		return null;
	}


}