/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.grsw.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.grsw.entity.Richeng;

/**
 * 日程安排DAO接口
 * @author szx
 * @version 2018-11-15
 */
@MyBatisDao
public interface RichengDao extends CrudDao<Richeng> {
	
}