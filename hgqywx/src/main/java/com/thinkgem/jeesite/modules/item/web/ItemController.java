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
import com.thinkgem.jeesite.modules.item.entity.Item;
import com.thinkgem.jeesite.modules.item.service.ItemService;

/**
 * 物品信息Controller
 * @author szx
 * @version 2018-09-16
 */
@Controller
@RequestMapping(value = "${adminPath}/item/item")
public class ItemController extends BaseController {

	@Autowired
	private ItemService itemService;
	
	@ModelAttribute
	public Item get(@RequestParam(required=false) String id) {
		Item entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = itemService.get(id);
		}
		if (entity == null){
			entity = new Item();
		}
		return entity;
	}
	
	@RequiresPermissions("item:item:view")
	@RequestMapping(value = {"list", ""})
	public String list(Item item, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Item> page = itemService.findPage(new Page<Item>(request, response), item); 
		model.addAttribute("page", page);
		return "modules/item/itemList";
	}

	@RequiresPermissions("item:item:view")
	@RequestMapping(value = "form")
	public String form(Item item, Model model) {
		model.addAttribute("item", item);
		return "modules/item/itemForm";
	}

	@RequiresPermissions("item:item:edit")
	@RequestMapping(value = "save")
	public String save(Item item, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, item)){
			return form(item, model);
		}
		itemService.save(item);
		addMessage(redirectAttributes, "保存查询物品信息成功");
		return "redirect:"+Global.getAdminPath()+"/item/item/?repage";
	}
	
	@RequiresPermissions("item:item:edit")
	@RequestMapping(value = "delete")
	public String delete(Item item, RedirectAttributes redirectAttributes) {
		itemService.delete(item);
		addMessage(redirectAttributes, "删除查询物品信息成功");
		return "redirect:"+Global.getAdminPath()+"/item/item/?repage";
	}

}