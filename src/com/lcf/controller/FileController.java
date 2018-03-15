package com.lcf.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lcf.model.User;
import com.lcf.service.DownloadFileService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class FileController {
	
	private final Logger log = LoggerFactory.getLogger(FileController.class);
	
	@Resource
	private DownloadFileService downloadfile; 

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
                    // 自定义的文件名称
                    String trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
                    // 设置存放图片文件的路径
                    //path = "D:\\Program Files\\apache-tomcat-8.0.46\\imges\\" + trueFileName;
                    path = "/usr/uavweb/images/" + trueFileName;
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
	@RequestMapping(value = "/downloadFile/{filename:.+}")
	@ResponseBody
    public ModelAndView downloadFile(@PathVariable("filename") String filename,HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(false);
		if(session!=null) {
			Object obj = session.getAttribute("user");
			if(obj instanceof User) {
				try {	
					downloadfile.downloadSolve(filename,request,response);
		        }catch (ServletException e){
		            e.printStackTrace();
		        }catch (IOException e){
		            e.printStackTrace();
		        }
				return null;
			}else {
				 return new ModelAndView("/views/forwardLogin");
			}
		}else {
			 return new ModelAndView("/views/forwardLogin");
		}
    }
}
