/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.store.entity.Qjtsbz;

/**
 * 请假天数标准DAO接口
 * @author szx
 * @version 2018-10-11
 */
@MyBatisDao
public interface QjtsbzDao extends CrudDao<Qjtsbz> {
	public Qjtsbz getdaysbytype(@Param("type")String type);
}