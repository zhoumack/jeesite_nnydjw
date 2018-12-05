/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.thinkgem.jeesite.common.persistence.BusinessException;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.store.entity.TBgyp;
import com.thinkgem.jeesite.modules.store.entity.TBgypLog;
import com.thinkgem.jeesite.modules.store.vo.TBgypExt;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.store.dao.TBgypDao;
import com.thinkgem.jeesite.modules.store.dao.TBgypLogDao;

/**
 * 办公物品仓库Service
 * @author szx
 * @version 2018-10-18
 */
@Service
@Transactional(readOnly = true)
public class TBgypService extends CrudService<TBgypDao, TBgyp> {

	@Autowired
	private TBgypDao bgypDao;
	
	@Autowired
	private TBgypLogDao bgypLogDao;
	
	private DictDao dictDao = SpringContextHolder.getBean(DictDao.class);
	
	public TBgyp get(String id) {
		return super.get(id);
	}
	
	public List<TBgyp> findList(TBgyp tBgyp) {
		return super.findList(tBgyp);
	}
	
	public Page<TBgyp> findPage(Page<TBgyp> page, TBgyp tBgyp) {
		return super.findPage(page, tBgyp);
	}
	
	@Transactional(readOnly = false)
	public void save(TBgyp tBgyp) {
		//1.验证
		String type = tBgyp.getType();
		String name = tBgyp.getName();
		String nums = tBgyp.getNums();
		String remark = tBgyp.getRemark();

		if (StringUtils.isBlank(type)) {
			// throw new IOException();
			throw new BusinessException("请选择物品分类");
		}
		if (StringUtils.isBlank(name)) {
			throw new BusinessException("物品名不能为空");
		}
		if (StringUtils.isBlank(nums)) {
			throw new BusinessException("入库数量不能为空");
		}
		try {
			Integer.parseInt(nums);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			throw new BusinessException("入库数量必须为整数");
		}
		//1.入库/修改 记录 (1 入库 0 出库)
		if (tBgyp.getIsNewRecord()) {
			super.save(tBgyp);
			inLibLog(tBgyp, Long.parseLong(nums));
		}else {
			TBgyp tBgypOld = super.get(tBgyp.getId());//未修改前的数据
			long numsOld = Long.parseLong(tBgypOld.getNums());//未修改前的数量
			long numsNew = Long.parseLong(nums);
			System.out.println("未修改前的数量:"+numsOld);
			System.out.println("修改到的数量:"+numsNew);
			if (numsNew >= numsOld) { //新增
				Long diffNum = numsNew - numsOld;
				inLibLog(tBgyp, diffNum);
			}else {
				Long diffNum = numsOld - numsNew;
				outLibLog(tBgyp, diffNum);
			}
			//2.入库
			super.save(tBgyp);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(TBgyp tBgyp) {
		outLibLog(tBgyp, Long.parseLong(tBgyp.getNums()));
		super.delete(tBgyp);
	}

	/**
	 * 物品出库
	 * @param id 物品id
	 * @param nums 出库数量
	 */
	public void outLib(String id, int nums){
		if (nums <= 0) {
			throw new BusinessException("出库数量必须大于零");
		}
		TBgyp tBgyp = get(id);
		
		/**
		 * 这三行避免脏读
		 */
		TBgyp newTBgyp = new TBgyp();
		BeanUtils.copyProperties(tBgyp, newTBgyp);
		newTBgyp.setIsNewRecord(false);
		
		long initNums = Long.parseLong(tBgyp.getNums()); //初始数量
		long editNum = initNums - nums;
		if (editNum < 0) {
			throw new BusinessException("库存不足，无法出库");
		}
		newTBgyp.setNums(String.valueOf(editNum));
		this.save(newTBgyp);
	}
	
	/**
	 * 物品入库记录
	 * @param tBgyp 记录数据
	 * @param diffNum 入库数量
	 */
	private void inLibLog(TBgyp tBgyp, Long diffNum){
		TBgypLog bgypLog = new TBgypLog();
		bgypLog.setBgypId(tBgyp.getId());
		bgypLog.setName(tBgyp.getName());
		bgypLog.setInoutFlag("1");
		bgypLog.setNums(diffNum);
		bgypLog.preInsert();
		bgypLogDao.insert(bgypLog);
	}
	/**
	 * 物品出库记录
	 * @param tBgyp 记录数据
	 * @param diffNum 出库数量
	 */
	private void outLibLog(TBgyp tBgyp, Long diffNum){
		TBgypLog bgypLog = new TBgypLog();
		bgypLog.setBgypId(tBgyp.getId());
		bgypLog.setName(tBgyp.getName());
		bgypLog.setInoutFlag("0");
		bgypLog.setNums(diffNum);
		bgypLog.preInsert();
		bgypLogDao.insert(bgypLog);
	}
	
//	/**
//	 * 根据办公物品类型 获取物品列表
//	 * @param type
//	 * @return
//	 */
//	public List<TBgyp> getBgypByType(String type) {
//		return bgypDao.getBgypByType(type);
//	}
	
	/**
	 * 获取所有物品列表
	 * @param type 物品业务类型 (字典表 wplx)
	 * @return
	 */
	public  List<TBgypExt> getDictListMulti(String type) {
		//主级
		List<Dict> dictList = dictDao.findListByType(type);
		
		//子级
		List<TBgypExt> bgypExts = new ArrayList<TBgypExt>();
		for (Dict dict : dictList) {
			List<TBgyp> tBgyp = bgypDao.getBgypByTypeAndBusinessType(dict.getValue(),type);

			
			TBgypExt bgypExt = new TBgypExt();
			bgypExt.setName(dict.getLabel());
			bgypExt.setId(dict.getId());
			bgypExt.setValue(dict.getValue());
			bgypExt.setType(dict.getType());
			
			bgypExt.setChildren(tBgyp);
			bgypExts.add(bgypExt);
		}
		return bgypExts;
	}
	
	
	
	/**
	 * 物品入库
	 * @param tBgyp
	 * @param user
	 * @throws IOException 
	 */
	@Transactional(readOnly = false)
	public void save(TBgyp tBgyp, User user) throws IOException {
		TBgyp tBgypSave = new TBgyp();
		Date now = new Date();
		//验证
		String type = tBgyp.getType();
		String name = tBgyp.getName();
		String nums = tBgyp.getNums();
		String remark = tBgyp.getRemark();
		
		if (StringUtils.isBlank(type)) {
			//throw new IOException();
			throw new BusinessException("请选择物品类型");
		}
		if (StringUtils.isBlank(name)) {
			throw new BusinessException("物品名不能为空");
		}
		if (StringUtils.isBlank(nums)) {
			throw new BusinessException("入库数量不能为空");
		}
		try {
			Integer.parseInt(nums);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			throw new BusinessException("入库数量必须为整数");
		}
		
		//保存
		tBgypSave.setType(type);
		tBgypSave.setName(name);
		tBgypSave.setNums(nums);
		tBgypSave.setRemark(remark);
		
		
		tBgypSave.setDelFlag("0");
		tBgypSave.setCreateBy(user);
		tBgypSave.setCreateDate(now);
		tBgypSave.setUpdateBy(user);
		tBgypSave.setUpdateDate(now);
		super.save(tBgypSave);
	}
	
	/**
	 * 查询未删除
	 * @param id
	 * @return
	 */
	public TBgyp getIfNotDel(String id) {
		TBgyp tBgyp =  super.get(id);
		if(tBgyp != null){
			if ("0".equals(tBgyp.getDelFlag())) {
				return tBgyp;
			}
		}
		throw new BusinessException("物品不存在");
	}
}