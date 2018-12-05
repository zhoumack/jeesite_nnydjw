/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 维修申请Entity
 * @author szx
 * @version 2018-10-16
 */
public class Weixiu extends ActEntity<Weixiu> {
	
	private static final long serialVersionUID = 1L;
	private String esource; // 事件来源
	private User user;		// 申请人id
	private String userName;		// 申请人
	private User truster;	//委托人
	private String item;		// 故障设备名称
	private String event;		// 故障描述
	private Date date;		// 保修日期
	private double fee;		// 预计费用
	private String filepath;		// 附件
	private Date donedate;	//完成日期	
	private String worker;	// 执行人	
	private float cost; //涉及金额	
	private String result;	//处理结果
	private String approve;		// 审批人
	private String copy;		// 抄送人
	private String status;		// 申请状态
	private String url;		// 流程响应路径
	private String procInsId;		// 工作流实例id
	private String ActType;
	private String houseNumber;		// 门牌号
	public Weixiu() {
		super();
		this.ActType="维修";
	}

	public Weixiu(String id){
		super(id);
		this.ActType="维修";
	}

	public User getUser() {
		return user;
	}

	public String getActType() {
		return ActType;
	}

	public void setActType(String actType) {
		ActType = actType;
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
	
	
	public User getTruster() {
		return truster;
	}

	public void setTruster(User truster) {
		this.truster = truster;
	}

	@Length(min=0, max=50, message="故障设备名称长度必须介于 0 和 50 之间")
	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}
	
	@Length(min=0, max=255, message="故障描述长度必须介于 0 和 255 之间")
	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public double getFee() {
		return fee;
	}

	public void setFee(double fee) {
		this.fee = fee;
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

	public String getEsource() {
		return esource;
	}

	public void setEsource(String esource) {
		this.esource = esource;
	}

	public String getWorker() {
		return worker;
	}

	public void setWorker(String worker) {
		this.worker = worker;
	}

	public Date getDonedate() {
		return donedate;
	}

	public void setDonedate(Date donedate) {
		this.donedate = donedate;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getHouseNumber() {
		return houseNumber;
	}

	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
}