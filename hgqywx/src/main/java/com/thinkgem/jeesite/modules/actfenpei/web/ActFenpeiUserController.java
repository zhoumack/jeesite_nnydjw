/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.actfenpei.web;

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
import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;
import com.thinkgem.jeesite.modules.actfenpei.service.ActFenpeiUserService;

/**
 * 任务执行人记录Controller
 * @author zyl
 * @version 2018-11-01
 */
@Controller
@RequestMapping(value = "${adminPath}/actfenpei/actFenpeiUser")
public class ActFenpeiUserController extends BaseController {

	@Autowired
	private ActFenpeiUserService actFenpeiUserService;
	
	@ModelAttribute
	public ActFenpeiUser get(@RequestParam(required=false) String id) {
		ActFenpeiUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = actFenpeiUserService.get(id);
		}
		if (entity == null){
			entity = new ActFenpeiUser();
		}
		return entity;
	}
	
	@RequiresPermissions("actfenpei:actFenpeiUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(ActFenpeiUser actFenpeiUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ActFenpeiUser> page = actFenpeiUserService.findPage(new Page<ActFenpeiUser>(request, response), actFenpeiUser); 
		model.addAttribute("page", page);
		return "modules/actfenpei/actFenpeiUserList";
	}

	@RequiresPermissions("actfenpei:actFenpeiUser:view")
	@RequestMapping(value = "form")
	public String form(ActFenpeiUser actFenpeiUser, Model model) {
		model.addAttribute("actFenpeiUser", actFenpeiUser);
		return "modules/actfenpei/actFenpeiUserForm";
	}

	@RequiresPermissions("actfenpei:actFenpeiUser:edit")
	@RequestMapping(value = "save")
	public String save(ActFenpeiUser actFenpeiUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, actFenpeiUser)){
			return form(actFenpeiUser, model);
		}
		actFenpeiUserService.save(actFenpeiUser);
		addMessage(redirectAttributes, "保存任务执行人记录成功");
		return "redirect:"+Global.getAdminPath()+"/actfenpei/actFenpeiUser/?repage";
	}
	
	@RequiresPermissions("actfenpei:actFenpeiUser:edit")
	@RequestMapping(value = "delete")
	public String delete(ActFenpeiUser actFenpeiUser, RedirectAttributes redirectAttributes) {
		actFenpeiUserService.delete(actFenpeiUser);
		addMessage(redirectAttributes, "删除任务执行人记录成功");
		return "redirect:"+Global.getAdminPath()+"/actfenpei/actFenpeiUser/?repage";
	}

}