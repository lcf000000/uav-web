package com.lcf.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.lcf.model.dataformat.DataGrid;
import com.lcf.model.dataformat.Json;
import com.lcf.model.User;
import com.lcf.model.VDetRes;
import com.lcf.service.UserService;
import com.lcf.service.VDetResService;
import com.lcf.model.dataformat.PageBean;
import com.lcf.util.UnzipFileUtil;
import com.lcf.util.EvaluateUtil;
import com.lcf.util.SendEmailUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class VDetResController {
	
private final Logger log = LoggerFactory.getLogger(VDetResController.class);
	
	@Resource
	private VDetResService VDetresService; //创建vdetRes服务的对象
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/vdetres/addres", method = RequestMethod.POST)
	@ResponseBody 
	public JSONObject addVDetRes(@RequestParam("resfile") MultipartFile resfile,
			@RequestParam("desfile") MultipartFile desfile,
			@RequestParam("codefile") MultipartFile codefile,
    		@RequestParam String name,
    		@RequestParam String language,
    		@RequestParam String core,
    		@RequestParam String freq,
    		@RequestParam String ram,
    		@RequestParam String gpu,
    		@RequestParam(required=false) String reference,
    		@RequestParam Integer user_id,
			HttpServletRequest request) throws Exception {
		
		JSONArray jsonArray=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		String path=null;// 文件路径
		String gtPath = null;
		String environment = core + freq + ram + gpu;
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date(currentTime);
		String addname = formatter.format(date);
		
		if (resfile!=null && desfile!=null) {// 判断上传的文件是否为空
            String restype=null;// 文件类型
            String resfileName=resfile.getOriginalFilename();// 文件原名称
            String destype=null;// 文件类型
            String desfileName=desfile.getOriginalFilename();// 文件原名称
            log.info("上传的文件原名称:"+resfileName);
            log.info("上传的文件原名称:"+desfileName);
            // 判断文件类型
            restype=resfileName.indexOf(".")!=-1?resfileName.substring(resfileName.lastIndexOf(".")+1, resfileName.length()):null; 
            destype=desfileName.indexOf(".")!=-1?desfileName.substring(desfileName.lastIndexOf(".")+1, desfileName.length()):null; 
            if (restype!=null&&destype!=null) {// 判断文件类型是否为空
                if (("zip".equals(restype.toLowerCase()))&&(("doc".equals(destype.toLowerCase()))||("docx".equals(destype.toLowerCase()))||("pdf".equals(destype.toLowerCase())))) {
                    // 项目在容器中实际发布运行的根路径
                    //String realPath=request.getSession().getServletContext().getRealPath("/");
                    
                	// 处理Results文件
                    String restrueFileName= "res" + String.valueOf(user_id) + addname + resfileName;
                    int dot = restrueFileName.lastIndexOf('.');
                    String resfilePath = restrueFileName.substring(0, dot);
                    // 设置存放文件的路径
                    String detDir = "N:/evaluate/dettest/userres/";
                    String groudtruthPath = "N:/evaluate/dettest/gt/";
                    //path = "E:\\Project\\website\\data\\det\\" + restrueFileName;
                    path = detDir + restrueFileName;
                    String unzipPath = detDir + resfilePath + '/';
                    gtPath = groudtruthPath;
                    log.info("存放文件的路径:"+path);
                    // 转存文件到指定的路径
                    resfile.transferTo(new File(path));
                    log.info("文件成功上传到指定目录下");
                    
                    /*
                  //解压文件
                    try {
                    	UnzipFileUtil.unZipFiles(path, detDir);
                    } catch (Exception e) {
                    	log.debug(e.getMessage());
                    }
                    //解析文件 得出结果
                                       
                    //EvaluateUtil.SotResult res = new EvaluateUtil.SotResult();
            		SotResultStruct res = new SotResultStruct();
            		res = EvaluateUtil.sotEvaluate(gtPath, unzipPath);
            		log.info("总体评测结果完成。");
                    */
                    
                    // 处理Description文件
                    String destrueFileName= "des" + String.valueOf(user_id) + addname + desfileName;
                    // 设置存放文件的路径
                    path = detDir + destrueFileName;
                    // 转存文件到指定的路径
                    desfile.transferTo(new File(path));
                    
                    String codetrueFileName = "";
                    if(codefile != null) {
                    	String codetype=null;// 文件类型
                        String codefileName=codefile.getOriginalFilename();// 文件原名称
                        codetype=codefileName.indexOf(".")!=-1?codefileName.substring(codefileName.lastIndexOf(".")+1, codefileName.length()):null; 
                      //处理Code文件
                        if (codetype!=null) {// 判断文件类型是否为空
                            if ("zip".equals(codetype.toUpperCase())) {           	
                            	codetrueFileName= "code" + String.valueOf(user_id) + addname + codefileName;
                                // 设置存放文件的路径
                                path = detDir + codetrueFileName;
                                // 转存文件到指定的路径
                                codefile.transferTo(new File(path));
                            }
                        }
                    }
                    
                    
                    UserService userService = new UserService();
                    User user = new User();
                    user = userService.findUserByID(user_id);
                    user.setDetcnt(user.getVDetcnt() - 1);
                    String email = user.getEmail();
                    Json json = new Json();
                    try {
                    	userService.edit(user);
                    	SendEmailUtil.sendEmail(email);
                    	log.info("Update user DetCnt.");
                    	json.setSuccess(true);
            			json.setMsg("Update user DetCnt success!");
                    } catch(Exception e) {
            			json.setMsg(e.getMessage());
            		}
                    
                }
            }
		}
		jsonObject.put("errno",0);  
        jsonObject.put("data",jsonArray);
		return jsonObject;
	}

}
