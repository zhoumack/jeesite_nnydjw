/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.vo.ApplyStatistics;
import com.thinkgem.jeesite.modules.act.vo.DepartmentSumWorkloadStatistics;
import com.thinkgem.jeesite.modules.act.vo.DepartmentWorkloadStatistics;
import com.thinkgem.jeesite.modules.act.vo.WorkloadStatistics;

/**
 * DAO接口
 * @author thinkgem
 * @version 2014-05-16
 */
@MyBatisDao
public interface ActHiTaskinstDao {

	/**
	 * 个人申请统计
	 * @param assignee 申请人
	 * @param 开始时间
	 * @param 结束时间
	 * @return
	 */
	public List<WorkloadStatistics> personalApplyStatistics(
			@Param("assignee") String assignee,
			@Param("startTime") Date startTime,
			@Param("endTime") Date endTime);

	/**
	 * 个人工作量统计
	 * @param assignee
	 * @param startTime
	 * @param addOneDay
	 * @return
	 */
	public List<WorkloadStatistics> personalWorkloadStatistics(	
			@Param("assignee") String assignee,
			@Param("startTime") Date startTime,
			@Param("endTime") Date endTime,
			@Param("isDone") Boolean isDone);
	/**
	 * 部门人员工作量统计(按状态分组)
	 * @param users
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<DepartmentWorkloadStatistics> departmentWorkloadStatistics(	
			@Param("users") List<String> users,
			@Param("startTime") Date startTime,
			@Param("endTime") Date endTime,
			@Param("state") String state);
	/**
	 * 所有部门工作量统计(按部门分组)
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<DepartmentSumWorkloadStatistics> departmentSumWorkloadStatistics(
			@Param("startTime") Date startTime,
			@Param("endTime") Date endTime,
			@Param("state") String state);
	
}
