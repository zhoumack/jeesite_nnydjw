/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.web;

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
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.shenpi.entity.Weixiu;
import com.thinkgem.jeesite.modules.shenpi.service.WeixiuService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 维修申请Controller
 * @author szx
 * @version 2018-10-16
 */
@Controller
@RequestMapping(value = "${adminPath}/shenpi/weixiu")
public class WeixiuController extends BaseController {
	@Autowired
	private OfficeService officeService;
	@Autowired
	private WeixiuService weixiuService;
	@Autowired
	private ActTaskService actTaskService;
	
	@ModelAttribute
	public Weixiu get(@RequestParam(required=false) String id) {
		Weixiu entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = weixiuService.get(id);
		}
		if (entity == null){
			entity = new Weixiu();
			entity.setUser(UserUtils.getUser());
		}
		return entity;
	}
	
	//@RequiresPermissions("shenpi:weixiu:view")
	@RequestMapping(value = {"list", ""})
	public String list(Weixiu weixiu, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Weixiu> page = weixiuService.findPage(new Page<Weixiu>(request, response), weixiu); 
		model.addAttribute("page", page);
		return "modules/shenpi/weixiuList";
	}

	//@RequiresPermissions("shenpi:weixiu:view")
	@RequestMapping(value = "form")
	public String form(Weixiu weixiu, Model model) {
		String view = "weixiu";
		if (StringUtils.isNotBlank(weixiu.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(weixiu.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			weixiu.setUser(user);
			// 环节编号
			String taskDefKey = weixiu.getAct().getTaskDefKey();
			
			// 查看工单
			if(weixiu.getAct().isFinishTask()){
				view = "weixiusumForm";
			}
			// 修改环节
			else if ("modify".equals(taskDefKey)){
				view = "weixiuForm";
			}
			// 审核环节
			else if ("audit".equals(taskDefKey)){
				view = "weixiuAudit";
			}else if ("audit2".equals(taskDefKey)){
				view = "weixiuAudit";
			}else if("audit3".equals(taskDefKey)) {
				view = "weixiufankui";
			}
			String userName=weixiu.getUser().getName();
			if(weixiu.getTruster()!=null) {
				userName=UserUtils.get(weixiu.getTruster().getId()).getName();
				weixiu.setTruster(UserUtils.get(weixiu.getTruster().getId()));
			}
			model.addAttribute("userName", userName);
			//String esource=DictUtils.getDictLabel(weixiu.getEsource(), "wxsxlyType", "部门移送");
			//model.addAttribute("esource", esource);
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			weixiu.setUserName(user.getName());
			weixiu.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}

		model.addAttribute("weixiu", weixiu);
		
		return "modules/shenpi/" + view;
	}
	
	@RequestMapping(value = "form1")
	public String form1(Weixiu weixiu, Model model) {
		String view = "weixiu";
		if (StringUtils.isNotBlank(weixiu.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(weixiu.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			weixiu.setUser(user);
			// 环节编号
			String taskDefKey = weixiu.getAct().getTaskDefKey();
			
			if(actTaskService.getCurrentTask(weixiu.getAct().getProcInsId())==null) {
				view="weixiusumForm";
			}else {
				view="weixiuForm1";
			}
			String userName=weixiu.getUser().getName();
			if(weixiu.getTruster()!=null) {
				userName=UserUtils.get(weixiu.getTruster().getId()).getName();
				weixiu.setTruster(UserUtils.get(weixiu.getTruster().getId()));
			}
			model.addAttribute("userName", userName);
			String esource=DictUtils.getDictLabel(weixiu.getEsource(), "wxsxlyType", "部门移送");
			model.addAttribute("esource", esource);
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			weixiu.setUserName(user.getName());
			weixiu.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}

		model.addAttribute("weixiu", weixiu);
		
		return "modules/shenpi/" + view;
	}
	
	//@RequiresPermissions("shenpi:weixiu:edit")
	@ResponseBody
	@RequestMapping(value = "save")
	public Map save(Weixiu weixiu, Model model, RedirectAttributes redirectAttributes) {
		//解析双引号
		 String approve=StringEscapeUtils.unescapeHtml4(weixiu.getApprove());//appJson
		 String copy=StringEscapeUtils.unescapeHtml4(weixiu.getCopy());//appJson
		 if(weixiu.getUserName()!=null) {
			 String userName=StringEscapeUtils.unescapeHtml4(weixiu.getUserName());//appJson
			 weixiu.setUserName(userName);
		 }
		 weixiu.setApprove(approve);
		 weixiu.setCopy(copy);
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/main/index");
		try{
			weixiuService.save(weixiu);
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", 0);
		}
		return map;
	}
	
	/**
	 * 工单执行（完成任务）
	 * @param testAudit
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "saveAudit")
	public String saveAudit(Weixiu weixiu, Model model) throws Exception {
//		if (StringUtils.isBlank(weixiu.getAct().getFlag())
//				/*|| StringUtils.isBlank(weixiu.getAct().getComment())*/){
//			addMessage(model, "请填写审核意见。");
//			return form(weixiu, model);
//		}
		 String approve=StringEscapeUtils.unescapeHtml4(weixiu.getTaskApprove());//appJson
		 weixiu.setApprove(approve);
		if(weixiu.getWorker()!=null) {
			String worker=StringEscapeUtils.unescapeHtml4(weixiu.getWorker());
			weixiu.setWorker(worker);
		}
		
			weixiuService.auditSave(weixiu);
		return "redirect:" + adminPath + "/shenpi/wode";
	}
	
	@RequiresPermissions("shenpi:weixiu:edit")
	@RequestMapping(value = "delete")
	public String delete(Weixiu weixiu, RedirectAttributes redirectAttributes) {
		weixiuService.delete(weixiu);
		addMessage(redirectAttributes, "删除维修申请成功");
		return "redirect:"+Global.getAdminPath()+"/shenpi/weixiu/?repage";
	}

}