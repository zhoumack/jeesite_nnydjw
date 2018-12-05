/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.web;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.api.SendMessageApi;
import com.jfinal.qyweixin.sdk.msg.send.QiYeTextMsg;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;
import com.thinkgem.jeesite.modules.actfenpei.service.ActFenpeiUserService;
import com.thinkgem.jeesite.modules.shenpi.entity.Paiche;
import com.thinkgem.jeesite.modules.shenpi.service.PaicheService;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.myutils.Node;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 派车申请Controller
 * @author szx
 * @version 2018-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/shenpi/paiche")
public class PaicheController extends BaseController {

	@Autowired
	private PaicheService paicheService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private ActFenpeiUserService actFenpeiUserService;
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private SystemService systemService;
	@ModelAttribute
	public Paiche get(@RequestParam(required=false) String id) {
		Paiche entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = paicheService.get(id);
		}
		if (entity == null){
			entity = new Paiche();
			entity.setUser(UserUtils.getUser());
			
		}
		return entity;
	}
	
//	@RequiresPermissions("shenpi:paiche:view")
	@RequestMapping(value = {"list", ""})
	public String list(Paiche paiche, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Paiche> page = paicheService.findPage(new Page<Paiche>(request, response), paiche); 
		model.addAttribute("page", page);
		return "modules/shenpi/paicheList";
	}

	public Map splitArgs(String taskRemark){
		Map map=new HashedMap();
		if(StringUtils.isNoneBlank(taskRemark)){
			String[] args=taskRemark.split("&");
			for(String s:args){
				String[]  pros=s.split(":");
				if(pros.length==1){
					map.put(pros[0], "");
					continue;
				}
				map.put(pros[0], pros[1]);
			}
		}
		return map;
	}
//	@RequiresPermissions("shenpi:paiche:view")
	@RequestMapping(value = "form")
	public String form(Paiche paiche, Model model) {
		String view = "paiche";
		if (StringUtils.isNotBlank(paiche.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(paiche.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			paiche.setUser(user);
			// 环节编号
			String taskDefKey = paiche.getAct().getTaskDefKey();
			
			// 查看工单
			if(paiche.getAct().isFinishTask()){
				view = "paicheForm";
				List<Map> maps=new ArrayList<Map>();
				//此流程实例fkpcxx节点的所有任务执行信息
				ActFenpeiUser afu=new ActFenpeiUser(ActUtils.PD_PaiChe[0], paiche.getAct().getProcInsId(), "fkpcxx");
				List<ActFenpeiUser> afus=actFenpeiUserService.findList(afu);
				for(ActFenpeiUser u:afus){
					String taskRemark=u.getTaskRemarks();
					ActFenpeiUser afu2=new ActFenpeiUser(ActUtils.PD_PaiChe[0], paiche.getAct().getProcInsId(), "txhysj",u.getUser());
					List<ActFenpeiUser> afus2=actFenpeiUserService.findList(afu2);
					Map map=splitArgs(taskRemark);
					map.put("user", UserUtils.get(u.getUser().getId()));
					map.put("commont", u.getTaskComment());
					if(afus2.size()>0)
							map.putAll(splitArgs(afus2.get(0).getTaskRemarks()));
					maps.add(map);
				}
				model.addAttribute("jsyxx", maps);
			}
			// 修改环节
			else if ("modify".equals(taskDefKey)){
				view = "paicheForm";
			}
			// 审核环节
			else if ("audit".equals(taskDefKey)){
				view = "paicheAudit";
				model.addAttribute("jiedian", "audit");
			}else if ("bmldrsp".equals(taskDefKey)){//申请部门领导人审批
				view = "paicheAudit";
				model.addAttribute("jiedian", "bmldrsp");
			}else if ("fgldsp".equals(taskDefKey)){//分管领导审批
				view = "paicheAudit";
				model.addAttribute("jiedian", "fgldsp");
			}else if ("nqfpjsy".equals(taskDefKey)){//司机班长分配驾驶员
				view = "paicheAudit";
				model.addAttribute("jiedian", "nqfpjsy");
			}else if ("fkpcxx".equals(taskDefKey)){//驾驶员反馈派车信息
				view = "paiche_sijiAudit";
			//	lxdh hysj cph user bz
				model.addAttribute("fkxx", paiche);
			}else if ("txhysj".equals(taskDefKey)){//驾驶员填写回院时间
				view = "paiche_wanchengAudit";
			}
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			paiche.setUserName(user.getName());
			paiche.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
			user.setRole(paicheService.getRoleByUser(null));
			;
		}

		model.addAttribute("paiche", paiche);
		
		return "modules/shenpi/" + view;
	}
	
	@RequestMapping(value = "form1")
	public String form1(Paiche paiche, Model model) {
		String view = "paiche";
		if (StringUtils.isNotBlank(paiche.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(paiche.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			paiche.setUser(user);
			// 环节编号
			String taskDefKey = paiche.getAct().getTaskDefKey();
			
			if(actTaskService.getCurrentTask(paiche.getAct().getProcInsId())==null) {
				view="paicheForm";
			}else {
				view="paicheForm1";
			}
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			paiche.setUserName(user.getName());
			paiche.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}

		model.addAttribute("paiche", paiche);
		
		return "modules/shenpi/" + view;
	}

//	@RequiresPermissions("shenpi:paiche:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public Map save(Paiche paiche, Model model, RedirectAttributes redirectAttributes) {
		//解析双引号
		 String approve=StringEscapeUtils.unescapeHtml4(paiche.getApprove());//appJson
		 String copy=StringEscapeUtils.unescapeHtml4(paiche.getCopy());//appJson
		 paiche.setApprove(approve);
		 paiche.setCopy(copy);
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/main/index");
		try{
			paicheService.save(paiche);
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
	public String saveAudit(Paiche paiche, Model model) throws Exception {
		 String approve=StringEscapeUtils.unescapeHtml4(paiche.getTaskApprove());//appJson
		 paiche.setTaskApprove(approve);
			paicheService.auditSave(paiche);
		return "redirect:" + adminPath + "/shenpi/wode";
	}
	
//	@RequiresPermissions("shenpi:paiche:edit")
	@RequestMapping(value = "delete")
	public String delete(Paiche paiche, RedirectAttributes redirectAttributes) {
		paicheService.delete(paiche);
		addMessage(redirectAttributes, "删除派车申请成功");
		return "redirect:"+Global.getAdminPath()+"/shenpi/paiche/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "getRoleUserForApply")
	public List getRoleUserForApply(String  ename,String isCommon ,Model model){
		String renname="";
		if(isCommon.equals("1")){
			if(ename.equals("jwbzb_ld")||ename.equals("fgld")){//检务保障部领导
				return null;
			}
			if(ename.equals("bmld")){//部门领导
				return null;
			}
		}else{//非正常派车
			if(ename.equals("jwbzb_ld")){//检务保障部领导
				renname="fgld";
			}
			if(ename.equals("bmld")){//部门领导
				renname="fgld";
			}
			
		}
		if(ename.equals("ganjing")) {
			renname=UserUtils.getUser().getOffice().getCode()+"_ld";
		}
		Role role=systemService.getRoleByEnname(renname);
	//	List<User> users=systemService.finduser(new User(new Role(role.getId())));
	//	TreeBuilder builder=new TreeBuilder();
		List<Node> nodes = new ArrayList<Node>();
		Node node=new Node();
		node=Node.convertToNode(role);
		nodes.add(node);
		List treejson=officeService.getRoleAndUser(nodes,role);
		System.out.println(JsonMapper.toJsonString(treejson));
		return treejson;
	}
}