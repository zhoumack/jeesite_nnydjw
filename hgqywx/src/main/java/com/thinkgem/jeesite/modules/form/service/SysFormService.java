/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.form.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.form.entity.SysForm;
import com.thinkgem.jeesite.modules.form.dao.SysFormDao;

/**
 * 表单管理Service
 * @author wy
 * @version 2018-11-14
 */
@Service
@Transactional(readOnly = true)
public class SysFormService extends CrudService<SysFormDao, SysForm> {

	public SysForm get(String id) {
		return super.get(id);
	}
	
	public List<SysForm> findList(SysForm sysForm) {
		return super.findList(sysForm);
	}
	
	public Page<SysForm> findPage(Page<SysForm> page, SysForm sysForm) {
		return super.findPage(page, sysForm);
	}
	
	@Transactional(readOnly = false)
	public void save(SysForm sysForm) {
		super.save(sysForm);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysForm sysForm) {
		super.delete(sysForm);
	}
	
}