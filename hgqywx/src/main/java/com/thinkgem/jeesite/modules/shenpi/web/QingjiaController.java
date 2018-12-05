/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.web;


import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.impl.persistence.entity.TaskEntity;
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
import com.thinkgem.jeesite.modules.oa.entity.TestAudit;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.shenpi.service.QingjiaService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 请假申请Controller
 * @author szx
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "${adminPath}/shenpi/qingjia")
public class QingjiaController extends BaseController {

	@Autowired
	private QingjiaService qingjiaService;
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private OfficeService officeService;
	@ModelAttribute
	public Qingjia get(@RequestParam(required=false) String id) {
		Qingjia entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qingjiaService.get(id);
		}
		if (entity == null){
			entity = new Qingjia();
			entity.setUser(UserUtils.getUser());
		}
		return entity;
	}
	
	//@RequiresPermissions("shenpi:qingjia:view")
	@RequestMapping(value = {"list", ""})
	public String list(Qingjia qingjia, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Qingjia> page = qingjiaService.findPage(new Page<Qingjia>(request, response), qingjia); 
		model.addAttribute("page", page);
		return "modules/shenpi/qingjiaList";
	}

	//@RequiresPermissions("shenpi:qingjia:view")
	@RequestMapping(value = "form")
	public String form(Qingjia qingjia, Model model) {
		
		String view = "qingjia";
		if (StringUtils.isNotBlank(qingjia.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(qingjia.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			qingjia.setUser(user);
			// 环节编号
			String taskDefKey = qingjia.getAct().getTaskDefKey();
			
			// 查看工单
			if(qingjia.getAct().isFinishTask()){
				view = "qingjiaForm";
			}
			// 修改环节
			else if ("modify".equals(taskDefKey)){
				view = "qingjiaForm";
			}
			// 审核环节
			else if (taskDefKey.contains("audit")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_nj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_sj")){//事假
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_bj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_tqj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_hj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_cj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_hlj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_gaj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_sangj")){
				view = "qingJiaAudit";
			}else if(taskDefKey.contains("audit_qt")){
				view = "qingJiaAudit";
			}else{// 未知环节，直接返回
			}
			String qjType = DictUtils.getDictLabel(qingjia.getType(), "qingjiaType", "其他");
			model.addAttribute("qjType", qjType);
			
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			qingjia.setUserName(user.getName());
			qingjia.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}

		model.addAttribute("qingjia", qingjia);
		
		return "modules/shenpi/" + view;
	}
	@RequestMapping(value = "form1")
	public String form1(Qingjia qingjia, Model model) {
		
		String view = "qingjia";
		if (StringUtils.isNotBlank(qingjia.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(qingjia.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			qingjia.setUser(user);
			// 环节编号
			String taskDefKey = qingjia.getAct().getTaskDefKey();
			
			if(actTaskService.getCurrentTask(qingjia.getAct().getProcInsId())==null) {
				view="qingjiaForm";
			}else {
				view="qingjiaForm1";
			}
			String qjType = DictUtils.getDictLabel(qingjia.getType(), "qingjiaType", "其他");
			model.addAttribute("qjType", qjType);
			
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			qingjia.setUserName(user.getName());
			qingjia.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}

		model.addAttribute("qingjia", qingjia);
		
		return "modules/shenpi/" + view;
	}
	
	//@RequiresPermissions("shenpi:qingjia:edit")
	@ResponseBody
	@RequestMapping(value = "save")
	public Map save(Qingjia qingjia, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, qingjia)){
//			return form(qingjia, model);
//		}
		//解析双引号
		 String approve=StringEscapeUtils.unescapeHtml4(qingjia.getApprove());//appJson
		 String copy=StringEscapeUtils.unescapeHtml4(qingjia.getCopy());//appJson
		 qingjia.setApprove(approve);
		 qingjia.setCopy(copy);
		addMessage(redirectAttributes, "保存请假申请成功");
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/main/index");
		try{
			qingjiaService.save(qingjia);
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", 0);
		}
		return map;
		//addMessage(redirectAttributes, "保存请假申请成功");
		//return "redirect:"+Global.getAdminPath()+"/shenpi?repage";
	}
	/**
	 * 工单执行（完成任务）
	 * @param testAudit
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "saveAudit")
	public String saveAudit(Qingjia qingjia, Model model) throws Exception {
//		if (StringUtils.isBlank(qingjia.getAct().getFlag())
//				/*|| StringUtils.isBlank(qingjia.getAct().getComment())*/){
//			addMessage(model, "请填写审核意见。");
//			return form(qingjia, model);
//		}
		 String approve=StringEscapeUtils.unescapeHtml4(qingjia.getTaskApprove());//appJson
		 qingjia.setTaskApprove(approve);
			qingjiaService.auditSave(qingjia);
		return "redirect:" + adminPath + "/shenpi/wode";
	}
	
	//@RequiresPermissions("shenpi:qingjia:edit")
	@RequestMapping(value = "delete")
	public String delete(Qingjia qingjia, RedirectAttributes redirectAttributes) {
		qingjiaService.delete(qingjia);
		addMessage(redirectAttributes, "删除请假申请成功");
		return "redirect:"+Global.getAdminPath()+"/shenpi/qingjia/?repage";
	}

}