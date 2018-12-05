/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.actfenpei.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;
import com.thinkgem.jeesite.modules.actfenpei.dao.ActFenpeiUserDao;

/**
 * 任务执行人记录Service
 * @author zyl
 * @version 2018-11-01
 */
@Service
@Transactional(readOnly = true)
public class ActFenpeiUserService extends CrudService<ActFenpeiUserDao, ActFenpeiUser> {

	public ActFenpeiUser get(String id) {
		return super.get(id);
	}
	
	public List<ActFenpeiUser> findList(ActFenpeiUser actFenpeiUser) {
		return super.findList(actFenpeiUser);
	}
	
	public Page<ActFenpeiUser> findPage(Page<ActFenpeiUser> page, ActFenpeiUser actFenpeiUser) {
		return super.findPage(page, actFenpeiUser);
	}
	
	@Transactional(readOnly = false)
	public void save(ActFenpeiUser actFenpeiUser) {
		super.save(actFenpeiUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(ActFenpeiUser actFenpeiUser) {
		super.delete(actFenpeiUser);
	}
	
}