/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.store.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
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
import com.thinkgem.jeesite.common.persistence.RespData;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.ObjectUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.qywx.web.QywxController;
import com.thinkgem.jeesite.modules.store.entity.TBgyp;
import com.thinkgem.jeesite.modules.store.service.TBgypService;
import com.thinkgem.jeesite.modules.store.vo.TBgypExt;

/**
 * 耗材配件仓库Controller
 * @author szx
 * @version 2018-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/store/hcpj")
public class HcpjController extends BaseController {

	@Autowired
	private TBgypService tBgypService;
	
//	@Autowired
//	private static Logger logger = Logger.getLogger(HcpjController.class);
//	
	private static Logger cLogger = Logger.getLogger("CommonLog");
	
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
	
	@RequiresPermissions("store:hcpj:view")
	@RequestMapping(value = {"list", ""})
	public String list(TBgyp tBgyp, HttpServletRequest request, HttpServletResponse response, Model model) {
		tBgyp.setBusinessType("hcpjType");
		Page<TBgyp> page = tBgypService.findPage(new Page<TBgyp>(request, response), tBgyp); 
		model.addAttribute("page", page);
//		model.addAttribute("tBgyp",tBgyp);
		
//		cLogger.info("列表列表2"+","+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		
		return "modules/store/HcpjList";
	}

	@RequiresPermissions("store:hcpj:view")
	@RequestMapping(value = "form")
	public String form(TBgyp tBgyp, Model model) {
		model.addAttribute("tBgyp", tBgyp);
		return "modules/store/HcpjForm";
	}

	@RequiresPermissions("store:hcpj:edit")
	@RequestMapping(value = "save")
	public String save(TBgyp tBgyp, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tBgyp)){
			return form(tBgyp, model);
		}
		tBgyp.setBusinessType("hcpjType");
		tBgypService.save(tBgyp);
		addMessage(redirectAttributes, "保存耗材配件仓库成功");
		return "redirect:"+Global.getAdminPath()+"/store/hcpj/?repage";
	}
	
	@RequiresPermissions("store:hcpj:edit")
	@RequestMapping(value = "delete")
	public String delete(TBgyp tBgyp, RedirectAttributes redirectAttributes) {
		tBgypService.delete(tBgyp);
		addMessage(redirectAttributes, "删除耗材配件仓库成功");
		return "redirect:"+Global.getAdminPath()+"/store/hcpj/?repage";
	}



	/**
	 * 获取耗材配件列表
	 * @return
	 */
	@RequestMapping("findHcpj")
	@ResponseBody
	public List<TBgypExt> findHcpj() {
		String type = "hcpjType";
		return tBgypService.getDictListMulti(type);
	}
	
	/**
	 * 耗材配件详情
	 * @return
	 */
	@RequestMapping("getHcpj")
	@ResponseBody
	public RespData getHcpj(String id) {
		RespData respData = new RespData();
		try {
			TBgyp tBgyp = tBgypService.getIfNotDel(id);
			respData.setData(tBgyp);
		} catch (Exception e) {
			return respData.get(e, "查询失败");
		}
		return respData;
	}
}