package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.security.Digests;
import com.thinkgem.jeesite.common.utils.Encodes;

public class createPassword {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String plain = Encodes.unescapeHtml("ZhouYuanLin");
		byte[] salt = Digests.generateSalt(8);
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		String pd= Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
		System.out.println(pd);
	}

}
