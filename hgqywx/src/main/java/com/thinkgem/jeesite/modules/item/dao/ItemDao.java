/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.item.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.item.entity.Item;

/**
 * 物品信息DAO接口
 * @author szx
 * @version 2018-09-16
 */
@MyBatisDao
public interface ItemDao extends CrudDao<Item> {
	public void updatenums(String id,int nums);
	
}