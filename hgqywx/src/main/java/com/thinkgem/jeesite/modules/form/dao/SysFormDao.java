/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.form.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.form.entity.SysForm;

/**
 * 表单管理DAO接口
 * @author wy
 * @version 2018-11-14
 */
@MyBatisDao
public interface SysFormDao extends CrudDao<SysForm> {
	
}