/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.store.entity.Wjgl;

/**
 * 文件管理DAO接口
 * @author szx
 * @version 2018-10-14
 */
@MyBatisDao
public interface WjglDao extends CrudDao<Wjgl> {
	public List<Wjgl> getListByUser(@Param("userId")String userId);
	public List<Wjgl> getListByDate(@Param("date")String date);
	public List<Wjgl> getListByDateS(@Param("startDate")String startDate,@Param("endDate")String endDate);
}