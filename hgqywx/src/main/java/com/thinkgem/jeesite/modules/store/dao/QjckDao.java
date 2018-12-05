/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.store.entity.Qjck;

/**
 * 请假仓库记录DAO接口
 * @author szx
 * @version 2018-10-24
 */
@MyBatisDao
public interface QjckDao extends CrudDao<Qjck> {
	public Qjck findBydqnx(@Param("userId")String userId,@Param("type")String type,@Param("year")String year);
}