package com.lcf.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SotResController {
	
	private final Logger log = LoggerFactory.getLogger(SotResController.class);
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/sotres/addres", method = RequestMethod.POST)
	@ResponseBody 
	public JSONObject addSotRes(@RequestParam("resfile") MultipartFile resfile,
			@RequestParam("desfile") MultipartFile desfile,
			@RequestParam("codefile") MultipartFile codefile,
    		@RequestParam String name,
    		@RequestParam String language,
    		@RequestParam String environment,
    		@RequestParam String reference,
    		@RequestParam Integer user_id,
			HttpServletRequest request) throws Exception
	{
		JSONArray jsonArray=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		String path=null;// 文件路径
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date(currentTime);
		String addname = formatter.format(date);
		if (resfile!=null && desfile!=null) {// 判断上传的文件是否为空
            String restype=null;// 文件类型
            String resfileName=resfile.getOriginalFilename();// 文件原名称
            String destype=null;// 文件类型
            String desfileName=resfile.getOriginalFilename();// 文件原名称
            String codetype=null;// 文件类型
            String codefileName=resfile.getOriginalFilename();// 文件原名称
            log.info("上传的文件原名称:"+resfileName);
            // 判断文件类型
            restype=resfileName.indexOf(".")!=-1?resfileName.substring(resfileName.lastIndexOf(".")+1, resfileName.length()):null; 
            if (restype!=null&&destype!=null) {// 判断文件类型是否为空
                if ("zip".equals(restype.toUpperCase())&&("doc".equals(destype.toUpperCase())||"docx".equals(destype.toUpperCase())||"pdf".equals(destype.toUpperCase()))) {
                    // 项目在容器中实际发布运行的根路径
                    //String realPath=request.getSession().getServletContext().getRealPath("/");
                    
                	// 处理Results文件
                    String restrueFileName= "res" + String.valueOf(user_id) + addname + resfileName;
                    // 设置存放文件的路径
                    path = "E:\\Project\\website\\data\\sot\\" + restrueFileName;
                    log.info("存放文件的路径:"+path);
                    // 转存文件到指定的路径
                    resfile.transferTo(new File(path));
                    log.info("文件成功上传到指定目录下");
                    
                    
                    //解析文件 得出结果
                    
                    // 处理Description文件
                    String destrueFileName= "des" + String.valueOf(user_id) + addname + desfileName;
                    // 设置存放文件的路径
                    path = "E:\\Project\\website\\data\\sot\\" + destrueFileName;
                    // 转存文件到指定的路径
                    desfile.transferTo(new File(path));
                    
                    //处理Code文件
                    if (restype!=null&&destype!=null) {// 判断文件类型是否为空
                        if ("zip".equals(restype.toUpperCase())){
                        	
                        	String codetrueFileName= "code" + String.valueOf(user_id) + addname + codefileName;
                            // 设置存放文件的路径
                            path = "E:\\Project\\website\\data\\sot\\" + codetrueFileName;
                            // 转存文件到指定的路径
                            desfile.transferTo(new File(path));
                        }
                    }
                    
                }else {
                	log.info("不是我们想要的文件类型,请按要求重新上传");
                }
            }else {
            	log.info("文件类型为空");
            }
        }else {
        	log.info("没有找到相对应的文件");
        }
        jsonObject.put("errno",0);  
        jsonObject.put("data",jsonArray);
        return jsonObject;
	}
}
