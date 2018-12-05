/**
 * Copyright (c) 2011-2015, Javen  (javenlife@126.com).
 *
 * Licensed under the Apache License, Version 1.0 (the "License");
 */
package com.jfinal.qyweixin.sdk.msg.in.event;

import com.jfinal.qyweixin.sdk.utils.XmlHelper;

/**
 * @author zhou
 * 通讯录变更事件
 * 
 * 
 */
public class InAddressUserEvent extends InAddressEvent {
	public static final String EVENT_CREATE_USER="create_user";
	public static final String EVENT_UPDATE_USER="update_user";
	public static final String EVENT_DELETE_USER="delete_user";
	String userID;	//成员UserID
	String name;	//成员名称
	String  department	;//成员部门列表
	String mobile	;//手机号码
	String position	;//职位信息。长度为0~64个字节
	String gender	;//性别，1表示男性，2表示女性
	String email	;//邮箱
	String status	;//激活状态：1=已激活 2=已禁用 4=未激活 已激活代表已激活企业微信或已关注微工作台（原企业号）。
	String avatar	;//头像url。注：如果要获取小图将url最后的”/0”改成”/100”即可。
	String englishName	;//英文名
	String isLeader	;//上级字段，标识是否为上级。0表示普通成员，1表示上级
	String telephone	;//座机
	String extAttr;
	public InAddressUserEvent(XmlHelper xmlHelper,String toUserName, String fromUserName, Integer createTime, String msgType, String event,
			String agentId) {
		super(xmlHelper,toUserName, fromUserName, createTime, msgType, event, agentId);
		this.changeType	= xmlHelper.getString("//ChangeType");
		this.userID	= xmlHelper.getString("//UserID");
		this.name	= xmlHelper.getString("//Name");
		this.department= xmlHelper.getString("//Department");
		this.mobile	= xmlHelper.getString("//Mobile");
		this.position	= xmlHelper.getString("//Position");
		this.gender	= xmlHelper.getString("//Gender");
		this.email	= xmlHelper.getString("//Email");
		this.status	= xmlHelper.getString("//Status");
		this.avatar	= xmlHelper.getString("//Avatar");
		this.englishName	= xmlHelper.getString("//EnglishName");
		this.isLeader	= xmlHelper.getString("//IsLeader");
		this.telephone	= xmlHelper.getString("//Telephone");
		this.extAttr	= xmlHelper.getString("//ExtAttr");
		
	}
	public InAddressUserEvent() {
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		userID = userID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		department = department;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		mobile = mobile;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		position = position;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		status = status;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		avatar = avatar;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		englishName = englishName;
	}
	public String getIsLeader() {
		return isLeader;
	}
	public void setIsLeader(String isLeader) {
		isLeader = isLeader;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		telephone = telephone;
	}
	public String getExtAttr() {
		return extAttr;
	}
	public void setExtAttr(String extAttr) {
		extAttr = extAttr;
	}

	
}
