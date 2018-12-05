/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.shenpi.entity.Approve;

/**
 * 审批DAO接口
 * @author szx
 * @version 2018-08-22
 */
@MyBatisDao
public interface ApproveDao extends CrudDao<Approve> {
	
}