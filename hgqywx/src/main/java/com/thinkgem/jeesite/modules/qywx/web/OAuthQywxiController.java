/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qywx.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.api.ApiResult;
import com.jfinal.qyweixin.sdk.api.OAuthApi;
import com.jfinal.qyweixin.sdk.kit.MsgEncryptKit;
import com.jfinal.qyweixin.sdk.kit.SignatureCheckKit;
import com.jfinal.qyweixin.sdk.msg.InMsgParser;
import com.jfinal.qyweixin.sdk.msg.in.InMsg;
import com.jfinal.qyweixin.sdk.msg.in.event.BatchJob;
import com.jfinal.qyweixin.sdk.msg.in.event.EventInMsg;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressOfficeEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressUserEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InEnterAgentEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InFollowEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InJobEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InLocationEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InMenuEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InQrCodeEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.ScanCodeInfo;
import com.jfinal.qyweixin.sdk.utils.IOUtils;
import com.jfinal.qyweixin.sdk.utils.RetryUtils;
import com.jfinal.qyweixin.sdk.utils.XmlHelper;
import com.qq.weixin.mp.aes.WXBizMsgCrypt;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.qywx.service.QywxService;
import com.thinkgem.jeesite.modules.shenpi.entity.Approve;
import com.thinkgem.jeesite.modules.shenpi.service.ApproveService;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.security.UsernamePasswordToken;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 审批Controller
 * @author szx
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "/oauth")
public class OAuthQywxiController extends BaseController {
	private static Logger logger = LoggerFactory.getLogger(RetryUtils.class);
	@Autowired
	private SystemService systemService;
	@Autowired
	private OfficeService officeService;
	@Autowired
	private QywxService qywxService;
	//接收验证码路径
	public static String getCode=Global.getConfig("domain")+Global.getConfig("context")+"/oauth/";
	//oauth 获取验证码路径
	public static String oauthAndCode=Global.getConfig("domain")+Global.getConfig("context")+"/oauth";
	
	@RequestMapping(value = "",method = RequestMethod.GET)
	public String  getCodeAndLogin(String code,String state,HttpServletRequest request, HttpServletResponse response){
		ApiResult codeInfo=OAuthApi.getUserInfoByCode(code);
		// 当用户为企业成员时
		String userId=codeInfo.getStr("UserId");
		// 非企业成员授权时
		if(StringUtils.isNoneBlank(codeInfo.getStr("OpenId"))) userId=codeInfo.getStr("OpenId");
		
		System.out.println(codeInfo.getJson());
		//取用户详细信息票据
		String user_ticket=codeInfo.getStr("user_ticket");
		//user_ticket为空
		if(StringUtils.isEmpty(user_ticket)){
			
		}
		//用户详细信息
		ApiResult  userInfo=OAuthApi.getUserInfo(user_ticket);
		
		//用户名
		String loginName=userInfo.getStr("userid");
		Subject s=SecurityUtils.getSubject();
		UsernamePasswordToken u=new UsernamePasswordToken(loginName, "123456".toCharArray(), false, null, "", true, "qywx");
		s.login(u);
		if(StringUtils.isEmpty(state)){
			return "redirect:" + adminPath+"/main/index";
		}
		return "redirect:" + adminPath+state;
	}

}
