/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.store.entity.Qjck;
import com.thinkgem.jeesite.modules.store.entity.Qjtsbz;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.service.DictService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.store.dao.QjckDao;
import com.thinkgem.jeesite.modules.store.dao.QjtsbzDao;

/**
 * 请假仓库记录Service
 * @author szx
 * @version 2018-10-24
 */
@Service
@Transactional(readOnly = true)
public class QjckService extends CrudService<QjckDao, Qjck> {
	
	@Autowired
	private DictDao dictDao;
	@Autowired
	private QjtsbzDao qjtxbzDao;
	public Qjck get(String id) {
		return super.get(id);
	}
	
	public List<Qjck> findList(Qjck qjck) {
		return super.findList(qjck);
	}
	
	public Page<Qjck> findPage(Page<Qjck> page, Qjck qjck) {
		return super.findPage(page, qjck);
	}
	
	@Transactional(readOnly = false)
	public void save(Qjck qjck) {
		super.save(qjck);
	}
	
	@Transactional(readOnly = false)
	public void update(Qjck qjck) {
		dao.update(qjck);
	}
	
	@Transactional(readOnly = false)
	public Qjck findBydqnx(String userId,String type) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
        Date date = new Date();
        String year= sdf.format(date);
        String month=sdf2.format(date);
        String qjtype=DictUtils.getDictLabel(type, "qingjiaType", "其他");
		Qjck qjck=dao.findBydqnx(userId, qjtype, year);
		if(qjck!=null) {
			return qjck;
		}else {
			Qjck temp=new Qjck();
			temp.setUser(UserUtils.get(userId));
			temp.setUserName(UserUtils.get(userId).getName());
			temp.setType(qjtype);
			temp.setYear(year);
			temp.setMonth(month);
			temp.setDays(qjtxbzDao.getdaysbytype(qjtype).getDaynums());
			temp.setRestdays(qjtxbzDao.getdaysbytype(qjtype).getDaynums());
			super.save(temp);
			Qjck qjck1=dao.findBydqnx(userId, qjtype, year);
			return qjck1;
		}
	}
	/**
	 * 请假成功后更新个人请假仓库天数
	 * @param qingjia
	 */
	@Transactional(readOnly = false)
	public void updateDays(Qingjia qingjia) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
        Date date = new Date();
        String year= sdf.format(date);
        String month=sdf2.format(date);
		String qjtype=DictUtils.getDictLabel(qingjia.getType(), "qingjiaType", "其他");
        Qjck qjck=dao.findBydqnx(qingjia.getUser().getId(), qjtype, year);
        qjck.setRestdays(qjck.getRestdays()-qingjia.getTotaldays());
        if(qjck.getRestdays()<0) {
        	qjck.setRestdays(0);
        }
        this.update(qjck);
	}
	@Transactional(readOnly = false)
	public void delete(Qjck qjck) {
		super.delete(qjck);
	}
	
}