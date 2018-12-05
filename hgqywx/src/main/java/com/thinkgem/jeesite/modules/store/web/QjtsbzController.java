/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.thinkgem.jeesite.modules.store.entity.Qjtsbz;
import com.thinkgem.jeesite.modules.store.service.QjtsbzService;

/**
 * 请假天数标准Controller
 * @author szx
 * @version 2018-10-11
 */
@Controller
@RequestMapping(value = "${adminPath}/store/qjtsbz")
public class QjtsbzController extends BaseController {

	@Autowired
	private QjtsbzService qjtsbzService;
	
	@ModelAttribute
	public Qjtsbz get(@RequestParam(required=false) String id) {
		Qjtsbz entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qjtsbzService.get(id);
		}
		if (entity == null){
			entity = new Qjtsbz();
		}
		return entity;
	}
	
	@RequiresPermissions("store:qjtsbz:view")
	@RequestMapping(value = {"list", ""})
	public String list(Qjtsbz qjtsbz, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Qjtsbz> page = qjtsbzService.findPage(new Page<Qjtsbz>(request, response), qjtsbz); 
		model.addAttribute("page", page);
		return "modules/store/qjtsbzList";
	}

	@RequiresPermissions("store:qjtsbz:view")
	@RequestMapping(value = "form")
	public String form(Qjtsbz qjtsbz, Model model) {
		model.addAttribute("qjtsbz", qjtsbz);
		return "modules/store/qjtsbzForm";
	}

	@RequiresPermissions("store:qjtsbz:edit")
	@RequestMapping(value = "save")
	public String save(Qjtsbz qjtsbz, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qjtsbz)){
			return form(qjtsbz, model);
		}
		qjtsbzService.save(qjtsbz);
		addMessage(redirectAttributes, "保存请假天数标准成功");
		return "redirect:"+Global.getAdminPath()+"/store/qjtsbz/?repage";
	}
	
	@RequiresPermissions("store:qjtsbz:edit")
	@RequestMapping(value = "delete")
	public String delete(Qjtsbz qjtsbz, RedirectAttributes redirectAttributes) {
		qjtsbzService.delete(qjtsbz);
		addMessage(redirectAttributes, "删除请假天数标准成功");
		return "redirect:"+Global.getAdminPath()+"/store/qjtsbz/?repage";
	}

}