/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.act.entity.ActHiProcinst;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.act.dao.ActDao;
import com.thinkgem.jeesite.modules.act.dao.ActHiProcinstDao;

/**
 * 实例processService
 * @author zhou
 * @version 2018-11-21
 */
@Service
@Transactional(readOnly = true)
public class ActHiProcinstService   extends BaseService {
	@Autowired
	private ActHiProcinstDao actHiProcinstDao;
	
	public  List<ActHiProcinst> findListByRole(ActHiProcinst ahp){
		ahp.getSqlMap().put("dsf", BaseService.dataScopeFilter(UserUtils.getUser(), "o", "u"));
		List<ActHiProcinst> ahps=actHiProcinstDao.findList(ahp);
		return ahps;
	}
	
}