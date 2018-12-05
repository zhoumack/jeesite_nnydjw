/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.store.entity.TBgypLog;
import com.thinkgem.jeesite.modules.store.vo.TBgypLogExt;

/**
 * 办公用品仓库记录DAO接口
 * @author wy
 * @version 2018-10-23
 */
@MyBatisDao
public interface TBgypLogDao extends CrudDao<TBgypLog> {
	
	public List<TBgypLogExt> findLogList(TBgypLogExt tBgypLog);
}