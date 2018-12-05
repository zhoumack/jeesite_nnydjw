/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.actfenpei.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;

/**
 * 任务执行人记录DAO接口
 * @author zyl
 * @version 2018-11-01
 */
@MyBatisDao
public interface ActFenpeiUserDao extends CrudDao<ActFenpeiUser> {
	
}