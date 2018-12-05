/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.form.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.BusinessException;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.RespData;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.form.entity.SysForm;
import com.thinkgem.jeesite.modules.form.service.SysFormService;
import com.thinkgem.jeesite.modules.store.entity.TBgyp;

/**
 * 表单管理Controller
 * @author wy
 * @version 2018-11-14
 */
@Controller
@RequestMapping(value = "${adminPath}/form/sysForm")
public class FormController extends BaseController {

	@Autowired
	private SysFormService formService;
	
	@ModelAttribute
	public SysForm get(@RequestParam(required=false) String id) {
		SysForm entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = formService.get(id);
		}
		if (entity == null){
			entity = new SysForm();
		}
		return entity;
	}
	
	@RequiresPermissions("form:sysForm:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysForm sysForm, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysForm> page = formService.findPage(new Page<SysForm>(request, response), sysForm); 
		model.addAttribute("page", page);
		return "modules/form/sysFormList";
	}

	@RequiresPermissions("form:sysForm:view")
	@RequestMapping(value = "form")
	public String form(SysForm sysForm, Model model) {
		model.addAttribute("sysForm", sysForm);
		return "modules/form/sysFormForm";
	}

//	@RequiresPermissions("form:sysForm:edit")
//	@RequestMapping(value = "save")
//	public String save(SysForm sysForm, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, sysForm)){
//			return form(sysForm, model);
//		}
//		formService.save(sysForm);
//		addMessage(redirectAttributes, "保存表单成功");
//		return "redirect:"+Global.getAdminPath()+"/form/sysForm/?repage";
//	}
	
	@RequiresPermissions("form:sysForm:edit")
	@RequestMapping(value = "delete")
	public String delete(SysForm sysForm, RedirectAttributes redirectAttributes) {
		formService.delete(sysForm);
		addMessage(redirectAttributes, "删除表单成功");
		return "redirect:"+Global.getAdminPath()+"/form/sysForm/?repage";
	}

	
	
	/**
	 * 保存修改表单
	 * @param sysForm
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("form:sysForm:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public RespData save(SysForm sysForm, Model model, RedirectAttributes redirectAttributes) {
		RespData respData = new RespData();
		try {
//			if (!beanValidator(model, sysForm)){
//				throw new BusinessException("验证失败");
//			}
			formService.save(sysForm);
		} catch (Exception e) {
			return respData.get(e, "查询失败");
		}
		return respData;
	}
	
	/**
	 * 获取单条数据 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getData")
	@ResponseBody
	public RespData getData(@RequestParam(required=false) String id) {
		RespData respData = new RespData();
		try {
			SysForm entity = new SysForm();
			if (StringUtils.isNotBlank(id)){
				entity = formService.get(id);
				respData.setData(entity);
			}
		} catch (Exception e) {
			return respData.get(e, "查询失败");
		}
		return respData;
	}
	
	/**
	 * 表单渲染页 (mobile)
	 * @param sysForm
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "renderedFormPage/{id}")
	public String renderedForm(Model model,@PathVariable("id")String id ) {
		model.addAttribute("id", id);
		return "modules/form/renderedForm";
	}
	/**
	 * 表单渲染页 表单部分
	 * @param sysForm
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "renderedForm",produces="text/html")
	public String renderedForm(SysForm sysForm, Model model) {
		//1.TODO：需要替换模板数据
		
		//model.addAttribute("collection", 1);
		//2.返回
		return StringEscapeUtils.unescapeHtml4(sysForm.getFormRendered());
	}
	
	/**
	 * 表单脚本
	 * @param sysForm
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "formScript")
	public String formScript(SysForm sysForm, Model model) {
		return StringEscapeUtils.unescapeHtml4(sysForm.getFormScript());
	}
}