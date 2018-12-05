package com.thinkgem.jeesite.modules.act.utils;

public enum ProcessState {
	SUSPENDED("挂起"),END("结束"),DELETE("删除"),TODO("审批中");
	
	
	 private final String name;
	    
	    private ProcessState(String name)
	    {
	        this.name = name;
	    }

	    public String getName() {
	        return name;
	    }
}
