/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 请假天数标准Entity
 * @author szx
 * @version 2018-10-11
 */
public class Qjtsbz extends DataEntity<Qjtsbz> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 请假类型
	private String level;		// 级别
	private float daynums;		// 请假天数
	
	public Qjtsbz() {
		super();
	}

	public Qjtsbz(String id){
		super(id);
	}

	@Length(min=0, max=30, message="请假类型长度必须介于 0 和 30 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public float getDaynums() {
		return daynums;
	}

	public void setDaynums(float daynums) {
		this.daynums = daynums;
	}
	
}