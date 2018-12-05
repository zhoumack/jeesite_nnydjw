/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.item.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.item.entity.Churuku;
import com.thinkgem.jeesite.modules.item.entity.Item;
import com.thinkgem.jeesite.modules.item.dao.ChurukuDao;
import com.thinkgem.jeesite.modules.item.dao.ItemDao;

/**
 * 物品出入库Service
 * @author szx
 * @version 2018-09-16
 */
@Service
@Transactional(readOnly = true)
public class ChurukuService extends CrudService<ChurukuDao, Churuku> {
	
	private ItemDao itemDao;

	public Churuku get(String id) {
		return super.get(id);
	}
	
	public List<Churuku> findList(Churuku churuku) {
		return super.findList(churuku);
	}
	
	public Page<Churuku> findPage(Page<Churuku> page, Churuku churuku) {
		return super.findPage(page, churuku);
	}
	
	@Transactional(readOnly = false)
	public void save(Churuku churuku) {
		super.save(churuku);
	}
	
	@Transactional(readOnly = false)
	public void delete(Churuku churuku) {
		super.delete(churuku);
	}
	//出库
	@Transactional(readOnly = false)
	public boolean chuku(Item item,int nums) {
		boolean flag=true;
		Item kucun=itemDao.get(item.getId());
		if(kucun.getNums()>=nums) {
			int updatenums=kucun.getNums()-nums;
			itemDao.updatenums(item.getId(), updatenums);
			System.out.println("库存足够，可以出库");
			return flag;
		}else {
			System.out.println("库存不够");
			flag=false;
			return flag;
		}
			
	}
		//出库
		@Transactional(readOnly = false)
		public void ruku(Item item,int nums) {
			Item kucun=itemDao.get(item.getId());
			int updatenums=kucun.getNums()+nums;
			itemDao.updatenums(item.getId(), updatenums);
				
		}
}