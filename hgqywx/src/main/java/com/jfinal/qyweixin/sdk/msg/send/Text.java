package com.jfinal.qyweixin.sdk.msg.send;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.api.OAuthApi;
import com.thinkgem.jeesite.modules.qywx.web.OAuthQywxiController;

public class Text {
	private String content;
	
	

	public Text(String content) {
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 
	 * @param name 提交流程发起人名字
	 * @param name supplyName 申请人名字
	 * @param direct_url 本地服务访问路径，controller中的访问路径即可
	 * @param actType 流程类型名字 ，如请假等
	 * @return
	 */
	public static String createTextApply(String name,String supplyName,String direct_url,String actType){
		StringBuilder sendText=new StringBuilder();
		sendText.append(name+"向你发送一个"+actType+"审批，\n可查看");
		//企业微信消息中跳转地址
		sendText.append("<a href=\""+OAuthApi.getAuthorizeURL(OAuthQywxiController.getCode, ApiConfigKit.getApiConfig().getCorpId(), direct_url, ApiConfigKit.getAgentId(), true)+"\">");
		sendText.append(supplyName+"的"+actType+"</a>,进行处理");
		System.out.println(sendText.toString());
		return sendText.toString();
	}
	public static String createTextShenpi(String name,String supplyName,String direct_url,String actType){
		StringBuilder sendText=new StringBuilder();
		sendText.append(name+"已处理你的"+actType+"审批，\n可查看");
		//企业微信消息中跳转地址
		sendText.append("<a href=\""+OAuthApi.getAuthorizeURL(OAuthQywxiController.getCode, ApiConfigKit.getApiConfig().getCorpId(), direct_url, ApiConfigKit.getAgentId(), true)+"\">");
		sendText.append(supplyName+"的"+actType+"</a>,进行处理");
		return sendText.toString();
	}
	public static String createText(String name,String direct_url,String actType,String text,String applyName){
		StringBuilder sendText=new StringBuilder();
		sendText.append(name+text+"，\n可查看");
		//企业微信消息中跳转地址
		sendText.append("<a href=\""+OAuthApi.getAuthorizeURL(OAuthQywxiController.getCode, ApiConfigKit.getApiConfig().getCorpId(), direct_url, ApiConfigKit.getAgentId(), true)+"\">");
		sendText.append(applyName+"的"+actType+"</a>,进行查看");
		return sendText.toString();
	}
	
	/**
	 * 耗材配件审批通过的文本
	 * @param name 
	 * @param direct_url
	 * @param actType
	 * @return
	 */
	public static String createTextConfirm(String name,String direct_url,String actType){
		StringBuilder sendText=new StringBuilder();
		sendText.append(name+"通过了一个"+actType+"出库的审批，\n可点击");
		//企业微信消息中跳转地址
		sendText.append("<a href=\""+OAuthApi.getAuthorizeURL(OAuthQywxiController.getCode, ApiConfigKit.getApiConfig().getCorpId(), direct_url, ApiConfigKit.getAgentId(), true)+"\">");
		sendText.append(actType+"</a>,进行查看");
		System.out.println(sendText.toString());
		return sendText.toString();
	}
	
	/**
	 * 出库提醒
	 * @param name
	 * @param direct_url
	 * @param actType
	 * @return
	 */
	public static String createTextChuku(String name,String direct_url,String actType){
		StringBuilder sendText=new StringBuilder();
		sendText.append(name+"的"+actType+"申请已经出库，\n可点击");
		//企业微信消息中跳转地址
		sendText.append("<a href=\""+OAuthApi.getAuthorizeURL(OAuthQywxiController.getCode, ApiConfigKit.getApiConfig().getCorpId(), direct_url, ApiConfigKit.getAgentId(), true)+"\">");
		sendText.append(actType+"</a>,进行查看");
		System.out.println(sendText.toString());
		return sendText.toString();
	}
	
	/**
	 * （维修）审批完成提醒
	 * @param name
	 * @param direct_url
	 * @param actType
	 * @return
	 */
	public static String createTextFinish(String name,String actType,String status){
		StringBuilder sendText=new StringBuilder();
		sendText.append(name+"的"+actType+"申请已结束，审批结果："+status);
		System.out.println(sendText.toString());
		return sendText.toString();
	}

	/**
	 * 反馈结果信息
	 *  @param beginDate 流程起始时间
	 * @param name 申请人
	 * @param flay 审批结果
	 * @param actType 流程类型
	 * @return
	 */
	public static String createResultText(Date beginDate,String name,String flag,String actType){
		StringBuilder sendText=new StringBuilder();
		sendText.append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(beginDate)+":"+name+"的"+actType+"申请请求--"+flag);
		//企业微信消息中跳转地址
//		sendText.append("<a href=\""+OAuthApi.getAuthorizeURL(OAuthQywxiController.getCode, ApiConfigKit.getApiConfig().getCorpId(), direct_url, ApiConfigKit.getAgentId(), true)+"\">");
//		sendText.append(actType+"</a>,进行查看");
		System.out.println(sendText.toString());
		return sendText.toString();
	}
	
	/**
	 * 催办
	 * @param name发起申请人
	 * @param  direct_url跳转的Url
	 * @param  actType 催办类型
	 * */
	public static String createTextCuiban(String name,String direct_url,String actType){
		StringBuilder sendText=new StringBuilder();
		sendText.append(name+"的"+actType+"正在催办，\n可点击");
		//企业微信消息中跳转地址
		sendText.append("<a href=\""+OAuthApi.getAuthorizeURL(OAuthQywxiController.getCode, ApiConfigKit.getApiConfig().getCorpId(), direct_url, ApiConfigKit.getAgentId(), true)+"\">");
		sendText.append(actType+"</a>,进行查看");
		System.out.println(sendText.toString());
		return sendText.toString();
	}
	
}
