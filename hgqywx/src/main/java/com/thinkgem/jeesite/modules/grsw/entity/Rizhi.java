/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.grsw.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 日志的增删改查Entity
 * @author 刘伟
 * @version 2018-11-15
 */
public class Rizhi extends DataEntity<Rizhi> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 添加人员ID
	private String userName;		// 添加人姓名
	private String workToday;		// 今日工作
	private String workTomorrow;		// 明日工作
	private String other;		// 其他事项
	private String filepath;		// 附件
	private String report;		// 被汇报人
	
	
	public Rizhi() {
		super();
	}

	public Rizhi(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=64, message="添加人姓名长度必须介于 0 和 64 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=2000, message="今日工作长度必须介于 0 和 2000 之间")
	public String getWorkToday() {
		return workToday;
	}

	public void setWorkToday(String workToday) {
		this.workToday = workToday;
	}
	
	@Length(min=0, max=2000, message="明日工作长度必须介于 0 和 2000 之间")
	public String getWorkTomorrow() {
		return workTomorrow;
	}

	public void setWorkTomorrow(String workTomorrow) {
		this.workTomorrow = workTomorrow;
	}
	
	@Length(min=0, max=2000, message="其他事项长度必须介于 0 和 2000 之间")
	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
	@Length(min=0, max=200, message="附件长度必须介于 0 和 200 之间")
	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	@Length(min=0, max=200, message="被汇报人长度必须介于 0 和 200 之间")
	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}
	
}