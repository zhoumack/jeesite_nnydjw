package com.thinkgem.jeesite.modules.store.vo;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class TBgypLogExt extends DataEntity<TBgypLogExt> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9133506840794025010L;
	
	private String bgypId;		// 办公用品id
	private String name;		// 办公用品名称
	private String inoutFlag;		// 出入库标识 字典表(inout_flag)
	private Long nums;		// 出入库数量
	private String remark;		// 备注信息
	private String businessType;		// 物品业务类型

	
	public String getBgypId() {
		return bgypId;
	}

	public void setBgypId(String bgypId) {
		this.bgypId = bgypId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	
}
