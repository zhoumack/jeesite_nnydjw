package com.thinkgem.jeesite.modules.act.vo;

import java.util.Date;

/**
  * 工作量统计数据
 * @author Administrator
 *
 */
public class WorkloadStatistics {

	/**
	 * 工作量
	 */
	private Integer count;
	/**
	 *  发生时间
	 */
	private Date date;
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
