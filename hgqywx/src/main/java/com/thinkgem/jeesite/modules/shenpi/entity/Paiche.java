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
 * 派车申请Entity
 * @author zyl
 * @version 2018-11-01
 */
public class Paiche extends ActEntity<Paiche> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 申请人id
	private String userName;		// 申请人
	private String type;		// 用车类别
	private String pnums;		// 用车人数
	private String driver;		// 驾驶员
	private Date starttime;		// 出发时间
	private Date endtime;		// 结束时间
	private String totaltime;		// 用车时长
	private String startplace;		// 出车地点
	private String direction;		// 用车目的地
	private String iscommon;		// 是否正常用车 1是 0否
	private String islocaluser;		// 是否搭乘非本院人员 1是  0否
	private String dcrybz;		//搭乘人员备注，姓名及原因
	private String event;		// 用车事由
	private String placeUsers;		// 搭乘地点及搭乘人员情况
	private String filepath;		// 附件
	private String approve;		// 审批人
	private String copy;		// 抄送人
	private String status;		// 申请状态
	private String url;		// 流程响应路径
	private String procInsId;		// 工作流实例id
	private String driverPhone;		// 驾驶员电话
	private String carNumeber;		// 车牌号
	private Date hysj;		// 回院时间
	
	
	public String getDriverPhone() {
		return driverPhone;
	}

	public void setDriverPhone(String driverPhone) {
		this.driverPhone = driverPhone;
	}

	public String getCarNumeber() {
		return carNumeber;
	}

	public void setCarNumeber(String carNumeber) {
		this.carNumeber = carNumeber;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getHysj() {
		return hysj;
	}

	public void setHysj(Date hysj) {
		this.hysj = hysj;
	}

	public String getIslocaluser() {
		return islocaluser;
	}

	public void setIslocaluser(String islocaluser) {
		this.islocaluser = islocaluser;
	}

	public Paiche() {
		super();
		super.setActType("派车");
	}

	public Paiche(String id){
		super(id);
		super.setActType("派车");
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
	
	@Length(min=0, max=30, message="用车类别长度必须介于 0 和 30 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=11, message="用车人数长度必须介于 0 和 11 之间")
	public String getPnums() {
		return pnums;
	}

	public void setPnums(String pnums) {
		this.pnums = pnums;
	}
	
	@Length(min=0, max=20, message="驾驶员长度必须介于 0 和 20 之间")
	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
	public String getTotaltime() {
		return totaltime;
	}

	public void setTotaltime(String totaltime) {
		this.totaltime = totaltime;
	}
	
	//@Length(min=0, max=40, message="出车地点长度必须介于 0 和 40 之间")
	public String getStartplace() {
		return startplace;
	}

	public void setStartplace(String startplace) {
		this.startplace = startplace;
	}
	
	//@Length(min=0, max=40, message="用车目的地长度必须介于 0 和 40 之间")
	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}
	
	//@Length(min=0, max=1, message="是否正常用车长度必须介于 0 和 1 之间")
	public String getIscommon() {
		return iscommon;
	}

	public void setIscommon(String iscommon) {
		this.iscommon = iscommon;
	}
	
	@Length(min=0, max=255, message="用车事由长度必须介于 0 和 255 之间")
	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}
	
	@Length(min=0, max=255, message="搭乘地点及搭乘人员情况长度必须介于 0 和 255 之间")
	public String getPlaceUsers() {
		return placeUsers;
	}

	public void setPlaceUsers(String placeUsers) {
		this.placeUsers = placeUsers;
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

	public String getDcrybz() {
		return dcrybz;
	}

	public void setDcrybz(String dcrybz) {
		this.dcrybz = dcrybz;
	}
	
	
	
}