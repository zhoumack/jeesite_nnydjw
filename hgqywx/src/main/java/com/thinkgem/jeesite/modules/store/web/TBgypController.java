/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.thinkgem.jeesite.modules.store.entity.TBgyp;
import com.thinkgem.jeesite.modules.store.service.TBgypService;
import com.thinkgem.jeesite.modules.store.vo.TBgypExt;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

import net.sf.ehcache.constructs.web.ResponseUtil;

/**
 * 办公物品仓库Controller
 * @author szx
 * @version 2018-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/store/tBgyp")
public class TBgypController extends BaseController {

	@Autowired
	private TBgypService tBgypService;
	
	@ModelAttribute
	public TBgyp get(@RequestParam(required=false) String id) {
		TBgyp entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tBgypService.get(id);
		}
		if (entity == null){
			entity = new TBgyp();
		}
		return entity;
	}
	
	@RequiresPermissions("store:tBgyp:view")
	@RequestMapping(value = {"list", ""})
	public String list(TBgyp tBgyp, HttpServletRequest request, HttpServletResponse response, Model model) {
		tBgyp.setBusinessType("bgyplqType");
		Page<TBgyp> page = tBgypService.findPage(new Page<TBgyp>(request, response), tBgyp); 
		model.addAttribute("page", page);
//		model.addAttribute("tBgyp",tBgyp);
		return "modules/store/tBgypList";
	}

	@RequiresPermissions("store:tBgyp:view")
	@RequestMapping(value = "form")
	public String form(TBgyp tBgyp, Model model) {
		model.addAttribute("tBgyp", tBgyp);
		return "modules/store/tBgypForm";
	}

	@RequiresPermissions("store:tBgyp:edit")
	@RequestMapping(value = "save")
	public String save(TBgyp tBgyp, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tBgyp)){
			return form(tBgyp, model);
		}
		tBgyp.setBusinessType("bgyplqType");
		tBgypService.save(tBgyp);
		addMessage(redirectAttributes, "保存办公物品仓库成功");
		return "redirect:"+Global.getAdminPath()+"/store/tBgyp/?repage";
	}
	
	@RequiresPermissions("store:tBgyp:edit")
	@RequestMapping(value = "delete")
	public String delete(TBgyp tBgyp, RedirectAttributes redirectAttributes) {
		tBgypService.delete(tBgyp);
		addMessage(redirectAttributes, "删除办公物品仓库成功");
		return "redirect:"+Global.getAdminPath()+"/store/tBgyp/?repage";
	}


	/**
	 * 办公物品入库
	 * 
	 * @param tBgyp
	 * @param model
	 * @return
	 */
//	@ResponseBody
//	@RequestMapping(value = "save")
//	public RespData save(TBgyp tBgyp, Model model) {
//		
//		RespData respData = new RespData();
//		try {
//			tBgypService.save(tBgyp,UserUtils.getUser());
//			respData.setData("保存成功");
//		} catch (Exception e) {
//			return respData.get(e, "入库失败");
//		}
//		return respData;
//	}
	/**
	 * 获取所有办公物品列表
	 * @param type
	 * @return
	 */
//	@RequestMapping("getDictListMulti")
//	@ResponseBody
//	public List<TBgypExt> getDictListMulti(String type) {
//		
//		return tBgypService.getDictListMulti(type);
//	}
}