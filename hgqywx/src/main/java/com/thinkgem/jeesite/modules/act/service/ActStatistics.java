package com.thinkgem.jeesite.modules.act.service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.act.dao.ActHiTaskinstDao;
import com.thinkgem.jeesite.modules.act.vo.ApplyStatistics;
import com.thinkgem.jeesite.modules.act.vo.DepartmentSumWorkloadStatistics;
import com.thinkgem.jeesite.modules.act.vo.DepartmentWorkloadStatistics;
import com.thinkgem.jeesite.modules.act.vo.WorkloadStatistics;
import com.thinkgem.jeesite.modules.sys.myutils.DateUtil;

/**
 *  流程统计业务数据
 * @author Administrator
 *
 */
@Service
@Transactional(readOnly = true)
public class ActStatistics  extends BaseService{

	@Autowired
	private ActHiTaskinstDao actHiTaskinstDao;
	
	/**
	 *  个人申请量统计
	 * @param assignee 申请人
	 * @param startTime 申请开始区间
	 * @param endTime 申请结束区间
	 * @return
	 */
	public List<WorkloadStatistics> personalApplyStatistics(String assignee,
			Date startTime,
			Date endTime){
		//处理时间
		HashMap<String, Date> timeMap = new HashMap<String,Date>();
		timeMap.put("starttime", startTime);
		timeMap.put("endtime", endTime);
		setDefaultDate(timeMap);
		//处理业务
		return actHiTaskinstDao.personalApplyStatistics(assignee,
				timeMap.get("starttime"),  
				addOneDay(timeMap.get("endtime")));
		
	}
	/**
	 *  个人工作量统计
	 * @param assignee 申请人
	 * @param startTime 申请开始区间
	 * @param endTime 申请结束区间
	 * @return
	 */
	public List<WorkloadStatistics> personalWorkloadStatistics(String assignee,
			Date startTime,
			Date endTime,
			Boolean isDone){
		//处理时间
		HashMap<String, Date> timeMap = new HashMap<String,Date>();
		timeMap.put("starttime", startTime);
		timeMap.put("endtime", endTime);
		setDefaultDate(timeMap);
		//处理业务
		return actHiTaskinstDao.personalWorkloadStatistics(assignee,
				timeMap.get("starttime"),  
				addOneDay(timeMap.get("endtime")),
				isDone);
	}
	
	/**
	 * 部门人员工作量统计(按状态分组)
	 * @param users 用户ids
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<DepartmentWorkloadStatistics> departmentWorkloadStatistics(List<String> users,
			Date startTime,
			Date endTime,
			String state){
		//处理时间
		HashMap<String, Date> timeMap = new HashMap<String,Date>();
		timeMap.put("starttime", startTime);
		timeMap.put("endtime", endTime);
		setDefaultDate(timeMap);
		//处理业务
		return actHiTaskinstDao.departmentWorkloadStatistics(users,
				timeMap.get("starttime"),  
				addOneDay(timeMap.get("endtime")),
				state);
	}
	
	/**
	 * 所有部门工作量统计(按部门分组)
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<DepartmentSumWorkloadStatistics> departmentSumWorkloadStatistics(
			Date startTime,
			Date endTime,
			String state){
		//处理时间
		HashMap<String, Date> timeMap = new HashMap<String,Date>();
		timeMap.put("starttime", startTime);
		timeMap.put("endtime", endTime);
		setDefaultDate(timeMap);
		//处理业务
		return actHiTaskinstDao.departmentSumWorkloadStatistics(
				timeMap.get("starttime"),  
				addOneDay(timeMap.get("endtime")),
				state);
	}
	/**
	 * 添加一天
	 * 
	 * @param Time 如果为null,返回null
	 * @return 
	 */
	private Date addOneDay(Date time) {
		Date endTimePlusOne = null;
		if (time != null) {
			endTimePlusOne = DateUtils.addDays(time, 1);
		}
		return endTimePlusOne;
	}
	
	/**
	 * 设置默认日期
	 * @param startTime
	 * @param endTime
	 */
	private void setDefaultDate(Map<String,Date> map) {
		Date startTime  = map.get("starttime");
		Date endTime = map.get("endtime");
		if (startTime == null && endTime == null) {
			map.put("starttime", getPastSevenDays());
			map.put("endtime", getNow());
		}
	}
	/**
	 * 前10天日期
	 * @return
	 */
	private Date getPastSevenDays() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -10);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 当前日期
	 * @return
	 */
	private Date getNow() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}
}
