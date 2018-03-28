package com.lcf.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.URLEncoder;

@Service
public class DownloadFileService {
	
	private final Logger log = LoggerFactory.getLogger(DownloadFileService.class);
	
	 public void downloadSolve(String filename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //文件所在目录路径
	    String filePath = request.getSession().getServletContext().getRealPath("/") + "download/";
	    //得到该文件
	    File file = new File(filePath+filename);
	    if(!file.exists()){
	        System.out.println("Have no such file!");
	        return;//文件不存在就退出方法
	    }
	    FileInputStream fileInputStream = new FileInputStream(file);
	    //设置Http响应头告诉浏览器下载这个附件
	    response.setHeader("Content-Disposition", "attachment;Filename=" + URLEncoder.encode(filename, "UTF-8"));
	    OutputStream outputStream = response.getOutputStream();
	    byte[] bytes = new byte[2048];
	    int len = 0;
	    while ((len = fileInputStream.read(bytes))>0){
	        outputStream.write(bytes,0,len);
	    }
	    log.info("closed!!!!!!!!!");
	    fileInputStream.close();
	    outputStream.close();
	}
}
