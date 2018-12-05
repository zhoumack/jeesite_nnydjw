/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shenpi.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.task.IdentityLink;
import org.apache.commons.collections.map.HashedMap;
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
import com.thinkgem.jeesite.common.persistence.ActEntity;
import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.entity.Act;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.act.utils.ActUtils;
import com.thinkgem.jeesite.modules.oa.entity.TestAudit;
import com.thinkgem.jeesite.modules.shenpi.entity.Bgyplq;
import com.thinkgem.jeesite.modules.shenpi.entity.Paiche;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.shenpi.entity.Renwu;
import com.thinkgem.jeesite.modules.shenpi.entity.Weixiu;
import com.thinkgem.jeesite.modules.shenpi.service.BgyplqService;
import com.thinkgem.jeesite.modules.shenpi.service.PaicheService;
import com.thinkgem.jeesite.modules.shenpi.service.QingjiaService;
import com.thinkgem.jeesite.modules.shenpi.service.RenwuService;
import com.thinkgem.jeesite.modules.shenpi.service.WeixiuService;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.test.entity.Test;

/**
 * 出差申请Controller
 * 
 * @author szx
 * @version 2018-08-20
 */
@Controller
@RequestMapping(value = "${adminPath}/shenpi")
public class shenPiController extends BaseController {
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private QingjiaService qingJiaService;
	@Autowired
	private WeixiuService weixiuService;
	@Autowired
	private BgyplqService bgyplqService;
	@Autowired
	private PaicheService paicheService;
	@Autowired
	private RenwuService renwuService;
	@RequestMapping(value = { "list", "" })
	public String form(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/shenpi/xinshenqing";
	}
	//
	// /**
	// * 访问静态页面
	// */
	// @RequestMapping("index")
	// public String getIndex(Test test,Model model) {
	// model.addAttribute("test",test);
	// return "mobile/modules/approve/index";
	// }

	@RequestMapping(value = "index")
	public String getIndex(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/sys/sysIndex";

	}

	@RequestMapping(value = "xzrenyuan")
	public String xzrenyuan(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/shenpi/xuanzerenyuan";

	}

	// 我的审批(代办/已办)
	@RequestMapping(value = "wode")
	public String wode(Boolean dbOrYb, HttpServletRequest request, HttpServletResponse response, Model model) {
		if (dbOrYb == null)
			dbOrYb = true;

		Act act = new Act();
		List<Act> list = new ArrayList<Act>();
		// 设置流程搜索参数
		// act.setProcDefKey(ActUtils.PD_QingJia[0]);
		// act.setProcDefKey(ActUtils.PD_Chuchai[0]);
		// act.setProcDefKey(ActUtils.PD_PaiChe[0]);
		String view = "modules/shenpi/woshenpiDb";
		Page<Act> page = new Page<Act>(request, response);
		if (dbOrYb) {
			List dblist = new ArrayList();
			list = actTaskService.todoList(act);
			view = "modules/shenpi/woshenpiDb";

		} else {
			page = actTaskService.historicList(page, act);
			list = page.getList();
			view = "modules/shenpi/woshenpiYb";
		}

		model.addAttribute("list", list);
		model.addAttribute("dbOrYb", dbOrYb);
		return view;
	}

	// 当前用户所在部门所有的未处理任务
	@RequestMapping(value = "wodeOffice")
	public String wodeOffice(HttpServletRequest request, HttpServletResponse response, Model model) {
		Act act = new Act();
		List<List<Act>> list = new ArrayList<List<Act>>();
		// 设置流程搜索参数
		// act.setProcDefKey(ActUtils.PD_QingJia[0]);
		// act.setProcDefKey(ActUtils.PD_Chuchai[0]);
		// act.setProcDefKey(ActUtils.PD_PaiChe[0]);
		String view = "modules/shenpi/woshenpiw";
		Page<Act> page = new Page<Act>(request, response);
		
		list = actTaskService.todoListOffice(act);

		model.addAttribute("list", list);
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value = "wodeOfficeRole")
	public String wodeOfficeRole() {
		return actTaskService.wodeOfficeRole();
	}

