/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.grsw.web;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.grsw.entity.Rizhi;
import com.thinkgem.jeesite.modules.grsw.service.RizhiService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 日志的增删改查Controller
 * 
 * @author 刘伟
 * @version 2018-11-13
 */
@Controller
@RequestMapping(value = "${adminPath}/grsw/rizhi")
public class RizhiController extends BaseController {

	@Autowired
	private RizhiService rizhiService;

	@ModelAttribute
	public Rizhi get(@RequestParam(required = false) String id) {
		Rizhi entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = rizhiService.get(id);
		}
		if (entity == null) {
			entity = new Rizhi();
		}
		return entity;
	}
	//已读/未读     列表
	@RequestMapping(value = { "list", "" })
	public String list(Rizhi rizhi, HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("状态="+rizhi.getRemarks());
		//已读
		String url= "modules/shenpi/rizhilistq";
		//未读
		if((rizhi.getRemarks()!=null && rizhi.getRemarks()!="") || rizhi.getRemarks()=="0"){
			url = "modules/shenpi/rizhilistw";
		}
		
		rizhi.setUser(UserUtils.getUser());
		List<Rizhi> rzList = rizhiService.findList(rizhi);
//		for (Rizhi rizhi2 : rzList) {
//			rizhi2.setUser(UserUtils.getUser());
//		}
		model.addAttribute("list", rzList);
		
		return url;
	}
	
	//最新时间
	@RequestMapping(value = { "findDate", "" })
	public String findDate(Rizhi rizhi, HttpServletRequest request, HttpServletResponse response, Model model) {
		rizhi.setUser(UserUtils.getUser());
		List<Rizhi> rzList = rizhiService.findList(rizhi);
		if(rzList.size()>0){
			rizhi=rzList.get(0);	
		}
		model.addAttribute("rizhi", rizhi);
		
		return "modules/shenpi/rizhijilu";
	}
	
	
	//详情
	// @RequiresPermissions("grsw:rizhi:view")
	@RequestMapping(value = "form")
	public String form(Rizhi rizhi, Model model) {
		System.out.println("aaa="+rizhi.getRemarks());
		rizhiService.save(rizhi);
		model.addAttribute("rizhi", rizhi);
		return "modules/shenpi/rizhixq";
	}
	//保存
	@ResponseBody
	@RequestMapping(value = "save")
	public Map save(Rizhi rizhi, Model model, RedirectAttributes redirectAttributes) {
		String report = StringEscapeUtils.unescapeHtml4(rizhi.getReport());// appJson
		rizhi.setReport(report);
		addMessage(redirectAttributes, "保存日志成功");
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/main/index");
		try{
			rizhiService.save(rizhi);
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", 0);
		}
		return map;
		
	}

	@RequiresPermissions("grsw:rizhi:edit")
	@RequestMapping(value = "delete")
	public String delete(Rizhi rizhi, RedirectAttributes redirectAttributes) {
		rizhiService.delete(rizhi);
		addMessage(redirectAttributes, "删除日志成功");
		return "redirect:" + Global.getAdminPath() + "/grsw/rizhi/?repage";
	}

}