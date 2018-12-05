/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.shenpi.entity.Weixiu;

/**
 * 维修申请DAO接口
 * @author szx
 * @version 2018-10-16
 */
@MyBatisDao
public interface WeixiuDao extends CrudDao<Weixiu> {
	public List<Weixiu> findCaoSongList(Weixiu weixiu);
}