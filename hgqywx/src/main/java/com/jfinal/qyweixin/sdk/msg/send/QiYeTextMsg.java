package com.jfinal.qyweixin.sdk.msg.send;


/**
 * 企业文本消息
 * 
 * @author Javen
 * 
 */
public class QiYeTextMsg extends QiYeBaseMsg {
	/**
	 * 消息内容
	 */
	
	private Text text;
	

	public QiYeTextMsg() {
		this.msgtype=MessageType.text.name();
	}


	public QiYeTextMsg(Text text) {
		this.text = text;
        this.msgtype=MessageType.text.name();
	}
	/**
	 * 
	 * @param text
	 * @param touser  用户id 多用户 |分隔
	 * @param toparty 部门id多部门 |分隔
	 * @param agentid
	 * @param safe
	 */
	public QiYeTextMsg(Text text,String touser, String toparty, String agentid,String safe) {
		super(touser, toparty, agentid, safe);
		this.text = text;
        this.msgtype=MessageType.text.name();
	}
	public Text getText() {
		return text;
	}

	public void setText(Text text) {
		this.text = text;
	}
	
	
}