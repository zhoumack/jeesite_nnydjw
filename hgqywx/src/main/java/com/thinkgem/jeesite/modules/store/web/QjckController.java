/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.store.entity.Qjck;
import com.thinkgem.jeesite.modules.store.service.QjckService;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 请假仓库记录Controller
 * @author szx
 * @version 2018-10-24
 */
@Controller
@RequestMapping(value = "${adminPath}/store/qjck")
public class QjckController extends BaseController {

	@Autowired
	private QjckService qjckService;
	@Autowired
	private DictDao dictDao;
	
	@ModelAttribute
	public Qjck get(@RequestParam(required=false) String id) {
		Qjck entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qjckService.get(id);
		}
		if (entity == null){
			entity = new Qjck();
		}
		return entity;
	}
	
	@RequiresPermissions("store:qjck:view")
	@RequestMapping(value = {"list", ""})
	public String list(Qjck qjck, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Qjck> page = qjckService.findPage(new Page<Qjck>(request, response), qjck); 
		model.addAttribute("page", page);
		return "modules/store/qjckList";
	}

	@RequiresPermissions("store:qjck:view")
	@RequestMapping(value = "form")
	public String form(Qjck qjck, Model model) {
		model.addAttribute("qjck", qjck);
		return "modules/store/qjckForm";
	}

	@RequiresPermissions("store:qjck:edit")
	@RequestMapping(value = "save")
	public String save(Qjck qjck, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qjck)){
			return form(qjck, model);
		}
		qjckService.save(qjck);
		addMessage(redirectAttributes, "保存请假仓库记录成功");
		return "redirect:"+Global.getAdminPath()+"/store/qjck/?repage";
	}

	/**
	 * 得到用户剩余天数并返回
	 * @param userId
	 * @param type
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="syts")
	public float syts(String userId,String type,HttpServletRequest request, HttpServletResponse response, Model model) {
		Qjck qjck= qjckService.findBydqnx(userId, type);
		if(qjck.getDays()==0) {
			return -1;
		}else {
			return qjck.getRestdays();
		}
	}
	@RequiresPermissions("store:qjck:edit")
	@RequestMapping(value = "delete")
	public String delete(Qjck qjck, RedirectAttributes redirectAttributes) {
		qjckService.delete(qjck);
		addMessage(redirectAttributes, "删除请假仓库记录成功");
		return "redirect:"+Global.getAdminPath()+"/store/qjck/?repage";
	}

}