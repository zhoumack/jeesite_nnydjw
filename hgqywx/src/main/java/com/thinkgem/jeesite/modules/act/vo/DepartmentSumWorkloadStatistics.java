package com.thinkgem.jeesite.modules.act.vo;

public class DepartmentSumWorkloadStatistics {

	/**
	 * 工作量
	 */
	private Integer count;
	/**
	 *  部门ID
	 */
	private String officeId;
	/**
	 *  部门名
	 */
	private String officeName;
	
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
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
