package com.thinkgem.jeesite.modules.act.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.entity.ActHiProcinst;
import com.thinkgem.jeesite.modules.act.service.ActHiProcinstService;
import com.thinkgem.jeesite.modules.sys.dao.RoleDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
@Controller
@RequestMapping(value = "${adminPath}/act/count")
public class ActCountController  extends BaseController {
	@Autowired
	ActHiProcinstService  actHisProService;
	@Autowired
	RoleDao roleDao;
	@ResponseBody
	@RequestMapping(value = "getActHisProByRole")
	public List<ActHiProcinst>  getActHisProByRole(Boolean finish,Date startTime,Date endTime) {
		ActHiProcinst ahp=new ActHiProcinst();
		ahp.setFinish(finish);
		List<ActHiProcinst> ahps=actHisProService.findListByRole(ahp);
		return ahps;
	}
	@ResponseBody
	@RequestMapping(value = "getRoleByUserId")
	public String  getRoleByUserId() {
		List<Role> roles=UserUtils.getRoleListNoScop();
		StringBuilder sb=new StringBuilder();
		for(Role r:roles){
			sb.append("|"+r.getEnname());
		}
		if(sb.toString().contains("fgld")||sb.toString().contains("yld")){
			return "2";
		}else if(sb.toString().contains("_ld")||sb.toString().contains("bmld")){
			return "1";
		}else {
			return "0";
		}
	}
}
