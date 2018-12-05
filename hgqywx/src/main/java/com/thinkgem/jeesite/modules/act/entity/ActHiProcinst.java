/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 实例processEntity
 * @author zhou
 * @version 2018-11-21
 */
public class ActHiProcinst  extends BaseEntity<ActHiProcinst>{
	
	private static final long serialVersionUID = 1L;
	private String procInstId;		// proc_inst_id_
	private String businessKey;		// business_key_
	private String procDefId;		// proc_def_id_
	private Date startTime;		// start_time_
	private Date endTime;		// end_time_
	private Long duration;		// duration_
	private String startUserId;		// start_user_id_
	private String startActId;		// start_act_id_
	private String endActId;		// end_act_id_
	private String superProcessInstanceId;		// super_process_instance_id_
	private String deleteReason;		// delete_reason_
	private String tenantId;		// tenant_id_
	private String name;		// name_
	private boolean finish;
	private User user;
	





	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public boolean isFinish() {
		return finish;
	}


	public void setFinish(boolean finish) {
		this.finish = finish;
	}


	public ActHiProcinst() {
		super();
	}


	@Length(min=1, max=64, message="proc_inst_id_长度必须介于 1 和 64 之间")
	public String getProcInstId() {
		return procInstId;
	}

	public void setProcInstId(String procInstId) {
		this.procInstId = procInstId;
	}
	
	@Length(min=0, max=255, message="business_key_长度必须介于 0 和 255 之间")
	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}
	
	@Length(min=1, max=64, message="proc_def_id_长度必须介于 1 和 64 之间")
	public String getProcDefId() {
		return procDefId;
	}

	public void setProcDefId(String procDefId) {
		this.procDefId = procDefId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="start_time_不能为空")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	public Long getDuration() {
		return duration;
	}

	public void setDuration(Long duration) {
		this.duration = duration;
	}
	
	@Length(min=0, max=255, message="start_user_id_长度必须介于 0 和 255 之间")
	public String getStartUserId() {
		return startUserId;
	}

	public void setStartUserId(String startUserId) {
		this.startUserId = startUserId;
	}
	
	@Length(min=0, max=255, message="start_act_id_长度必须介于 0 和 255 之间")
	public String getStartActId() {
		return startActId;
	}

	public void setStartActId(String startActId) {
		this.startActId = startActId;
	}
	
	@Length(min=0, max=255, message="end_act_id_长度必须介于 0 和 255 之间")
	public String getEndActId() {
		return endActId;
	}

	public void setEndActId(String endActId) {
		this.endActId = endActId;
	}
	
	@Length(min=0, max=64, message="super_process_instance_id_长度必须介于 0 和 64 之间")
	public String getSuperProcessInstanceId() {
		return superProcessInstanceId;
	}

	public void setSuperProcessInstanceId(String superProcessInstanceId) {
		this.superProcessInstanceId = superProcessInstanceId;
	}
	
	@Length(min=0, max=4000, message="delete_reason_长度必须介于 0 和 4000 之间")
	public String getDeleteReason() {
		return deleteReason;
	}

	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}
	
	@Length(min=0, max=255, message="tenant_id_长度必须介于 0 和 255 之间")
	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}
	
	@Length(min=0, max=255, message="name_长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	@Override
	public void preInsert() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void preUpdate() {
		// TODO Auto-generated method stub
		
	}
	
}