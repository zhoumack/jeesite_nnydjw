/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.shenpi.entity.Approve;
import com.thinkgem.jeesite.modules.shenpi.dao.ApproveDao;

/**
 * 审批Service
 * @author szx
 * @version 2018-08-22
 */
@Service
@Transactional(readOnly = true)
public class ApproveService extends CrudService<ApproveDao, Approve> {

	public Approve get(String id) {
		return super.get(id);
	}
	
	public List<Approve> findList(Approve approve) {
		return super.findList(approve);
	}
	
	public Page<Approve> findPage(Page<Approve> page, Approve approve) {
		return super.findPage(page, approve);
	}
	
	@Transactional(readOnly = false)
	public void save(Approve approve) {
		super.save(approve);
	}
	
	@Transactional(readOnly = false)
	public void delete(Approve approve) {
		super.delete(approve);
	}
	
}