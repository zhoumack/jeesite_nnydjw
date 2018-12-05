/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test.entity.Test;
import com.thinkgem.jeesite.modules.act.dao.ActHiTaskinstDao;
import com.thinkgem.jeesite.modules.sys.myutils.DateUtil;
import com.thinkgem.jeesite.modules.test.dao.TestDao;

/**
 * 测试Service
 * @author ThinkGem
 * @version 2013-10-17
 */
@Service
@Transactional(readOnly = true)
public class TestService extends CrudService<TestDao, Test> {

	@Autowired
	private ActHiTaskinstDao actHiTaskinstDao;
	
	public Object xxx() {
		
		return actHiTaskinstDao.personalApplyStatistics("AoLian",
				DateUtil.fomatDate("2018-11-17"), 
				DateUtil.fomatDate("2018-11-20"));
		
	}
}
