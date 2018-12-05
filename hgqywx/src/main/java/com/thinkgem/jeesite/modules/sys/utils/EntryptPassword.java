package com.thinkgem.jeesite.modules.sys.utils;

import com.thinkgem.jeesite.common.security.Digests;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

public class EntryptPassword {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(SystemService.entryptPassword("123456"));
		String plain = Encodes.unescapeHtml("123456");
		byte[] salt = Encodes.decodeHex("4703f1c06a02d0d5ee8843e79d7ed2af15d261c24de6fc658ee669e1".substring(0,16));
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		System.out.println(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
	} 

}
