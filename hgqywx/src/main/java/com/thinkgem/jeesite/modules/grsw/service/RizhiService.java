/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.grsw.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.grsw.entity.Rizhi;
import com.thinkgem.jeesite.modules.grsw.dao.RizhiDao;

/**
 * 日志的增删改查Service
 * @author 刘伟
 * @version 2018-11-13
 */
@Service
@Transactional(readOnly = true)
public class RizhiService extends CrudService<RizhiDao, Rizhi> {

	public Rizhi get(String id) {
		return super.get(id);
	}
	
	public List<Rizhi> findList(Rizhi rizhi) {
		return super.findList(rizhi);
	}
	
	public Page<Rizhi> findPage(Page<Rizhi> page, Rizhi rizhi) {
		return super.findPage(page, rizhi);
	}
	
	@Transactional(readOnly = false)
	public void save(Rizhi rizhi) {
		super.save(rizhi);
	}
	
	@Transactional(readOnly = false)
	public void delete(Rizhi rizhi) {
		super.delete(rizhi);
	}
	
}