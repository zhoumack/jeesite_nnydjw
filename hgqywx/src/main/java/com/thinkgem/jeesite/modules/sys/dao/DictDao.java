/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);

	/**
	 * 根据类型 查询 返回字典列表（可多级）
	 * @param type
	 * @return
	 */
	public List<Dict> findListByType(@Param("type") String type);

	/**
	 * 根据父级id  查询 返回字典列表
	 * @param parentId
	 */
	public List<Dict> findListByParentId(@Param("parentId") String parentId);
	
}
