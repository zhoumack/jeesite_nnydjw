/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.msg.entity;

import java.util.Map;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 各种消息所需字段Entity
 * @author szx
 * @version 2018-09-06
 */
public class Message extends DataEntity<Message> {
	
	private static final long serialVersionUID = 1L;
	private String touser;		// 成员ID列表（消息接收者，多个接收者用&lsquo;|&rsquo;分隔，最多支持1000个）。特殊情况：指定为@all，则向该企业应用的全部成员发送
	private String toparty;		// 部门ID列表，多个接收者用&lsquo;|&rsquo;分隔，最多支持100个。当touser为@all时忽略本参数
	private String totag;		// 部门ID列表，多个接收者用&lsquo;|&rsquo;分隔，最多支持100个。当touser为@all时忽略本参数
	private String msgtype;		// 消息类型
	private String agentid;		// 企业应用的id，整型。可在应用的设置页面查看
	private String content;		// 消息内容（文本、图文消息字段）
	private String safe;		// 是否保密消息
	private String mediaId;		// 图片媒体文件id（图片、音频、视频、文件消息字段）
	private String title;		// 消息标题（视频、文本卡片、图文、小程序通知消息字段）
	private String description;		// 消息描述（视频、文本卡片、图文、小程序通知消息字段）
	private String url;		// 点击后跳转的链接（文本卡片，图文信息字段）
	private String btntxt;		// 按钮文字（文本卡片，图文消息字段）
	private String article;		// 图文消息（图文消息，mpnews字段）
	private String picurl;		// 图片链接（图文消息，mpnews字段）
	private String thumbMediaId;		// 图文消息缩略图的media_id(mpnews字段)
	private String author;		// 图文消息作者（mpnews字段）
	private String contentSourceUrl;		// 图文消息点击&ldquo;阅读原文&rdquo;之后的页面链接（mpnews字段）
	private String digest;		// 图文消息描述（mpnews字段）
	private String appid;		// 小程序id（小程序通知消息字段）
	private String pages;		// 点击消息卡片后的小程序页面(小程序通知消息字段)
	private String emphasisFirstItem;		// 是否放到搭起一个content_item(小程序通知消息)
	private Map<String,Object> contentItem;		// 消息内容键值对(小程序通知消息字段)
	
	public Message() {
		super();
	}

	public Message(String id){
		super(id);
	}

	@Length(min=0, max=300, message="成员ID列表（消息接收者，多个接收者用&lsquo;|&rsquo;分隔，最多支持1000个）。特殊情况：指定为@all，则向该企业应用的全部成员发送长度必须介于 0 和 300 之间")
	public String getTouser() {
		return touser;
	}

	public void setTouser(String touser) {
		this.touser = touser;
	}
	
	@Length(min=0, max=300, message="部门ID列表，多个接收者用&lsquo;|&rsquo;分隔，最多支持100个。当touser为@all时忽略本参数长度必须介于 0 和 300 之间")
	public String getToparty() {
		return toparty;
	}

	public void setToparty(String toparty) {
		this.toparty = toparty;
	}
	
	@Length(min=0, max=300, message="部门ID列表，多个接收者用&lsquo;|&rsquo;分隔，最多支持100个。当touser为@all时忽略本参数长度必须介于 0 和 300 之间")
	public String getTotag() {
		return totag;
	}

	public void setTotag(String totag) {
		this.totag = totag;
	}
	
	@Length(min=0, max=100, message="消息类型长度必须介于 0 和 100 之间")
	public String getMsgtype() {
		return msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	
	@Length(min=0, max=64, message="企业应用的id，整型。可在应用的设置页面查看长度必须介于 0 和 64 之间")
	public String getAgentid() {
		return agentid;
	}

	public void setAgentid(String agentid) {
		this.agentid = agentid;
	}
	
	@Length(min=0, max=2048, message="消息内容（文本、图文消息字段）长度必须介于 0 和 2048 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=10, message="是否保密消息长度必须介于 0 和 10 之间")
	public String getSafe() {
		return safe;
	}

	public void setSafe(String safe) {
		this.safe = safe;
	}
	
	@Length(min=0, max=64, message="图片媒体文件id（图片、音频、视频、文件消息字段）长度必须介于 0 和 64 之间")
	public String getMediaId() {
		return mediaId;
	}

	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}
	
	@Length(min=0, max=128, message="消息标题（视频、文本卡片、图文、小程序通知消息字段）长度必须介于 0 和 128 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=512, message="消息描述（视频、文本卡片、图文、小程序通知消息字段）长度必须介于 0 和 512 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Length(min=0, max=255, message="点击后跳转的链接（文本卡片，图文信息字段）长度必须介于 0 和 255 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=12, message="按钮文字（文本卡片，图文消息字段）长度必须介于 0 和 12 之间")
	public String getBtntxt() {
		return btntxt;
	}

	public void setBtntxt(String btntxt) {
		this.btntxt = btntxt;
	}
	
	@Length(min=0, max=255, message="图文消息（图文消息，mpnews字段）长度必须介于 0 和 255 之间")
	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}
	
	@Length(min=0, max=150, message="图片链接（图文消息，mpnews字段）长度必须介于 0 和 150 之间")
	public String getPicurl() {
		return picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	
	@Length(min=0, max=150, message="图文消息缩略图的media_id(mpnews字段)长度必须介于 0 和 150 之间")
	public String getThumbMediaId() {
		return thumbMediaId;
	}

	public void setThumbMediaId(String thumbMediaId) {
		this.thumbMediaId = thumbMediaId;
	}
	
	@Length(min=0, max=64, message="图文消息作者（mpnews字段）长度必须介于 0 和 64 之间")
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Length(min=0, max=512, message="图文消息点击&ldquo;阅读原文&rdquo;之后的页面链接（mpnews字段）长度必须介于 0 和 512 之间")
	public String getContentSourceUrl() {
		return contentSourceUrl;
	}

	public void setContentSourceUrl(String contentSourceUrl) {
		this.contentSourceUrl = contentSourceUrl;
	}
	
	@Length(min=0, max=512, message="图文消息描述（mpnews字段）长度必须介于 0 和 512 之间")
	public String getDigest() {
		return digest;
	}

	public void setDigest(String digest) {
		this.digest = digest;
	}
	
	@Length(min=0, max=150, message="小程序id（小程序通知消息字段）长度必须介于 0 和 150 之间")
	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}
	
	@Length(min=0, max=255, message="点击消息卡片后的小程序页面(小程序通知消息字段)长度必须介于 0 和 255 之间")
	public String getPages() {
		return pages;
	}

	public void setPages(String pages) {
		this.pages = pages;
	}
	
	@Length(min=0, max=10, message="是否放到搭起一个content_item(小程序通知消息)长度必须介于 0 和 10 之间")
	public String getEmphasisFirstItem() {
		return emphasisFirstItem;
	}

	public void setEmphasisFirstItem(String emphasisFirstItem) {
		this.emphasisFirstItem = emphasisFirstItem;
	}

	public Map<String, Object> getContentItem() {
		return contentItem;
	}

	public void setContentItem(Map<String, Object> contentItem) {
		this.contentItem = contentItem;
	}
	
	
}