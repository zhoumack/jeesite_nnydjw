/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 审批Entity
 * @author szx
 * @version 2018-08-22
 */
public class Approve extends DataEntity<Approve> {
	
	private static final long serialVersionUID = 1L;
	private String taskId;		// task_id
	private String procinsId;		// procins_id
	private String status;		// status
	private String title;		// title
	
	public Approve() {
		super();
	}

	public Approve(String id){
		super(id);
	}

	@Length(min=0, max=80, message="task_id长度必须介于 0 和 80 之间")
	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	
	@Length(min=0, max=80, message="procins_id长度必须介于 0 和 80 之间")
	public String getProcinsId() {
		return procinsId;
	}

	public void setProcinsId(String procinsId) {
		this.procinsId = procinsId;
	}
	
	@Length(min=0, max=30, message="status长度必须介于 0 和 30 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=80, message="title长度必须介于 0 和 80 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}