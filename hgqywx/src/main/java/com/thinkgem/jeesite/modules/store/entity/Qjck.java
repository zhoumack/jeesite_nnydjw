/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 请假仓库记录Entity
 * @author szx
 * @version 2018-10-24
 */
public class Qjck extends DataEntity<Qjck> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 请假人id
	private String userName;		// 请假人姓名
	private String type;		// 请假类型
	private String level;		// 级别
	private float days;		// 天数标准
	private float restdays;		// 剩余天数
	private String sort;		// 排序编号
	private String year;		// 年份
	private String month;		// 月份
	
	public Qjck() {
		super();
	}

	public Qjck(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=30, message="请假人姓名长度必须介于 0 和 30 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=30, message="请假类型长度必须介于 0 和 30 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=20, message="级别长度必须介于 0 和 20 之间")
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	
	
	public float getDays() {
		return days;
	}

	public void setDays(float days) {
		this.days = days;
	}

	public float getRestdays() {
		return restdays;
	}

	public void setRestdays(float restdays) {
		this.restdays = restdays;
	}

	@Length(min=0, max=11, message="排序编号长度必须介于 0 和 11 之间")
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	@Length(min=0, max=4, message="年份长度必须介于 0 和4 之间")
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	@Length(min=0, max=2, message="月份长度必须介于 0 和 2 之间")
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	
}