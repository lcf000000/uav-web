package com.lcf.util;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 实现文件[夹]解压
 * @author 
 *
 */
public class CheckDirUtil {
	
	private final static Logger log = LoggerFactory.getLogger(CheckDirUtil.class);
	
	//private static String preffix = "N:\\evaluate\\";
	private static String preffix = "/home/visdrone/VisDrone2018/UserResult/";
	
	public static String checkDir(String type, int userId) throws IOException {
		
		String filePath = preffix + type + String.valueOf(userId) + "/";
		
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
			String resPath = filePath + "res/";
			String desPath = filePath + "des/";
			String codePath = filePath + "code/";
			
			File resFile = new File(resPath);
			File desFile = new File(desPath);
			File codeFile = new File(codePath);
			
			resFile.mkdirs();
			desFile.mkdirs();
			codeFile.mkdirs();
			
			log.info("Directories for user result make done!");
		}
		return filePath;
	}
	
}