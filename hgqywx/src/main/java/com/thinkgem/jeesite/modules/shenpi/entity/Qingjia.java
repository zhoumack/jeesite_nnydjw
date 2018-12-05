/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 请假申请Entity
 * @author szx
 * @version 2018-08-22
 */
public class Qingjia extends ActEntity<Qingjia> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 申请人id
	private String userName;		// 申请人
	private String type;		// 请假类型
	private Date starttime;		// 开始时间
	private Date endtime;		// 结束时间
	private float totaldays;		// 请假时长
	private String reason;		// 请假事由
	private String approve;		// 审批人
	private String copy;		// 抄送人
	private String status;		// 审批状态
	private String filepath;		// 附件
	private String url;			//流程响应流程
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Qingjia() {
		super();
		super.setActType("请假");
	}

	public Qingjia(String id){
		super(id);
		super.setActType("请假");
	}

	//@NotNull(message="申请人id不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=20, message="申请人长度必须介于 1 和 20 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=1, max=30, message="请假类型长度必须介于 1 和 30 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	//@NotNull(message="开始时间不能为空")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	//@NotNull(message="结束时间不能为空")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	public float getTotaldays() {
		return totaldays;
	}

	public void setTotaldays(float totaldays) {
		this.totaldays = totaldays;
	}
	
	@Length(min=1, max=255, message="请假事由长度必须介于 1 和 255 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=1, max=64, message="审批人长度必须介于 1 和 64之间")
	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}
	
	@Length(min=0, max=20, message="抄送人长度必须介于 0 和 20 之间")
	public String getCopy() {
		return copy;
	}

	public void setCopy(String copy) {
		this.copy = copy;
	}
	
	@Length(min=1, max=30, message="审批状态长度必须介于 1 和 30 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	//	@Length(min=1, max=200, message="url人长度必须介于 1 和 200 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}