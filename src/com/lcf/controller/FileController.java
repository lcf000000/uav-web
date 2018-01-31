package com.lcf.controller;

import java.io.File;
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
public class FileController {
	
	private final Logger log = LoggerFactory.getLogger(FileController.class);

	@RequestMapping(value = "/upload/img", method = RequestMethod.POST)
	@ResponseBody 
	public JSONObject uploadPhoto(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception
	{
		JSONArray jsonArray=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		String pathRoot = request.getContextPath();
		String rePath = null;
		String path=null;// 文件路径
		if (file!=null) {// 判断上传的文件是否为空
            String type=null;// 文件类型
            String fileName=file.getOriginalFilename();// 文件原名称
            log.info("上传的文件原名称:"+fileName);
            // 判断文件类型
            type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null; 
            if (type!=null) {// 判断文件类型是否为空
                if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())) {
                    // 项目在容器中实际发布运行的根路径
                    //String realPath=request.getSession().getServletContext().getRealPath("/");
                    // 自定义的文件名称
                    String trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
                    // 设置存放图片文件的路径
                    //path= realPath + "images\\" + trueFileName;
                    path = "E:\\Project\\website\\project\\UAV-Data\\WebRoot\\upfile\\" + trueFileName;
                    rePath = pathRoot + "/upfile/" + trueFileName;
                    log.info("存放图片文件的路径:"+path);
                    // 转存文件到指定的路径
                    file.transferTo(new File(path));
                    log.info("文件成功上传到指定目录下");
                    
                }else {
                	log.info("不是我们想要的文件类型,请按要求重新上传");
                }
            }else {
            	log.info("文件类型为空");
            }
        }else {
        	log.info("没有找到相对应的文件");
        }
		jsonArray.add(rePath);
        jsonObject.put("errno",0);  
        jsonObject.put("data",jsonArray);
        return jsonObject;
	}
	
}
