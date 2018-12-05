/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.grsw.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.grsw.entity.Richeng;
import com.thinkgem.jeesite.modules.grsw.dao.RichengDao;

/**
 * 日程安排Service
 * @author szx
 * @version 2018-11-15
 */
@Service
@Transactional(readOnly = true)
public class RichengService extends CrudService<RichengDao, Richeng> {

	public Richeng get(String id) {
		return super.get(id);
	}
	
	public List<Richeng> findList(Richeng richeng) {
		return super.findList(richeng);
	}
	
	public Page<Richeng> findPage(Page<Richeng> page, Richeng richeng) {
		return super.findPage(page, richeng);
	}
	
	@Transactional(readOnly = false)
	public void save(Richeng richeng) {
		super.save(richeng);
	}
	
	@Transactional(readOnly = false)
	public void delete(Richeng richeng) {
		super.delete(richeng);
	}
	
}