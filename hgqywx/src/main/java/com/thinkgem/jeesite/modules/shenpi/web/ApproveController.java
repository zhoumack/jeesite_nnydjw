/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.web;

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
import com.thinkgem.jeesite.modules.shenpi.entity.Approve;
import com.thinkgem.jeesite.modules.shenpi.service.ApproveService;

/**
 * 审批Controller
 * @author szx
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "${adminPath}/shenpi/approve")
public class ApproveController extends BaseController {

	@Autowired
	private ApproveService approveService;
	
	@ModelAttribute
	public Approve get(@RequestParam(required=false) String id) {
		Approve entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = approveService.get(id);
		}
		if (entity == null){
			entity = new Approve();
		}
		return entity;
	}
	
	@RequiresPermissions("shenpi:approve:view")
	@RequestMapping(value = {"list", ""})
	public String list(Approve approve, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Approve> page = approveService.findPage(new Page<Approve>(request, response), approve); 
		model.addAttribute("page", page);
		return "modules/shenpi/approveList";
	}

	@RequiresPermissions("shenpi:approve:view")
	@RequestMapping(value = "form")
	public String form(Approve approve, Model model) {
		model.addAttribute("approve", approve);
		return "modules/shenpi/approveForm";
	}

	@RequiresPermissions("shenpi:approve:edit")
	@RequestMapping(value = "save")
	public String save(Approve approve, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, approve)){
			return form(approve, model);
		}
		approveService.save(approve);
		addMessage(redirectAttributes, "保存审批成功");
		return "redirect:"+Global.getAdminPath()+"/shenpi/approve/?repage";
	}
	
	@RequiresPermissions("shenpi:approve:edit")
	@RequestMapping(value = "delete")
	public String delete(Approve approve, RedirectAttributes redirectAttributes) {
		approveService.delete(approve);
		addMessage(redirectAttributes, "删除审批成功");
		return "redirect:"+Global.getAdminPath()+"/shenpi/approve/?repage";
	}

}