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
import com.thinkgem.jeesite.modules.shenpi.entity.Bgyplq;
import com.thinkgem.jeesite.modules.shenpi.service.BgyplqService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 耗材配件领取申请Controller
 * @author szx
 * @version 2018-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/shenpi/bgyplq")
public class BgyplqController extends BaseController {

	@Autowired
	private BgyplqService bgyplqService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private ActTaskService actTaskService;
	
	@ModelAttribute
	public Bgyplq get(@RequestParam(required=false) String id) {
		Bgyplq entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = bgyplqService.get(id);
		}
		if (entity == null){
			entity = new Bgyplq();
			entity.setUser(UserUtils.getUser());
		}
		return entity;
	}
	
	//@RequiresPermissions("shenpi:bgyplq:view")
	@RequestMapping(value = {"list", ""})
	public String list(Bgyplq bgyplq, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Bgyplq> page = bgyplqService.findPage(new Page<Bgyplq>(request, response), bgyplq); 
		model.addAttribute("page", page);
		return "modules/shenpi/bgyplqList";
	}

	//@RequiresPermissions("shenpi:bgyplq:view")
	@RequestMapping(value = "form")
	public String form(Bgyplq bgyplq, Model model) {
		String view = "bgyplq";
		if (StringUtils.isNotBlank(bgyplq.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(bgyplq.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			bgyplq.setUser(user);
			// 环节编号
			String taskDefKey = bgyplq.getAct().getTaskDefKey();
			model.addAttribute("taskDefKey",taskDefKey);
			// 查看工单
			if(bgyplq.getAct().isFinishTask()){
				view = "bgyplqForm";
			}
			// 修改环节
			else if ("modify".equals(taskDefKey)){
				view = "bgyplqForm";
			}
			// 申请环节
			else if ("audit".equals(taskDefKey)){
				view = "bgyplqAudit";
			// 审核环节
			}else if ("audit2".equals(taskDefKey)){
				view = "bgyplqAudit";
			}
			//出库环节
			else if ("audit_ck".equals(taskDefKey)){
				view = "bgyplq_ckAudit";
			}
			//申请人确认环节
			else if ("audit3".equals(taskDefKey)){
				view = "bgyplqConfirm";
			}
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			bgyplq.setUserName(user.getName());
			bgyplq.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}

		
		model.addAttribute("bgyplq", bgyplq);
		
		return "modules/shenpi/" + view;
	}
	
	@RequestMapping(value = "form1")
	public String form1(Bgyplq bgyplq, Model model) {
		String view = "bgyplq";
		if (StringUtils.isNotBlank(bgyplq.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(bgyplq.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			bgyplq.setUser(user);
			// 环节编号
			String taskDefKey = bgyplq.getAct().getTaskDefKey();
			model.addAttribute("taskDefKey",taskDefKey);
			if(actTaskService.getCurrentTask(bgyplq.getAct().getProcInsId())==null) {
				view="bgyplqForm";
			}else {
				view="bgyplqForm1";
			}
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			bgyplq.setUserName(user.getName());
			bgyplq.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}

		
		model.addAttribute("bgyplq", bgyplq);
		
		return "modules/shenpi/" + view;
	}

	/**
	 * 申请
	 * @param bgyplq
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	//@RequiresPermissions("shenpi:bgyplq:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public Map save(Bgyplq bgyplq, Model model, RedirectAttributes redirectAttributes) {
		//解析双引号
		 String approve=StringEscapeUtils.unescapeHtml4(bgyplq.getApprove());//appJson
		 String copy=StringEscapeUtils.unescapeHtml4(bgyplq.getCopy());//appJson
		 bgyplq.setApprove(approve);
		 bgyplq.setCopy(copy);
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/main/index");
		try{
			bgyplqService.save(bgyplq);
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
	 * @param worker //出库步骤的任务执行人
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "saveAudit")
	public String saveAudit(Bgyplq bgyplq, Model model,String worker) throws Exception {
//		if (StringUtils.isBlank(bgyplq.getAct().getFlag())
//				/*|| StringUtils.isBlank(bgyplq.getAct().getComment())*/){
//			addMessage(model, "请填写审核意见。");
//			return form(bgyplq, model);
//		}
			bgyplqService.auditSave(bgyplq,worker);
		return "redirect:" + adminPath + "/shenpi/wode";
	}	
//	
//	/**
//	 * 申请人确认领取物品
//	 * @param bgyplq
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "confirmApply")
//	public String confirmApply(Bgyplq bgyplq, Model model) throws Exception {
//			bgyplqService.confirmApply(bgyplq);
//		return "redirect:" + adminPath + "/shenpi/wode";
//	}
	
	//@RequiresPermissions("shenpi:bgyplq:edit")
	@RequestMapping(value = "delete")
	public String delete(Bgyplq bgyplq, RedirectAttributes redirectAttributes) {
		bgyplqService.delete(bgyplq);
		addMessage(redirectAttributes, "删除办公用品申请成功");
		return "redirect:"+Global.getAdminPath()+"/shenpi/bgyplq/?repage";
	}

}