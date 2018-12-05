/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.entity;

import com.thinkgem.jeesite.modules.store.entity.TBgyp;
import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 办公用品领取申请Entity
 * @author szx
 * @version 2018-10-17
 */
public class Bgyplq extends ActEntity<Bgyplq> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 申请人id
	private String userName;		// 申请人
	private String usefor;		// 用途
	private String bgypId;			//物品
	private String item;		// 物品名称
	private int itemnums;		// 物品数量
	private Date date;		// 领用时间
	private String filepath;		// 附件
	private String approve;		// 审批人
	private String copy;		// 抄送人
	private String status;		// 申请状态
	private String url;		// 流程响应路径
	private String procInsId;		// 工作流实例id
	private String ActType;
	private String houseNumber;		// 门牌号
	private String esource; // 事件来源
	
	public Bgyplq() {
		super();
		this.ActType="办公用品";
	}

	public Bgyplq(String id){
		super(id);
		this.ActType="办公用品";
	}
	
	public String getActType() {
		return ActType;
	}

	public void setActType(String actType) {
		ActType = actType;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=20, message="申请人长度必须介于 0 和 20 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=50, message="用途长度必须介于 0 和 50 之间")
	public String getUsefor() {
		return usefor;
	}

	public void setUsefor(String usefor) {
		this.usefor = usefor;
	}

	public String getBgypId() {
		return bgypId;
	}

	public void setBgypId(String bgypId) {
		this.bgypId = bgypId;
	}

	@Length(min=0, max=30, message="物品名称长度必须介于 0 和 30 之间")
	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}
	
	public int getItemnums() {
		return itemnums;
	}

	public void setItemnums(int itemnums) {
		this.itemnums = itemnums;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
	
	@Length(min=0, max=30, message="申请状态长度必须介于 0 和 30 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=150, message="流程响应路径长度必须介于 0 和 150 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=64, message="工作流实例id长度必须介于 0 和 64 之间")
	public String getProcInsId() {
		return procInsId;
	}

	public void setProcInsId(String procInsId) {
		this.procInsId = procInsId;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}

	public String getEsource() {
		return esource;
	}

	public void setEsource(String esource) {
		this.esource = esource;
	}
	
}