	// 我的审批(代办/已办)
	@RequestMapping(value = "wode1")
	public String wode1(Boolean dbOrYb, HttpServletRequest request, HttpServletResponse response, Model model,
			int pageNum, Integer begin, Integer size) {
		if (dbOrYb == null)
			dbOrYb = true;

		Act act = new Act();
		List<Act> list = new ArrayList<Act>();
		// 设置流程搜索参数
		// act.setProcDefKey(ActUtils.PD_QingJia[0]);
		// act.setProcDefKey(ActUtils.PD_Chuchai[0]);
		// act.setProcDefKey(ActUtils.PD_PaiChe[0]);
		String view = "modules/shenpi/woshenpiDb";
		Page<Act> page = new Page<Act>(request, response);
		if (dbOrYb) {
			List dblist = new ArrayList();
			list = actTaskService.todoList(act);

			view = "modules/shenpi/woshenpiDb";

		} else {
			page = actTaskService.historicList(page, act);
			list = page.getList();
			view = "modules/shenpi/woshenpiYb";
		}
		Page page1 = new Page(begin, size, list.size(), list);
		page.initialize();
		model.addAttribute("page", page1);
		model.addAttribute("list", list);
		model.addAttribute("dbOrYb", dbOrYb);
		return view;
	}

	@RequestMapping(value = "yitijiao")
	public String yitijiao(HttpServletRequest request, HttpServletResponse response, Model model, Integer begin,
			Integer size) {
		if (begin == null)
			begin = 1;
		if (size == null)
			size = 10;
		Qingjia qingjia = new Qingjia();
		qingjia.setUser(UserUtils.getUser());
		List qjlist = qingJiaService.findList(qingjia);
		
		Bgyplq bgyplq = new Bgyplq();
		bgyplq.setUser(UserUtils.getUser());
		List bgyplqlist = bgyplqService.findList(bgyplq);
		
		Weixiu weixiu = new Weixiu();
		weixiu.setUser(UserUtils.getUser());
		List wxlist = weixiuService.findList(weixiu);
		
		Paiche paiche = new Paiche();
		paiche.setUser(UserUtils.getUser());
		List pclist = paicheService.findList(paiche);
		
		Renwu renwu =new Renwu();
		renwu.setUser(UserUtils.getUser());
		List renwuList = renwuService.findList(renwu);
		List shenpilist = new ArrayList();
		
		shenpilist.addAll(qjlist);
		shenpilist.addAll(wxlist);
		shenpilist.addAll(pclist);
		shenpilist.addAll(bgyplqlist);
		shenpilist.addAll(renwuList);
		// Page<Chuchai> page = chuchaiService.findPage(new
		// Page<Chuchai>(request, response), chuchai);
		Collections.sort(shenpilist, new Comparator<DataEntity>() {
			@Override
			public int compare(DataEntity a, DataEntity b) {
				// TODO Auto-generated method stub
				return b.getCreateDate().compareTo(a.getCreateDate());
			}

		});

		Page page = new Page(begin, size, shenpilist.size());
		page.initialize();
		// shenpilist.subList(begin, size);
		model.addAttribute("list", shenpilist);
		return "modules/shenpi/yitijiao1";
	}

