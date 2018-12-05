/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.store.entity.Qjtsbz;
import com.thinkgem.jeesite.modules.store.dao.QjtsbzDao;

/**
 * 请假天数标准Service
 * @author szx
 * @version 2018-10-11
 */
@Service
@Transactional(readOnly = true)
public class QjtsbzService extends CrudService<QjtsbzDao, Qjtsbz> {

	public Qjtsbz get(String id) {
		return super.get(id);
	}
	
	public List<Qjtsbz> findList(Qjtsbz qjtsbz) {
		return super.findList(qjtsbz);
	}
	
	public Page<Qjtsbz> findPage(Page<Qjtsbz> page, Qjtsbz qjtsbz) {
		return super.findPage(page, qjtsbz);
	}
	
	@Transactional(readOnly = false)
	public void save(Qjtsbz qjtsbz) {
		super.save(qjtsbz);
	}
	
	@Transactional(readOnly = false)
	public void delete(Qjtsbz qjtsbz) {
		super.delete(qjtsbz);
	}
	
}