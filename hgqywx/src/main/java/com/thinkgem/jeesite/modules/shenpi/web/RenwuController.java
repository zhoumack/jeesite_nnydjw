/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.web;

import java.util.ArrayList;
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
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.actfenpei.entity.ActFenpeiUser;
import com.thinkgem.jeesite.modules.actfenpei.service.ActFenpeiUserService;
import com.thinkgem.jeesite.modules.shenpi.entity.Paiche;
import com.thinkgem.jeesite.modules.shenpi.entity.Renwu;
import com.thinkgem.jeesite.modules.shenpi.service.RenwuService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.myutils.Node;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 任务安排Controller
 * @author 刘伟
 * @version 2018-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}/shenpi/renwu")
public class RenwuController extends BaseController {

	@Autowired
	private RenwuService renwuService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private ActFenpeiUserService actFenpeiUserService;
	@Autowired
	private SystemService systemService;
	
	@ModelAttribute
	public Renwu get(@RequestParam(required=false) String id) {
		Renwu entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = renwuService.get(id);
		}
		if (entity == null){
			entity = new Renwu();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Renwu renwu, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Renwu> page = renwuService.findPage(new Page<Renwu>(request, response), renwu); 
		model.addAttribute("page", page);
		return "modules/shenpi/renwuList";
	}

	//@RequiresPermissions("shenpi:renwu:view")
	@RequestMapping(value = "form")
	public String form(Renwu renwu, Model model) {
		String view = "renwu";
		if (StringUtils.isNotBlank(renwu.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(renwu.getUser().getId());
			user.setOffice(officeService.get(user.getOffice()));
			renwu.setUser(user);
			// 环节编号
			String taskDefKey = renwu.getAct().getTaskDefKey();
			
			// 查看工单
			if(renwu.getAct().isFinishTask()){
				view = "renwuForm";
				List<Map> maps=new ArrayList<Map>();
				//此流程实例fkpcxx节点的所有任务执行信息
				ActFenpeiUser afu=new ActFenpeiUser(ActUtils.PD_Renwu[0], renwu.getAct().getProcInsId(), "rwfk");
				List<ActFenpeiUser> afus=actFenpeiUserService.findList(afu);
				for(ActFenpeiUser u:afus){
					String taskRemark=u.getTaskRemarks();
					Map map=splitArgs(taskRemark);
					map.put("user", UserUtils.get(u.getUser().getId()));
					map.put("commont", u.getTaskComment());
					maps.add(map);
				}
				model.addAttribute("bmldfprw", maps);
			}
			// 修改环节
			else if ("modify".equals(taskDefKey)){
				view = "renwuForm";
			}
			// 审核环节
			else if ("audit".equals(taskDefKey)){
				view = "renwuAudit";
			}else if ("bmldfp".equals(taskDefKey)){//部门领导再分配
				view = "renwuAudit";
			}else if ("rwfk".equals(taskDefKey)){//任务反馈
				view = "renwufankui";
			}
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			renwu.setUserName(user.getName());
			renwu.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
			user.setRole(renwuService.getRoleByUser(null));
		}

		model.addAttribute("renwu", renwu);
		
		return "modules/shenpi/" + view;
	}

	@ResponseBody
	@RequestMapping(value = "save")
	public Map save(Renwu renwu, Model model, RedirectAttributes redirectAttributes) {
		
		//解析双引号
		 String approve=StringEscapeUtils.unescapeHtml4(renwu.getApprove());//appJson
		 String copy=StringEscapeUtils.unescapeHtml4(renwu.getCopy());//appJson
		 renwu.setApprove(approve);
		 renwu.setCopy(copy);
		Map map=new HashedMap();
		map.put("success", 1);
		map.put("url", "/main/index");
		try{
			renwuService.save(renwu);
		}catch(Exception e){
			e.printStackTrace();
			map.put("success", 0);
		}
		return map;
	}
	 
	@RequestMapping(value = "saveAudit")
	public String saveAudit(Renwu renwu, Model model) throws Exception {
		 String approve=StringEscapeUtils.unescapeHtml4(renwu.getTaskApprove());//appJson
		 renwu.setTaskApprove(approve);
		 renwuService.auditSave(renwu);
	    return "redirect:" + adminPath + "/shenpi/wode";
	}
	@RequiresPermissions("shenpi:renwu:edit")
	@RequestMapping(value = "delete")
	public String delete(Renwu renwu, RedirectAttributes redirectAttributes) {
		renwuService.delete(renwu);
		addMessage(redirectAttributes, "删除任务安排成功");
		return "redirect:"+Global.getAdminPath()+"/shenpi/renwu/?repage";
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
				if(pros.length>2) map.put(pros[0], s.substring(pros[0].length()+1, s.length()));
			} 
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "getRoleUserForApply")
	public List getRoleUserForApply(Model model){
		String renname="";
		List treejson=null;
		renname=UserUtils.getRoleByUserId();
			if(renname.equals("fgld")){//分管领导
				renname="bmld";
				Role role=systemService.getRoleByEnname(renname);
				List<User> users=systemService.finduser(new User(new Role(role.getId())));
				List<Node> nodes = new ArrayList<Node>();
				Node node=new Node();
				node=Node.convertToNode(role);
				nodes.add(node);
				return treejson=officeService.getRoleAndUser(nodes,role);
			}
			if(renname.equals("bmld")){//部门领导
				Office office=UserUtils.get(UserUtils.getUser().getId()).getOffice();
				List<Node> nodes = new ArrayList<Node>();
				Node node=new Node();
				node=Node.convertToNode1(office);
				nodes.add(node);
				return treejson=officeService.getOfficeUser(nodes,office);
			}if(renname.equals("nq")){//部门领导
				Office office=UserUtils.get(UserUtils.getUser().getId()).getOffice();
				List<Node> nodes = new ArrayList<Node>();
				Node node=new Node();
				node=Node.convertToNode1(office);
				nodes.add(node);
				//得到的部门用户
				List<Node> nodeList=officeService.getOfficeUser(nodes,office);
				//取出部门父节点
				Node officeNode=nodeList.get(0);
				//取出部门下的用户
				List<Node> childrens=officeNode.getChildren();
				//用户temp容器
				List<Node> newChildrens=new ArrayList<Node>();
				//筛选掉领导用户
				for(Node nodeUser:childrens){
					String roleName=UserUtils.getRoleByUserId(nodeUser.getId());
					if(roleName.equals("bmld")||roleName.equals("fgld")){
						continue;
					}
					newChildrens.add(nodeUser);
				}
				//重新赋值无领导角色的用户
				officeNode.setChildren(newChildrens);
				treejson=nodeList;
			}
			if(renname.equals("ganjing")){//干警
				treejson=new ArrayList<Node>();
			}
		System.out.println(JsonMapper.toJsonString(treejson));
		return treejson;
	}
	
}