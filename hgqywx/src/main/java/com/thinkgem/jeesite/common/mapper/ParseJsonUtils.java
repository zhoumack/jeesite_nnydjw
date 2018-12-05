package com.thinkgem.jeesite.common.mapper;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

public class ParseJsonUtils {
	/**
	 * 
	 * @param jsonString
	 * @return{departmentId:List<String>,userId:List<String>}
	 */
	public static Map<String,List<String>> parseStringJson(String jsonString){
		Map map=(Map) JsonMapper.fromJsonString(jsonString, Map.class);
		if(map==null) return new HashMap<String, List<String>>();
		List<String> dep=Arrays.asList(map.get("departmentId").toString().split(","));
		map.put("departmentId", dep);
		List uid=Arrays.asList(map.get("userId").toString().split(","));
		map.put("userId", uid);
		return map;
	}
}
