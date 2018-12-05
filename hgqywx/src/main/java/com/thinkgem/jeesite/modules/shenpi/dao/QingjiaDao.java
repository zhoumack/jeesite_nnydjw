/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;

/**
 * 请假申请DAO接口
 * @author szx
 * @version 2018-08-22
 */
@MyBatisDao
public interface QingjiaDao extends CrudDao<Qingjia> {
	public int updateStatus(Qingjia qingjia);
	public int updateRemarks(Qingjia qingjia);
	public List<Qingjia> findCaoSongList(Qingjia qingjia);
}