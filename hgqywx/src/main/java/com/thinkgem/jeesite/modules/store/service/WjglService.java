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
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.store.entity.Wjgl;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.store.dao.WjglDao;

/**
 * 文件管理Service
 * @author szx
 * @version 2018-10-14
 */
@Service
@Transactional(readOnly = true)
public class WjglService extends CrudService<WjglDao, Wjgl> {
	
	@Autowired
	private WjglDao dao;

	public Wjgl get(String id) {
		return super.get(id);
	}
	
	public List<Wjgl> findList(Wjgl wjgl) {
		return super.findList(wjgl);
	}
	
	public Page<Wjgl> findPage(Page<Wjgl> page, Wjgl wjgl) {
		return super.findPage(page, wjgl);
	}
	
	/**
	 * 根据用户id查询该用户上传的所有文件
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<Wjgl> getListByUser(String userId){
		return dao.getListByUser(userId);
	}
	
	/**
	 * 根据日期查询当日上传的所有文件
	 * @param date
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<Wjgl> getListByDate(String date){
		return dao.getListByDate(date);
	}
	
	/**
	 * 根据日期范围查询文件
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<Wjgl> getListByDateS(String startDate,String endDate){
		return dao.getListByDateS(startDate,endDate);
	}
	
	@Transactional(readOnly = false)
	public void save(Wjgl wjgl) {
		super.save(wjgl);
	}
	
	@Transactional(readOnly = false)
	public void savefile(MultipartFile[] files,String ywId,User user) {
		if (files.length==0) {
			System.out.println();
		}
		for(MultipartFile file:files) {			
			// 获取文件名
			String fileName = file.getOriginalFilename();
			double size=file.getSize();
			Wjgl wjgl=new Wjgl();
			wjgl.setProcId(ywId);
			wjgl.setUser(user);
			super.save(wjgl);
		}
		
	}
	
	@Transactional(readOnly = false)
	public void delete(Wjgl wjgl) {
		super.delete(wjgl);
	}
	
}