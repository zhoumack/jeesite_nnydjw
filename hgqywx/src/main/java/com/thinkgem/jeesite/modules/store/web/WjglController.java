/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.web;

import java.util.Date;
import java.util.List;

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
import com.thinkgem.jeesite.modules.store.entity.Wjgl;
import com.thinkgem.jeesite.modules.store.service.WjglService;

/**
 * 文件管理Controller
 * @author szx
 * @version 2018-10-14
 */
@Controller
@RequestMapping(value = "${adminPath}/store/wjgl")
public class WjglController extends BaseController {

	@Autowired
	private WjglService wjglService;
	
	@ModelAttribute
	public Wjgl get(@RequestParam(required=false) String id) {
		Wjgl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = wjglService.get(id);
		}
		if (entity == null){
			entity = new Wjgl();
		}
		return entity;
	}
	
	@RequiresPermissions("store:wjgl:view")
	@RequestMapping(value = {"list", ""})
	public String list(Wjgl wjgl, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Wjgl> page = wjglService.findPage(new Page<Wjgl>(request, response), wjgl); 
		model.addAttribute("page", page);
		return "modules/store/wjglList";
	}

	@RequiresPermissions("store:wjgl:view")
	@RequestMapping(value = "form")
	public String form(Wjgl wjgl, Model model) {
		model.addAttribute("wjgl", wjgl);
		return "modules/store/wjglForm";
	}

	//@RequiresPermissions("store:wjgl:edit")
	@RequestMapping(value = "save")
	public String save(Wjgl wjgl, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, wjgl)){
			return form(wjgl, model);
		}
		wjglService.save(wjgl);
		addMessage(redirectAttributes, "保存文件管理仓库成功");
		return "redirect:"+Global.getAdminPath()+"/store/wjgl/?repage";
	}
	
	Date date=new Date();
	
	@RequiresPermissions("store:wjgl:edit")
	@RequestMapping(value = "delete")
	public String delete(Wjgl wjgl, RedirectAttributes redirectAttributes) {
		wjglService.delete(wjgl);
		addMessage(redirectAttributes, "删除文件管理仓库成功");
		return "redirect:"+Global.getAdminPath()+"/store/wjgl/?repage";
	}
	
	/**
	 * 根据用户id查询该用户上传的所有文件
	 * 返回查看文件列表列表页面（页面未开发！！！）
	 * @author she
	 * @param userId
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getListByUser")
	public String getListByUser(String userId,HttpServletRequest request, HttpServletResponse response, Model model){
		List<Wjgl> list=wjglService.getListByUser(userId);
		model.addAttribute("list",list);
		return "modules/store/wjglList";
	}
	
	/**
	 * 根据日期查询当日上传的所有文件
	 * 返回查看文件列表列表页面（页面未开发！！！）
	 * @author she
	 * @param userId
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getListByDate")
	public String getListByDate(String date,HttpServletRequest request, HttpServletResponse response, Model model) {
		List<Wjgl> list=wjglService.getListByDate(date);
		model.addAttribute("list",list);
		return "modules/store/wjglList";
	}
	
	/**
	 * 根据所选择的日期范围得到文件列表
	 * 返回查看文件列表列表页面（页面未开发！！！）
	 * @author she
	 * @param startDate
	 * @param endDate
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getListByDateS")
	public String getListByDateS(String startDate,String endDate,HttpServletRequest request, HttpServletResponse response, Model model) {
		List<Wjgl> list=wjglService.getListByDateS(startDate, endDate);
		model.addAttribute("list",list);
		return "modules/store/wjglList";
	}	
}