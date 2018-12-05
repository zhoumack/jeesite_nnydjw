/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.shenpi.entity.Paiche;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;

/**
 * 派车申请DAO接口
 * @author zyl
 * @version 2018-11-01
 */
@MyBatisDao
public interface PaicheDao extends CrudDao<Paiche> {
	public List<Paiche> findCaoSongList(Paiche paicheDao);
}