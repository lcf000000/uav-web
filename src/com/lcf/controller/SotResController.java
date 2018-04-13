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
import com.lcf.model.SotRes;
import com.lcf.model.User;
import com.lcf.service.SotResService;
import com.lcf.service.UserService;
import com.lcf.model.dataformat.PageBean;
import com.lcf.util.UnzipFileUtil;
import com.lcf.util.EvaluateUtil;
import com.lcf.util.SendEmailUtil;
import com.lcf.util.common.SotResultStruct;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SotResController {
	
	private final Logger log = LoggerFactory.getLogger(SotResController.class);
	
	@Resource
	private SotResService sotresService; //创建sotRes服务的对象
	
	@RequestMapping(value = "/sotres/addres", method = RequestMethod.POST)
	@ResponseBody 
	public JSONObject addSotRes(HttpServletRequest request, @RequestParam("resfile") MultipartFile resfile,
			@RequestParam("desfile") MultipartFile desfile,
			@RequestParam("codefile") MultipartFile codefile,
    		@RequestParam String name,
    		@RequestParam String language,
    		@RequestParam String core,
    		@RequestParam String freq,
    		@RequestParam String ram,
    		@RequestParam String gpu,
    		@RequestParam(required=false) String reference,
    		@RequestParam Integer user_id) throws Exception
	{
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
                    // 设置存放文件的路径
                    String sotDir = "E:\\test\\sot\\";
                    String groudtruthPath = "E:\\Project\\resource\\BenchMark\\sot-res\\sot_ann_release\\test";
                    //path = "E:\\Project\\website\\data\\sot\\" + restrueFileName;
                    path = sotDir + restrueFileName;
                    gtPath = groudtruthPath;
                    log.info("存放文件的路径:"+path);
                    // 转存文件到指定的路径
                    resfile.transferTo(new File(path));
                    log.info("文件成功上传到指定目录下");
                    
                    /*
                  //解压文件
                    try {
                    	UnzipFileUtil.unZipFiles(path, sotDir);
                    } catch (Exception e) {
                    	log.debug(e.getMessage());
                    }
                    //解析文件 得出结果
                                       
                    //EvaluateUtil.SotResult res = new EvaluateUtil.SotResult();
            		SotResultStruct res = new SotResultStruct();
            		res = EvaluateUtil.sotEvaluate(gtPath, path);
            		log.info("总体评测结果完成。");
                    */
                    
                    // 处理Description文件
                    String destrueFileName= "des" + String.valueOf(user_id) + addname + desfileName;
                    // 设置存放文件的路径
                    path = "E:\\test\\sot\\" + destrueFileName;
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
                                path = sotDir + codetrueFileName;
                                // 转存文件到指定的路径
                                codefile.transferTo(new File(path));
                            }
                        }
                    }
                    
                    /*
                    SotRes sotres = new SotRes();
            		
            		//sotres.setId(id);
            		sotres.setName(name);
            		sotres.setUser_id(user_id);
            		sotres.setLanguage(language);
            		sotres.setEnvironment(environment);
            		sotres.setResfile(resfileName);
            		sotres.setCode(codetrueFileName);
            		sotres.setDescrip(destrueFileName);
            		sotres.setReference(reference);
            		
            		sotres.setArcP(res.arc_p);
            		sotres.setBcP(res.bc_p);
            		sotres.setCmP(res.cm_p);
            		sotres.setFmP(res.fm_p);
            		sotres.setFocP(res.foc_p);
            		sotres.setIvP(res.iv_p);
            		sotres.setLrP(res.lr_p);
            		sotres.setOvP(res.ov_p);
            		sotres.setPocP(res.poc_p);
            		sotres.setSobP(res.sob_p);
            		sotres.setSvP(res.sv_p);
            		sotres.setVcP(res.vc_p);
            		sotres.setOverallP(res.getPrecision());
            		
            		sotres.setArcIOU(res.arc_iou);
            		sotres.setBcIOU(res.bc_iou);
            		sotres.setCmIOU(res.cm_iou);
            		sotres.setFmIOU(res.fm_iou);
            		sotres.setFocIOU(res.foc_iou);
            		sotres.setIvIOU(res.iv_iou);
            		sotres.setLrIOU(res.lr_iou);
            		sotres.setOvIOU(res.ov_iou);
            		sotres.setPocIOU(res.poc_iou);
            		sotres.setSobIOU(res.sob_iou);
            		sotres.setSvIOU(res.sv_iou);
            		sotres.setVcIOU(res.vc_iou);
            		sotres.setOverallP(res.getIOU());
            		sotres.setSpeed(res.getFPS());
            		
            		sotres.setStatus(1);
            		
            		Date currentDate = new Date();
            		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentDate);
            		sotres.setDate(nowTime);
            		
            		Json json = new Json();
            		log.debug("Insert record.");
            		try {
            			sotresService.addSotRes(sotres);
            			json.setSuccess(true);
            			json.setMsg("Insert result success!");
            		} catch(Exception e) {
            			json.setMsg(e.getMessage());
            		}
            		*/
                    
                    UserService userService = new UserService();
                    User user = new User();
                    user = userService.findUserByID(user_id);
                    user.setSotcnt(user.getSotcnt() - 1);
                    String email = user.getEmail();
                    Json json = new Json();
                    try {
                    	userService.edit(user);
                    	SendEmailUtil.sendEmail(email);
                    	log.info("Update user SotCnt.");
                    	json.setSuccess(true);
            			json.setMsg("Update user SotCnt success!");
                    } catch(Exception e) {
            			json.setMsg(e.getMessage());
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
	
	@RequestMapping(value = "/sotres/getSotbyUserid", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject findUserByUserID(
			HttpServletRequest request,
    		@RequestParam Integer userID) {
		SotRes sotres = new SotRes();
		log.info(userID.toString());
		try {
			sotres = sotresService.findUserByUserID(userID);
		} catch(Exception e) {
			log.debug(e.getMessage());
		}
		JSONObject jsonObject = JSONObject.fromObject(sotres);
		return jsonObject;
	}
	
	@RequestMapping(value = "/sotres/getSotbyUsername", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject findUserByUserName(
			HttpServletRequest request,
    		@RequestParam String userName) {
		//String userRes = null;
		SotRes sotres = new SotRes();
		try {
			sotres = sotresService.findUserByUserName(userName);
		} catch(Exception e) {
			log.debug(e.getMessage());
		}
		JSONObject jsonObject = JSONObject.fromObject(sotres);
		
		return jsonObject;
	}
	
	@RequestMapping(value = "/sotres/tabledata", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject tabledata(
			HttpServletRequest request,
			@RequestParam Integer start,
    		@RequestParam Integer length,
    		@RequestParam Integer draw,
    		@RequestParam (required=false) Integer id,
    		@RequestParam (required=false) String name,
    		@RequestParam (required=false) Integer userID,
    		@RequestParam (required=false) String language,
    		@RequestParam (required=false) String environment,
    		@RequestParam (required=false) String reference,
    		@RequestParam (required=false) String resfile,
    		@RequestParam (required=false) String code,
    		@RequestParam (required=false) String descrip,
    		@RequestParam (required=false) Integer status) throws Exception {
		//String userRes = null;
		SotRes sotres = new SotRes();
		
		if(id!=null) {
			sotres.setId(id);
		}
		sotres.setName(name);
		if(userID!=null) {
			sotres.setUser_id(userID);
		}
		sotres.setLanguage(language);
		sotres.setEnvironment(environment);
		sotres.setResfile(resfile);
		sotres.setCode(code);
		sotres.setDescrip(descrip);
		sotres.setReference(reference);
		if(status!=null) {
			sotres.setStatus(status);
		}
		PageBean<SotRes> pb = sotresService.getSotResList(sotres);
		DataGrid datagrid = new DataGrid(pb.getTotal(),pb.getList());
		datagrid.setDraw(draw);
		datagrid.setRecordsFiltered((int) pb.getTotal());
		JSONObject json = JSONObject.fromObject(datagrid);
		return json;
	}
	
	@RequestMapping(value = "/sotres/delSotbyId", method = RequestMethod.POST)
	@ResponseBody
	public Json deleteSotRes(HttpServletRequest request,
    		@RequestParam Integer id) {		
		Json json = new Json();
		log.debug("Delete result: " + id);
		try {
			sotresService.deleteSotRes(id);
			json.setSuccess(true);
			json.setMsg("Delete result success!");
		} catch(Exception e) {
			json.setMsg(e.getMessage());
		}
		
		return json;
	}
	
	@RequestMapping(value = "/sotres/updateSotbyId", method = RequestMethod.POST)
	@ResponseBody
	public Json updateSotRes(SotRes sotres) {
		
		Json json = new Json();
		log.debug("Update result: " + sotres.getId());
		Date currentDate = new Date();
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentDate);
		sotres.setDate(nowTime);
		try {
			sotresService.updateSotRes(sotres);
			json.setSuccess(true);
			json.setMsg("Update result success!");
		} catch(Exception e) {
			json.setMsg(e.getMessage());
		}
		
		return json;
	}
	
	@RequestMapping(value = "/sotres/addSot", method = RequestMethod.POST)
	@ResponseBody
	public Json addSot(SotRes sotres) {
		
		Json json = new Json();
		log.debug("Update result: " + sotres.getId());
		Date currentDate = new Date();
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentDate);
		sotres.setDate(nowTime);
		try {
			sotresService.addSotRes(sotres);
			json.setSuccess(true);
			json.setMsg("Update result success!");
		} catch(Exception e) {
			json.setMsg(e.getMessage());
		}
		
		return json;
	}
}
