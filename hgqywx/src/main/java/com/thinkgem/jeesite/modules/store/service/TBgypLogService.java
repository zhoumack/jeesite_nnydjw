/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.store.entity.TBgypLog;
import com.thinkgem.jeesite.modules.store.vo.TBgypLogExt;
import com.thinkgem.jeesite.modules.store.dao.TBgypLogDao;

/**
 * 办公用品仓库记录Service
 * @author wy
 * @version 2018-10-23
 */
@Service
@Transactional(readOnly = true)
public class TBgypLogService extends CrudService<TBgypLogDao, TBgypLog> {

	@Autowired
	private TBgypLogDao bgypLogDao;
	
	public TBgypLog get(String id) {
		return super.get(id);
	}
	
	public List<TBgypLog> findList(TBgypLog tBgypLog) {
		return super.findList(tBgypLog);
	}
	
	public Page<TBgypLog> findPage(Page<TBgypLog> page, TBgypLog tBgypLog) {
		return super.findPage(page, tBgypLog);
	}
	
	@Transactional(readOnly = false)
	public void save(TBgypLog tBgypLog) {
		super.save(tBgypLog);
	}
	
	@Transactional(readOnly = false)
	public void delete(TBgypLog tBgypLog) {
		super.delete(tBgypLog);
	}

	/**
	 * <!-- 查询物品操作记录(后台) -->
	 * @param page
	 * @param tBgypLog
	 * @return
	 */
	public Page<TBgypLogExt> findLogListPage(Page<TBgypLogExt> page, TBgypLogExt tBgypLog) {
		tBgypLog.setPage(page);
		page.setList(bgypLogDao.findLogList(tBgypLog)) ;
		return page;
	}
}