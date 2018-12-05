/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.persistence;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.modules.act.entity.Act;

/**
 * Activiti Entity类
 * @author ThinkGem
 * @version 2013-05-28
 */
public abstract class ActEntity<T> extends DataEntity<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Act act; 		// 流程任务对象
	private String ActType;
//	private String taskRemark; //流程意见
	private String taskApprove;//流程中加签人
	
	
	public String getTaskApprove() {
		return taskApprove;
	}

	public void setTaskApprove(String taskApprove) {
		this.taskApprove = taskApprove;
	}
//
//	public String getTaskRemark() {
//		return taskRemark;
//	}
//
//	public void setTaskRemark(String taskRemark) {
//		this.taskRemark = taskRemark;
//	}
//
	public String getActType() {
		return ActType;
	}

	public void setActType(String actType) {
		ActType = actType;
	}
	public ActEntity() {
		super();
	}
	
	public ActEntity(String id) {
		super(id);
	}
	
	@JsonIgnore
	public Act getAct() {
		if (act == null){
			act = new Act();
		}
		return act;
	}

	public void setAct(Act act) {
		this.act = act;
	}

	/**
	 * 获取流程实例ID
	 * @return
	 */
	public String getProcInsId() {
		return this.getAct().getProcInsId();
	}

	/**
	 * 设置流程实例ID
	 * @param procInsId
	 */
	public void setProcInsId(String procInsId) {
		this.getAct().setProcInsId(procInsId);
	}
}
