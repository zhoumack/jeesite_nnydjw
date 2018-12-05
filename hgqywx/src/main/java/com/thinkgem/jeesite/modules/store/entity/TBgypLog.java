/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 办公用品仓库记录Entity
 * @author wy
 * @version 2018-10-23
 */
public class TBgypLog extends DataEntity<TBgypLog> {
	
	private static final long serialVersionUID = 1L;
	private String bgypId;		// 办公用品id
	private String name;		// 办公用品名称
	private String inoutFlag;		// 出入库标识 字典表(inout_flag)
	private Long nums;		// 出入库数量
	private String remark;		// 备注信息
	
	public TBgypLog() {
		super();
	}

	public TBgypLog(String id){
		super(id);
	}

	@Length(min=1, max=64, message="办公用品id长度必须介于 1 和 64 之间")
	public String getBgypId() {
		return bgypId;
	}

	public void setBgypId(String bgypId) {
		this.bgypId = bgypId;
	}
	
	@Length(min=0, max=30, message="办公用品名称长度必须介于 0 和 30 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="出入库标识 字典表(inout_flag)长度必须介于 0 和 64 之间")
	public String getInoutFlag() {
		return inoutFlag;
	}

	public void setInoutFlag(String inoutFlag) {
		this.inoutFlag = inoutFlag;
	}
	
	public Long getNums() {
		return nums;
	}

	public void setNums(Long nums) {
		this.nums = nums;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}