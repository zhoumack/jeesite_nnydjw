/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 文件管理Entity
 * @author szx
 * @version 2018-10-14
 */
public class Wjgl extends DataEntity<Wjgl> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 文件上传人id
	private String procId;		// 所属业务id
	private String procType;	// 业务类型
	private String oldName;		// 原文件名
	private String name;		// 文件名
	private long uploadtime;	// 文件上传时间（精确到毫秒）
	private String path;		// 文件路径
	private String type;		// 文件类型
	private double size;		// 文件大小
	private String security;    // 安全级别
	
	public Wjgl() {
		super();
	}

	public Wjgl(String id){
		super(id);
	}
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Length(min=0, max=64, message="所属业务id长度必须介于 0 和 64 之间")
	public String getProcId() {
		return procId;
	}

	public void setProcId(String procId) {
		this.procId = procId;
	}
	
	public String getProcType() {
		return procType;
	}

	public void setProcType(String procType) {
		this.procType = procType;
	}

	public String getOldName() {
		return oldName;
	}

	public void setOldName(String oldName) {
		this.oldName = oldName;
	}

	@Length(min=0, max=50, message="文件名长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	public long getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(long uploadtime) {
		this.uploadtime = uploadtime;
	}

	@Length(min=0, max=100, message="文件路径长度必须介于 0 和 100 之间")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	@Length(min=0, max=20, message="文件类型长度必须介于 0 和 20 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public double getSize() {
		return size;
	}

	public void setSize(double size) {
		this.size = size;
	}

	public String getSecurity() {
		return security;
	}

	public void setSecurity(String security) {
		this.security = security;
	}
	
	
	
}