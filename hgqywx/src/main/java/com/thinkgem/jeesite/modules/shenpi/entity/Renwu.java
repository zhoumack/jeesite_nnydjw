/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.entity;

import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;
import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;

/**
 * 任务安排Entity
 * @author 刘伟
 * @version 2018-11-28
 */
public class Renwu extends ActEntity<Renwu> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 任务负责人id
	private String userName;		// 负责人姓名
	private String theme;		// 任务主题
	private Date starttime;		// 开始时间
	private Date endtime;		// 结束时间
	private String plan;		// 任务内容
	private String push;		// 推送人
	private String place;		// 任务地点
	private String filepath;		// 附件
	private String approve;		// 审批人
	private String copy;		// 抄送人
	private String status;		// 任务状态
	private String procInsId;		// 工作流实例id
	private List<ActFenpeiUser> actFenpeiUsers;
	public Renwu() {
		super();
	}

	public List<ActFenpeiUser> getActFenpeiUsers() {
		return actFenpeiUsers;
	}

	public void setActFenpeiUsers(List<ActFenpeiUser> actFenpeiUsers) {
		this.actFenpeiUsers = actFenpeiUsers;
	}

	public Renwu(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=30, message="负责人姓名长度必须介于 0 和 30 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=100, message="任务主题长度必须介于 0 和 100 之间")
	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
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
	
	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	@Length(min=0, max=15, message="推送人长度必须介于 0 和 15 之间")
	public String getPush() {
		return push;
	}

	public void setPush(String push) {
		this.push = push;
	}
	
	@Length(min=0, max=50, message="任务地点长度必须介于 0 和 50 之间")
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}
	
	@Length(min=0, max=1000, message="附件长度必须介于 0 和 1000 之间")
	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	@Length(min=0, max=640, message="审批人长度必须介于 0 和 640 之间")
	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}
	
	@Length(min=0, max=640, message="抄送人长度必须介于 0 和 640 之间")
	public String getCopy() {
		return copy;
	}

	public void setCopy(String copy) {
		this.copy = copy;
	}
	
	@Length(min=0, max=30, message="任务状态长度必须介于 0 和 30 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=64, message="工作流实例id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}
	
}