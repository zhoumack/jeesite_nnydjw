/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.item.web;

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
import com.thinkgem.jeesite.modules.item.entity.Churuku;
import com.thinkgem.jeesite.modules.item.entity.Item;
import com.thinkgem.jeesite.modules.item.service.ChurukuService;

/**
 * 物品出入库Controller
 * @author szx
 * @version 2018-09-16
 */
@Controller
@RequestMapping(value = "${adminPath}/item/churuku")
public class ChurukuController extends BaseController {

	@Autowired
	private ChurukuService churukuService;
	
	@ModelAttribute
	public Churuku get(@RequestParam(required=false) String id) {
		Churuku entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = churukuService.get(id);
		}
		if (entity == null){
			entity = new Churuku();
		}
		return entity;
	}
	
	//@RequiresPermissions("item:churuku:view")
	@RequestMapping(value = {"list", ""})
	public String list(Churuku churuku, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Churuku> page = churukuService.findPage(new Page<Churuku>(request, response), churuku); 
		model.addAttribute("page", page);
		return "modules/item/churukuList";
	}

	@RequiresPermissions("item:churuku:view")
	@RequestMapping(value = "form")
	public String form(Churuku churuku, Model model) {
		model.addAttribute("churuku", churuku);
		return "modules/item/churukuForm";
	}

	@RequiresPermissions("item:churuku:edit")
	@RequestMapping(value = "save")
	public String save(Churuku churuku, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, churuku)){
			return form(churuku, model);
		}
		churukuService.save(churuku);
		addMessage(redirectAttributes, "保存物品出入库信息成功");
		return "redirect:"+Global.getAdminPath()+"/item/churuku/?repage";
	}
	
	@RequestMapping(value="store")
	public String store(Churuku churuku,Item item,int nums,Model model,RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, churuku)){
			return form(churuku, model);
		}
		if(churuku.getType().equals("1")) {
			boolean flag=churukuService.chuku(item, nums);
			
			if(flag==true) {
				addMessage(redirectAttributes, "物品出库!");
				return "redirect"+Global.getAdminPath()+"/item/churuku/?repage";
			}else {
				addMessage(redirectAttributes, "库存不足，出库失败");
				return "redirect"+Global.getAdminPath()+"/item/churuku/?repage";
			}
		}else if(churuku.getType().equals("2")) {
			churukuService.ruku(item, nums);
			addMessage(redirectAttributes, "物品出库!");
			return "redirect"+Global.getAdminPath()+"/item/churuku/?repage";
		}
		return "redirect:"+Global.getAdminPath()+"/item/churuku/?repage";
	}
	
	@RequiresPermissions("item:churuku:edit")
	@RequestMapping(value = "delete")
	public String delete(Churuku churuku, RedirectAttributes redirectAttributes) {
		churukuService.delete(churuku);
		addMessage(redirectAttributes, "删除物品出入库信息成功");
		return "redirect:"+Global.getAdminPath()+"/item/churuku/?repage";
	}

}