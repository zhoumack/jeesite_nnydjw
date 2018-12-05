/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.item.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.item.entity.Churuku;

/**
 * 物品出入库DAO接口
 * @author szx
 * @version 2018-09-16
 */
@MyBatisDao
public interface ChurukuDao extends CrudDao<Churuku> {
	
}