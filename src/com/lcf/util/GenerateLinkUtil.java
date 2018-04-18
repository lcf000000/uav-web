package com.lcf.util;

import com.lcf.util.common.MD5;

public class GenerateLinkUtil {
	
	private static final String CHECK_CODE = "checkCode";
	
	public static String generateCheckcode(String userName, String randomCode) throws Exception {
		return MD5.md5Link(userName + ":" + randomCode);
	}
	
	public static String generateActiveLink(String id, String userName, String randomCode) throws Exception {
		//return "http://localhost:8080/UAV-Data/views/activateAccount?id="
		return "http://www.aiskyeye.com/views/activateAccount?id="
				+ id + "&" + CHECK_CODE + "=" + generateCheckcode(userName, randomCode);
	}
	
	public static boolean verifyCheckCode(String userName, String randomCode, String checkCode) throws Exception {
		return generateCheckcode(userName, randomCode).equals(checkCode);
	}
}