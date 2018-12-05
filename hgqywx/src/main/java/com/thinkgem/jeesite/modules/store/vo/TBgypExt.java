package com.thinkgem.jeesite.modules.store.vo;

import java.util.List;

import com.thinkgem.jeesite.modules.store.entity.TBgyp;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

public class TBgypExt extends Dict {

	private List<TBgyp> children;
	
	private String name;

	public List<TBgyp> getChildren() {
		return children;
	}

	public void setChildren(List<TBgyp> children) {
		this.children = children;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
