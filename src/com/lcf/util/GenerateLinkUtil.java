package com.lcf.util;

import com.lcf.util.common.MD5;

public class GenerateLinkUtil {
	
	private static final String CHECK_CODE = "checkCode";
	
	public static String generateCheckcode(String userName, String randomCode) {
		return MD5.md5Link(userName + ":" + randomCode);
	}
	
	public static String generateActiveLink(String id, String userName, String randomCode) {
		return "http://www.aiskyeye.com/AccountActivate/activateAccount?id=" 
				+ id + "&" + CHECK_CODE + "=" + generateCheckcode(userName, randomCode);
	}
	
	public static boolean verifyCheckCode(String userName, String randomCode, String checkCode) {
		return generateCheckcode(userName, randomCode).equals(checkCode);
	}
}