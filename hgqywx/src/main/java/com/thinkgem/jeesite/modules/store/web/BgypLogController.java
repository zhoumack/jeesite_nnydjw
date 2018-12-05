/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.store.entity.TBgypLog;
import com.thinkgem.jeesite.modules.store.service.TBgypLogService;
import com.thinkgem.jeesite.modules.store.vo.TBgypLogExt;

/**
 * 物品仓库记录Controller
 * @author wy
 * @version 2018-10-23
 */
@Controller
@RequestMapping(value = "${adminPath}/store/tBgypLog")
public class BgypLogController extends BaseController {

	@Autowired
	private TBgypLogService tBgypLogService;
	
	@ModelAttribute
	public TBgypLog get(@RequestParam(required=false) String id) {
		TBgypLog entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tBgypLogService.get(id);
		}
		if (entity == null){
			entity = new TBgypLog();
		}
		return entity;
	}
	
	@RequiresPermissions("store:tBgypLog:view")
	@RequestMapping(value = {"list", ""})
	public String list(TBgypLogExt bgypLogExt, HttpServletRequest request, HttpServletResponse response, Model model) {
//		TBgypLogExt bgypLogExt = new TBgypLogExt();
//		BeanUtils.copyProperties(tBgypLog, bgypLogExt);
//		
		model.addAttribute("TBgypLog", bgypLogExt);
		Page<TBgypLogExt> page = tBgypLogService.findLogListPage(new Page<TBgypLogExt>(request, response), bgypLogExt); 
		model.addAttribute("page", page);
		return "modules/store/tBgypLogList";
	}

	@RequiresPermissions("store:tBgypLog:view")
	@RequestMapping(value = "form")
	public String form(TBgypLog tBgypLog, Model model) {
		model.addAttribute("tBgypLog", tBgypLog);
		return "modules/store/tBgypLogForm";
	}

//	@RequiresPermissions("store:tBgypLog:edit")
//	@RequestMapping(value = "save")
//	public String save(TBgypLog tBgypLog, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, tBgypLog)){
//			return form(tBgypLog, model);
//		}
//		tBgypLogService.save(tBgypLog);
//		addMessage(redirectAttributes, "保存办公用品仓库记录成功");
//		return "redirect:"+Global.getAdminPath()+"/store/tBgypLog/?repage";
//	}
//	
//	@RequiresPermissions("store:tBgypLog:edit")
//	@RequestMapping(value = "delete")
//	public String delete(TBgypLog tBgypLog, RedirectAttributes redirectAttributes) {
//		tBgypLogService.delete(tBgypLog);
//		addMessage(redirectAttributes, "删除办公用品仓库记录成功");
//		return "redirect:"+Global.getAdminPath()+"/store/tBgypLog/?repage";
//	}

}