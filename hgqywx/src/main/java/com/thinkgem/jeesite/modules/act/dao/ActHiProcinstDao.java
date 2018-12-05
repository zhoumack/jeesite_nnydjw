/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.act.entity.ActHiActinst;
import com.thinkgem.jeesite.modules.act.entity.ActHiProcinst;

/**
 * 实例processDAO接口
 * @author zhou
 * @version 2018-11-21
 */
@MyBatisDao
public interface ActHiProcinstDao   extends CrudDao<ActHiProcinst> {
	
}