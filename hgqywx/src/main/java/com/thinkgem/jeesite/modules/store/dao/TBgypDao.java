/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.store.entity.TBgyp;

/**
 * 物品仓库DAO接口
 * @author szx
 * @version 2018-10-18
 */
@MyBatisDao
public interface TBgypDao extends CrudDao<TBgyp> {
	/**
	 * 根据物品类型 获取物品列表
	 * @param type
	 * @return
	 */
	public List<TBgyp> getBgypByType(@Param("type")String type) ;

	/**
	 * 获取物品列表
	 * @param value 物品分类
	 * @param type 物品业务类型 
	 * @return
	 */
	public List<TBgyp> getBgypByTypeAndBusinessType(
			@Param("type")String type,
			@Param("businessType")String businessType);
}