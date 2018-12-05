package com.thinkgem.jeesite.modules.act.vo;

/**
 * 简单部门类
 * @author Administrator
 *
 */
public class OfficeNameDto {

	/**
	 *  部门ID
	 */
	private String officeId;
	/**
	 *  部门名
	 */
	private String officeName;
	
	public OfficeNameDto(String officeId, String officeName) {
		super();
		this.officeId = officeId;
		this.officeName = officeName;
	}
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	
	
}
