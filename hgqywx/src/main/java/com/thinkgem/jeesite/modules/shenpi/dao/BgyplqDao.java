/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.shenpi.entity.Bgyplq;

/**
 * 办公用品领取申请DAO接口
 * @author szx
 * @version 2018-10-17
 */
@MyBatisDao
public interface BgyplqDao extends CrudDao<Bgyplq> {
	public List<Bgyplq> findCaoSongList(Bgyplq bgyplq);
}