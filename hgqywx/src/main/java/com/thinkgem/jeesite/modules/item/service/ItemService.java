/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.item.entity.Item;
import com.thinkgem.jeesite.modules.item.dao.ItemDao;

/**
 * 物品信息Service
 * @author szx
 * @version 2018-09-16
 */
@Service
@Transactional(readOnly = true)
public class ItemService extends CrudService<ItemDao, Item> {
	
	@Autowired
	private ItemDao itemDao;

	public Item get(String id) {
		return super.get(id);
	}
	
	public List<Item> findList(Item item) {
		return super.findList(item);
	}
	
	public Page<Item> findPage(Page<Item> page, Item item) {
		return super.findPage(page, item);
	}
	
	@Transactional(readOnly = false)
	public void save(Item item) {
		super.save(item);
	}
	
	@Transactional(readOnly = false)
	public void delete(Item item) {
		super.delete(item);
	}
	//出库
	@Transactional(readOnly = false)
	public boolean churuku(Item item,int nums) {
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