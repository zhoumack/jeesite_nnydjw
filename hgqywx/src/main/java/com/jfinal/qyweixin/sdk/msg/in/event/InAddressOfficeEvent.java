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
public class InAddressOfficeEvent extends InAddressEvent {
	public static final String EVENT_CREATE_PARTY="create_party";
	public static final String EVENT_UPDATE_PARTY="update_party";
	public static final String EVENT_DELETE_PARTY="delete_party";
	String parentId;
	String name;
	Integer order;
	String id;
	public InAddressOfficeEvent(XmlHelper xmlHelper,String toUserName, String fromUserName, Integer createTime, String msgType, String event,
			String agentId) {
		super(xmlHelper,toUserName, fromUserName, createTime, msgType, event, agentId);
	//	this.changeType	= xmlHelper.getString("//ChangeType");
		this.parentId	= xmlHelper.getString("//ParentId");
		this.name	= xmlHelper.getString("//Name");
		this.order= xmlHelper.getNumber("//Order").intValue();
		this.id	= xmlHelper.getString("//Id");
	}
	public InAddressOfficeEvent() {
		// TODO Auto-generated constructor stub
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
