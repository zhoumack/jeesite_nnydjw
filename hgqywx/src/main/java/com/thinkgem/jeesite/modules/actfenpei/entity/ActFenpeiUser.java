/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.actfenpei.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 任务执行人记录Entity
 * @author zyl
 * @version 2018-11-01
 */
public class ActFenpeiUser extends DataEntity<ActFenpeiUser> {
	
	private static final long serialVersionUID = 1L;
	private User applyUserId;		// 任务提供人id
	private Office office;		// 部门id
	private User user;		// 用户id
	private Date starttime;		// 开始时间
	private Date endtime;		// 结束时间
	private String taskComment;		// 任务批注
	private String taskRemarks;		// 任务备注
	private String procDefKey;		// 流程定义Key
	private String procInsId;		// 工作流实例id
	private String taskId;		// 任务id
	
	public ActFenpeiUser() {
		super();
	}
	public ActFenpeiUser(String procDefKey,String procInsId,String taskId) {
		super();
		this.procDefKey=procDefKey;
		this.procInsId=procInsId;
		this.taskId=taskId;
	}
	public ActFenpeiUser(String procDefKey,String procInsId,String taskId,User user) {
		super();
		this.user=user;
		this.procDefKey=procDefKey;
		this.procInsId=procInsId;
		this.taskId=taskId;
	}
	public ActFenpeiUser(String id){
		super(id);
	}

	public User getApplyUserId() {
		return applyUserId;
	}

	public void setApplyUserId(User applyUserId) {
		this.applyUserId = applyUserId;
	}
	
	@NotNull(message="部门id不能为空")
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	@Length(min=0, max=255, message="任务批注长度必须介于 0 和 255 之间")
	public String getTaskComment() {
		return taskComment;
	}

	public void setTaskComment(String taskComment) {
		this.taskComment = taskComment;
	}
	
	@Length(min=0, max=255, message="任务备注长度必须介于 0 和 255 之间")
	public String getTaskRemarks() {
		return taskRemarks;
	}

	public void setTaskRemarks(String taskRemarks) {
		this.taskRemarks = taskRemarks;
	}
	
	@Length(min=0, max=64, message="流程定义Key长度必须介于 0 和 64 之间")
	public String getProcDefKey() {
		return procDefKey;
	}

	public void setProcDefKey(String procDefKey) {
		this.procDefKey = procDefKey;
	}
	
	@Length(min=0, max=64, message="工作流实例id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
	@Length(min=0, max=64, message="任务id长度必须介于 0 和 64 之间")
	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	
}