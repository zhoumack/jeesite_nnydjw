package com.thinkgem.jeesite.modules.mainframe.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.shenpi.entity.Paiche;
import com.thinkgem.jeesite.modules.shenpi.entity.Qingjia;
import com.thinkgem.jeesite.modules.shenpi.entity.Weixiu;
import com.thinkgem.jeesite.modules.store.service.TBgypService;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;


/**
 * 主界面跳转controller
 * @author she
 *
 */
@Controller
@RequestMapping(value="${adminPath}/main")
public class MainFrameController {
	
	@Autowired
	private OfficeService officeService;
	@Autowired
	private TBgypService tBgypService;
	
	//消息页面跳转
	@RequestMapping(value="xiaoxi")
	public String xiaoxi(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/mainframe/xiaoxi";
		
	}
	//跳转到工作台
	@RequestMapping(value="index")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		//return "modules/mainframe/index";
		return "modules/sys/index";
		
	}
	//跳转到我的主页
	@RequestMapping(value="wo")
	public String wo(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/mainframe/wo";
		
	}
	//跳转到审批助手
	@RequestMapping(value="spzs")
	public String shenpizhushou(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/mainframe/shenpizhushou";
		
	}
	//跳转到个人信息
	@RequestMapping(value="grxx")
	public String grxx(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/mainframe/gerenxinxi";
		
	}
	
	//跳转到汇报
	@RequestMapping(value="huibao")
	public String huibao(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/mainframe/huibao";
		
	}
	
	
	@RequestMapping("getDictList")
	@ResponseBody
	public List getDictList(String type) {
		return DictUtils.getDictList(type);
	}
	
	
	
	@RequestMapping("qj")
	public String qj(Qingjia qingjia,Model model) {
		if (StringUtils.isNotBlank(qingjia.getId())){//.getAct().getProcInsId())){
			User user=UserUtils.get(qingjia.getUser().getId());
			/*user.setOffice(officeService.get(user.getOffice()));
			qingjia.setUser(user);
			// 环节编号
			String taskDefKey = qingjia.getAct().getTaskDefKey();
			
			// 查看工单
			if(qingjia.getAct().isFinishTask()){
				//model.addAttribute("histoicFlowList", actTaskService.histoicFlowList(qingjia.getAct().getProcInsId(), "", ""));
				view = "qingjiaForm";
			}
			// 修改环节
			else if ("modify".equals(taskDefKey)){
				//model.addAttribute("histoicFlowList", actTaskService.histoicFlowList(qingjia.getAct().getProcInsId(), "", ""));
				view = "qingjiaForm";
			}
			// 审核环节
			else if ("audit".equals(taskDefKey)){
				//model.addAttribute("histoicFlowList", actTaskService.histoicFlowList(qingjia.getAct().getProcInsId(), "", ""));
				view = "qingjia";
			}else if ("audit2".equals(taskDefKey)){
				//model.addAttribute("histoicFlowList", actTaskService.histoicFlowList(qingjia.getAct().getProcInsId(), "", ""));
				model.addAttribute("isBack",1);
				view = "qingJiaAudit";
			}*/
		}else{//新建
			User user=UserUtils.get(UserUtils.getUser().getId());
			qingjia.setUserName(user.getName());
			qingjia.setUser(user);
			user.setOffice(officeService.get(user.getOffice().getId()));
		}
		model.addAttribute("qingjia", qingjia);
		
		return "modules/1/qj";
	}
	
	@RequestMapping("userSel")
	public String userSel(Model model) {
		
		return "modules/1/select";
	}
	
	@RequestMapping("shenqing")
	public String shenqing(Model model) {
		return "modules/shenpi/xinshenqing";
	} 
	
	@RequestMapping("gerenshiwu")
	public String gerenshiwu(Model model) {
		return "modules/shenpi/gerenshiwu";
	}
	
	@RequestMapping("fuzhubanan")
	public String fuzhubanan(Model model) {
		return "modules/shenpi/fuzhubanan";
	}
	
	@RequestMapping("xinwenxiangq")
	public String xinwenxiangq(Model model) {
		return "modules/shenpi/xinwenxiangq";
	}

	@RequestMapping("weixiu")
	public String weixiu(Weixiu weixiu,Model model) {
		User user=UserUtils.get(UserUtils.getUser().getId());
		weixiu.setUserName(user.getName());
		weixiu.setUser(user);
		user.setOffice(officeService.get(user.getOffice().getId()));
		model.addAttribute("weixiu", weixiu);
		return "modules/1/weixiu";
	}
	
	@RequestMapping("paiche")
	public String paiche(Paiche paiche,Model model) {
		model.addAttribute("paiche", paiche);
		return "modules/shenpi/paiche";
	}
	
//工作日志首页
	@RequestMapping("rizhi")
	public String rizhi(Model model) {
		return "modules/shenpi/rizhijilu";
	}
//	工作日志申请
	@RequestMapping("rizhisq")
	public String rizhisq(Model model) {
		return "modules/shenpi/rizhi";
	}
//工作日志列表_全部
	@RequestMapping("rizhilistq")
	public String rizhilistq(Model model) {
		return "modules/shenpi/rizhilistq";
	}
	//工作日志列表_详情
	@RequestMapping("rizhixq")
	public String rizhixq(Model model) {
		return "modules/shenpi/rizhixq";
	}
	//工作日志列表_未读
	@RequestMapping("rizhilistw")
	public String rizhilistw(Model model) {
		return "modules/shenpi/rizhilistw";
	}
	//日程新建
		@RequestMapping("richengadd")
		public String richengadd(Model model) {
			return "modules/shenpi/richengadd";
		}
//组织架构
		@RequestMapping("zuzhijiagou")
		public String zuzhijiagou(Model model) {
			return "modules/shenpi/zuzhijiagou";
		}
//使用手册
		@RequestMapping("use_sc")
		public String use_sc(Model model) {
			return "modules/shenpi/use_sc";
		}
		
		//待办事务
		@RequestMapping("dbsw")
		public String dbsw(Model model) {
			return "modules/shenpi/daibanshixiang";
		}
		//统计分析
		@RequestMapping("tongjifenxi")
		public String tongjifenxi(Model model) {
			return "modules/shenpi/tongjifenxi";
		}
		
	
}
