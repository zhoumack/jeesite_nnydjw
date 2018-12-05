/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.grsw.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 日程安排Entity
 * @author szx
 * @version 2018-11-15
 */
public class Richeng extends DataEntity<Richeng> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 添加人员ID
	private String userName;		// 添加人姓名
	private String theme;		// 日程主题
	private Date startTime;		// 开始时间
	private Date endTime;		// 结束时间
	private String addr;		// 地点
	private String content;		// 日程详情
	private String people;		// 参与人
	
	public Richeng() {
		super();
	}

	public Richeng(String id){
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
	
	@Length(min=0, max=2000, message="日程主题长度必须介于 0 和 2000 之间")
	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
	
	@Length(min=0, max=640, message="地点长度必须介于 0 和 640 之间")
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@Length(min=0, max=640, message="日程详情长度必须介于 0 和 640 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=640, message="参与人长度必须介于 0 和 640 之间")
	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}
	
}