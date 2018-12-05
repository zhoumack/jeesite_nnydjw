/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 办公物品仓库Entity
 * @author szx
 * @version 2018-10-25
 */
public class TBgyp extends DataEntity<TBgyp> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 办公用品名称
	private String nums;		// 库存数量
	private String businessType;		// 物品业务类型
	private String type;		// 物品分类
	private String remark;		// 备注信息
	
	public TBgyp() {
		super();
	}

	public TBgyp(String id){
		super(id);
	}

	@Length(min=0, max=30, message="办公用品名称长度必须介于 0 和 30 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=11, message="库存数量长度必须介于 0 和 11 之间")
	public String getNums() {
		return nums;
	}

	public void setNums(String nums) {
		this.nums = nums;
	}
	
	@Length(min=0, max=30, message="物品业务类型长度必须介于 0 和 30 之间")
	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	
	@Length(min=0, max=2, message="物品分类长度必须介于 0 和 2 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}