	@RequestMapping(value = "getChaoSong")
	public String getChaoSong(HttpServletRequest request, HttpServletResponse response, Model model, Integer begin,
			Integer size) {
		if (begin == null)
			begin = 1;
		if (size == null)
			size = 10;
		Qingjia qingjia = new Qingjia();
		qingjia.setCopy(UserUtils.getUser().getId());
		List qjlist = qingJiaService.findCaoSongList(qingjia);
		List ChaoSongList = new ArrayList();
		ChaoSongList.addAll(qjlist);
		Weixiu weixiu = new Weixiu();
		weixiu.setCopy(UserUtils.getUser().getId());
		List wxlist = weixiuService.findCaoSongList(weixiu);
		ChaoSongList.addAll(wxlist);
		Bgyplq bgyplq = new Bgyplq();
		bgyplq.setCopy(UserUtils.getUser().getId());
		List bglist = bgyplqService.findCaoSongList(bgyplq);
		ChaoSongList.addAll(bglist);
		Paiche paiche = new Paiche();
		paiche.setCopy(UserUtils.getUser().getId());
		List pclist = paicheService.findCaoSongList(paiche);
		ChaoSongList.addAll(pclist);
		Collections.sort(ChaoSongList, new Comparator<DataEntity>() {
			@Override
			public int compare(DataEntity a, DataEntity b) {
				// TODO Auto-generated method stub
				return b.getCreateDate().compareTo(a.getCreateDate());
			}

		});

		Page page = new Page(begin, size, ChaoSongList.size(), ChaoSongList);
		page.initialize();
		// shenpilist.subList(begin, size);
		model.addAttribute("list", ChaoSongList);
		System.out.println("长度：" + ChaoSongList.size());
		return "modules/shenpi/chaosong";
	}
	// @RequestMapping(value="yitijiao")
	// public String yitijiao(HttpServletRequest request, HttpServletResponse
	// response, Model model) {
	// Qingjia qingjia=new Qingjia();
	// qingjia.setUser(UserUtils.getUser());
	// Page<Qingjia> page = qingJiaService.findPage(new Page<Qingjia>(request,
	// response), qingjia);
	// model.addAttribute("list", page.getList());
	// return "modules/shenpi/yitijiao";
	// }

	// @RequestMapping(value="yitijiao")
	// public String yitijiao(HttpServletRequest request, HttpServletResponse
	// response, Model model) {
	// Paiche paiche=new Paiche();
	// paiche.setUser(UserUtils.getUser());
	// Page<Paiche> page = paicheService.findPage(new Page<Paiche>(request,
	// response), paiche);
	// model.addAttribute("list", page.getList());
	// return "modules/shenpi/yitijiao1";
	// }

	@RequestMapping(value = "ybxq")
	public String ybxq(HttpServletRequest request, HttpServletResponse response, Model model) {

		// if (UserUtils.getPrincipal().isMobileLogin()){
		// return renderString(response, page);
		// }
		return "modules/shenpi/ybxiangqing";

	}

	@RequestMapping(value = "dbxq")
	public String dbxq(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/shenpi/qingJiaAudit";
	}

	@RequestMapping(value="ytxq")
	public String ytxq(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/shenpi/ytxiangqing";
		
	}

	/**
	 * 催办
	 * @param 跳转页面、类型、流程ID
	 * */
	@ResponseBody
	@RequestMapping(value = "remind")
	public Map remind(String actType,String procInsId){
		System.out.println("11");
		System.out.println("procInsId="+procInsId);
		TaskEntity task=actTaskService.getCurrentTask(procInsId);
		System.out.println("代办人----："+task.getAssignee());
		
		Map map=new HashedMap();
		map.put("success", "1");
		//如果获取到待办人信息，则直接催办
		if(task.getAssignee()!="" && task.getAssignee()!=null){
			String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextCuiban(UserUtils.getUser().getName(),"/shenpi/wode", actType);
			SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), task.getAssignee(), "", ApiConfigKit.getAgentId(), ""));
		}else{
			List<IdentityLink> list = actTaskService.getIdentityLink(task.getId());
			if (list != null && list.size() > 0) {
//				for (IdentityLink identityLink : list) {
				String userId=""; 
				for(int i=0;i<list.size();i++){
//					System.out.println("任务ID：" + identityLink.getTaskId());
//					System.out.println("流程实例ID：" + identityLink.getProcessInstanceId());
//					System.out.println("工作流角色ID：" + identityLink.getGroupId());
//					System.out.println("用户ID：" + identityLink.getUserId());
					if(i+1==list.size()){
						userId +=list.get(i).getUserId();
					}else{
						userId +=list.get(i).getUserId()+"|";
					}
					System.out.println("#########################################");
				}
				String sendTest=com.jfinal.qyweixin.sdk.msg.send.Text.createTextCuiban(UserUtils.getUser().getName(),"/shenpi/wode", actType);
//				SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), task.getAssignee(), "", ApiConfigKit.getAgentId(), ""));
				SendMessageApi.sendTextMsg(new QiYeTextMsg(new com.jfinal.qyweixin.sdk.msg.send.Text(sendTest), userId, "", ApiConfigKit.getAgentId(), ""));
			}else{
				map.put("success", "2");
			}
		}
		return map;
	}
	
	
}