/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.item.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 物品信息Entity
 * @author szx
 * @version 2018-09-16
 */
public class Item extends DataEntity<Item> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 物品名称
	private String type;		// 物品类型
	private String model;		// 物品型号
	private String price;		// 单价
	private int nums;		// 库存数量
	private String storedept;//物品存储部门
	
	public Item() {
		super();
	}

	public Item(String id){
		super(id);
	}

	@Length(min=0, max=30, message="物品名称长度必须介于 0 和 30 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=30, message="物品类型长度必须介于 0 和 30 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=50, message="物品型号长度必须介于 0 和 50 之间")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=0, max=11, message="库存数量长度必须介于 0 和 11 之间")
	public int getNums() {
		return nums;
	}

	public void setNums(int nums) {
		this.nums = nums;
	}

	public String getStoredept() {
		return storedept;
	}

	public void setStoredept(String storedept) {
		this.storedept = storedept;
	}
	
}