/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.act.entity.ActHiActinst;

/**
 * 历史实例DAO接口
 * @author zhou
 * @version 2018-11-21
 */
@MyBatisDao
public interface ActHiActinstDao extends CrudDao<ActHiActinst> {
	
}