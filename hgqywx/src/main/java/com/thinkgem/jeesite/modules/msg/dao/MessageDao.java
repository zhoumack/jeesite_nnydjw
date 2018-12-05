/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.msg.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.msg.entity.Message;

/**
 * 各种消息所需字段DAO接口
 * @author szx
 * @version 2018-09-06
 */
@MyBatisDao
public interface MessageDao extends CrudDao<Message> {
	
}