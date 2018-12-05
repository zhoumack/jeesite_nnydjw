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
public class InAddressEvent extends EventInMsg {
	public static final String EVENT_CREATE_USER="create_user";
	public static final String EVENT_UPDATE_USER="update_user";
	public static final String EVENT_DELETE_USER="delete_user";
	public static final String EVENT_CREATE_PARTY="create_party";
	public static final String EVENT_UPDATE_PARTY="update_party";
	public static final String EVENT_DELETE_PARTY="delete_party";
	String changeType;// 通讯录变更事件类型
	public InAddressEvent(XmlHelper xmlHelper,String toUserName, String fromUserName, Integer createTime, String msgType, String event,
			String agentId) {
		
		super(toUserName, fromUserName, createTime, msgType, event, agentId);
		this.changeType	= xmlHelper.getString("//ChangeType");
		// TODO Auto-generated constructor stub
	}
	public InAddressEvent() {
	}
	public String getChangeType() {
		return changeType;
	}
	public void setChangeType(String changeType) {
		this.changeType = changeType;
	}


}
