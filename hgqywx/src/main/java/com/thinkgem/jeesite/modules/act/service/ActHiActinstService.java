/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.act.entity.ActHiActinst;
import com.thinkgem.jeesite.modules.act.dao.ActHiActinstDao;

/**
 * 历史实例Service
 * @author zhou
 * @version 2018-11-21
 */
@Service
@Transactional(readOnly = true)
public class ActHiActinstService  extends BaseService {

}