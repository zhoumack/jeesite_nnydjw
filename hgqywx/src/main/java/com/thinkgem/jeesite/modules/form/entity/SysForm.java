/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.form.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 表单管理Entity
 * @author wy
 * @version 2018-11-16
 */
public class SysForm extends DataEntity<SysForm> {
	
	private static final long serialVersionUID = 1L;
	private String formDef;		// 表单标识
	private String name;		// 表单名称
	private String formJsonObject;		// 表单定义对象
	private String formRendered;		// 表单内容
	private String formScript;		// 表单脚本
	
	public SysForm() {
		super();
	}

	public SysForm(String id){
		super(id);
	}

	@Length(min=0, max=30, message="表单标识长度必须介于 0 和 30 之间")
	public String getFormDef() {
		return formDef;
	}

	public void setFormDef(String formDef) {
		this.formDef = formDef;
	}
	
	@Length(min=0, max=30, message="表单名称长度必须介于 0 和 30 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=30, message="表单定义对象长度必须介于 0 和 30 之间")
	public String getFormJsonObject() {
		return formJsonObject;
	}

	public void setFormJsonObject(String formJsonObject) {
		this.formJsonObject = formJsonObject;
	}
	
	@Length(min=0, max=30, message="表单内容长度必须介于 0 和 30 之间")
	public String getFormRendered() {
		return formRendered;
	}

	public void setFormRendered(String formRendered) {
		this.formRendered = formRendered;
	}
	
	public String getFormScript() {
		return formScript;
	}

	public void setFormScript(String formScript) {
		this.formScript = formScript;
	}
	
}