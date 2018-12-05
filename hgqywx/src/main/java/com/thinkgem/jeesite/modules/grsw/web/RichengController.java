/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.grsw.web;

import java.util.Date;
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
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.grsw.entity.Richeng;
import com.thinkgem.jeesite.modules.grsw.entity.Rizhi;
import com.thinkgem.jeesite.modules.grsw.service.RichengService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 日程安排Controller
 * @author szx
 * @version 2018-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}/grsw/richeng")
public class RichengController extends BaseController {

	@Autowired
	private RichengService richengService;
	
	@ModelAttribute
	public Richeng get(@RequestParam(required=false) String id) {
		Richeng entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = richengService.get(id);
		}
		if (entity == null){
			entity = new Richeng();
		}
		return entity;
	}
	

	@RequestMapping(value = {"list", ""})
	public String list(Richeng richeng, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Richeng> page = richengService.findPage(new Page<Richeng>(request, response), richeng); 
		model.addAttribute("page", page);
		return "modules/shenpi/richengindex";
	}
	
	@RequestMapping(value = {"listDate", ""})
	public String listDate(Richeng richeng, HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("时间="+richeng.getStartTime());
		if(richeng.getStartTime()==null) {
			richeng.setStartTime(new Date());
		}
		richeng.setUser(UserUtils.getUser());
		List<Richeng> rcList = richengService.findList(richeng);
		System.out.println("长度:"+rcList.size());
		model.addAttribute("list", rcList);
		return "modules/shenpi/richengindex";
	}
	
	@ResponseBody
	@RequestMapping(value = {"listDates", ""})
	public List listDates(Richeng richeng, HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("时间="+richeng.getStartTime());
		if(richeng.getStartTime()==null) {
			richeng.setStartTime(new Date());
		}
		richeng.setUser(UserUtils.getUser());
		List<Richeng> rcList = richengService.findList(richeng);
		System.out.println("长度:"+rcList.size());
		//model.addAttribute("list", rcList);
		return rcList;
	}
	

	
	@RequestMapping(value = "form")
	public String form(Richeng richeng, Model model,String state) {
		String url = "modules/shenpi/richengxq";
		
		System.out.println("aaaa="+(state!=null && "1".equals(state)));
		if(state!=null && "1".equals(state)) {
			System.err.println("----------------------");
			url="modules/shenpi/richengUp";
		}
		model.addAttribute("richeng", richeng);
		return url;
	}

    @ResponseBody
	@RequestMapping(value = "save")
	public Map save(Richeng richeng, Model model, RedirectAttributes redirectAttributes) {
    	String report = StringEscapeUtils.unescapeHtml4(richeng.getPeople());// appJson
		richeng.setPeople(report);
    	addMessage(redirectAttributes, "保存日程成功");
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/grsw/richeng/listDate");
		try{
			richengService.save(richeng);
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", 0);
		}
		return map;
	}
	
	
    @ResponseBody
	@RequestMapping(value = "delete")
	public Map delete(Richeng richeng, RedirectAttributes redirectAttributes) {
		
		addMessage(redirectAttributes, "删除日程安排成功");
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/grsw/richeng/listDate");
		try{
			richengService.delete(richeng);
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", 0);
		}
		return map;
	
	}

}