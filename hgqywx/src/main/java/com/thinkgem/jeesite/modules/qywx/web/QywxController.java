/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qywx.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.kit.MsgEncryptKit;
import com.jfinal.qyweixin.sdk.kit.SignatureCheckKit;
import com.jfinal.qyweixin.sdk.msg.InMsgParser;
import com.jfinal.qyweixin.sdk.msg.in.InMsg;
import com.jfinal.qyweixin.sdk.msg.in.event.EventInMsg;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressOfficeEvent;
import com.jfinal.qyweixin.sdk.msg.in.event.InAddressUserEvent;
import com.jfinal.qyweixin.sdk.utils.IOUtils;
import com.qq.weixin.mp.aes.WXBizMsgCrypt;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.qywx.service.QywxService;
import com.thinkgem.jeesite.modules.shenpi.entity.Approve;
import com.thinkgem.jeesite.modules.shenpi.service.ApproveService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 审批Controller
 * @author szx
 * @version 2018-08-22
 */
@Controller
@RequestMapping(value = "/messageEvent")
public class QywxController extends BaseController {
	@Autowired
	private QywxService qywxService;
	@Autowired
	private OfficeService officeService;
	
	private static Logger cLogger = Logger.getLogger("CommonLog");
    

	
	/**
	 * 微信服务器验证连接
	 * @parammsg_signature	是	企业微信加密签名，msg_signature结合了企业填写的token、请求中的timestamp、nonce参数、加密的消息体
	 * @param timeStamptimestamp	是	时间戳
	 * @param nonce	nonce	是	随机数
	 * @param echoStr	echostr	是	加密的字符串。需要解密得到消息内容明文，解密后有random、msg_len、msg、CorpID四个字段，其中msg即为消息内容明文
	 * @return 
	 * @throws IOException 
	 */
	@RequestMapping(value = "",method = RequestMethod.GET)
	public void getMessageEvent(String msg_signature, String timestamp, String nonce, String echostr,HttpServletRequest request, HttpServletResponse response) throws IOException  {
		msg_signature=Encodes.urlDecode(msg_signature);
		timestamp=Encodes.urlDecode(timestamp);
		nonce=Encodes.urlDecode(nonce);
		echostr=StringUtils.isNoneBlank(echostr)?Encodes.urlDecode(echostr):"";
		String result = "";
		PrintWriter  pw=response.getWriter();
		try {
			result=SignatureCheckKit.me.VerifyURL(msg_signature, timestamp, nonce, echostr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == null) {
			result =ApiConfigKit.getApiConfig().getToken() ;
		}
		pw.print(result);
		pw.close();
		pw=null;
	}
	@RequestMapping(value = "",method = RequestMethod.POST)
	public void getMessageEventPost(String msg_signature, String timestamp, String nonce, String echostr,HttpServletRequest request, HttpServletResponse response) throws IOException  {
				// 微信加密签名
				 msg_signature = Encodes.urlDecode(msg_signature);
				// 时间戳
				 timestamp = Encodes.urlDecode(timestamp);
				// 随机数
				 nonce = Encodes.urlDecode(nonce);
				
				//从请求中读取整个post数据
				String postData = IOUtils.toString(request.getInputStream());
				//logger.info(postData);
				//解密出明文
				postData=MsgEncryptKit.decrypt(postData, timestamp, nonce, msg_signature);
				System.out.println("明文:" + postData);
				
				
				
				String backMessage=MsgEncryptKit.encrypt("success", timestamp, nonce);
				
				// 响应消息
				PrintWriter pw = response.getWriter();
				pw.print(backMessage);
				pw.close();
				pw=null;
				InMsg msg=InMsgParser.parse(postData);
				doMsg(msg);
				
				cLogger.info("明文:" +postData);
	}
	public void doMsg(InMsg msg){
		String toUserName = msg.getToUserName();
		String fromUserName = msg.getFromUserName();
		Integer createTime = msg.getCreateTime();
		String msgType = msg.getMsgType();
		String agentId =msg.getAgentID();
		if ("text".equals(msgType)){}
		if ("image".equals(msgType)){}
		if ("voice".equals(msgType)){}
		if ("video".equals(msgType)){}
		if ("shortvideo".equals(msgType)){} // 支持小视频
		if ("location".equals(msgType)){}
		if ("event".equals(msgType)){
			EventInMsg eventMsg=(EventInMsg)msg; 
			if ("change_contact".equalsIgnoreCase(eventMsg.getEvent())) {
				InAddressEvent inEvent=(InAddressEvent)msg;
				String ChangeType=inEvent.getChangeType();
				if(InAddressOfficeEvent.EVENT_CREATE_PARTY.equalsIgnoreCase(ChangeType)) {
					InAddressOfficeEvent officeEvent=(InAddressOfficeEvent)msg;
					qywxService.addOffice(officeEvent);
				}
				if(InAddressOfficeEvent.EVENT_DELETE_PARTY.equalsIgnoreCase(ChangeType)){
					InAddressOfficeEvent officeEvent=(InAddressOfficeEvent)msg;
					officeService.delete(new Office(officeEvent.getId()));
				}
				if(InAddressOfficeEvent.EVENT_UPDATE_PARTY.equalsIgnoreCase(ChangeType)){
					InAddressOfficeEvent officeEvent=(InAddressOfficeEvent)msg;
					qywxService.updateOffice(officeEvent);
				}
				if(InAddressUserEvent.EVENT_DELETE_USER.equalsIgnoreCase(ChangeType)){
					InAddressUserEvent userEvent=(InAddressUserEvent)msg;
					qywxService.deleteUser(userEvent);
				}
				if(InAddressUserEvent.EVENT_CREATE_USER.equalsIgnoreCase(ChangeType)){
					InAddressUserEvent userEvent=(InAddressUserEvent)msg;
					qywxService.addUser(userEvent);
				}
				if(InAddressUserEvent.EVENT_UPDATE_USER.equalsIgnoreCase(ChangeType)){
					InAddressUserEvent userEvent=(InAddressUserEvent)msg;
					qywxService.UpdateUser(userEvent);
				}
			}
		}
		if ("link".equals(msgType)){
			
		}
//		logger.error("无法识别的消息类型 " + msgType + "，请查阅微信公众平台开发文档");
	}
	
	
	
}