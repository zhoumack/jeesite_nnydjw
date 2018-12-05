/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.shenpi.entity.Renwu;

/**
 * 任务安排DAO接口
 * @author 刘伟
 * @version 2018-11-28
 */
@MyBatisDao
public interface RenwuDao extends CrudDao<Renwu> {
	
}