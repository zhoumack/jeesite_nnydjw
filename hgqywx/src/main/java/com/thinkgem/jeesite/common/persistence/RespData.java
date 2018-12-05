package com.thinkgem.jeesite.common.persistence;

public class RespData {

	protected int code = 200;
    protected Object data;
    
	public RespData() {
		super();
	}
	public RespData(int code,Object msg) {
		super();
		this.code = code;
		this.data = msg;
	}
	

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
    
	public RespData get(Exception e, String msg) {
		e.printStackTrace();
		int errorCode = -99;
		if (e instanceof BusinessException) {
			return new RespData(errorCode,e.getMessage());
		}
		
		return new RespData(errorCode,msg);
	}
}
