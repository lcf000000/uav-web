package com.lcf.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.annotation.Resource;

import org.apache.commons.lang.StringEscapeUtils;
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
import com.lcf.service.SotResService;
import com.lcf.model.dataformat.PageBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SotResController {
	
	private final Logger log = LoggerFactory.getLogger(SotResController.class);
	
	@Resource
	private SotResService sotresService; //创建sotRes服务的对象
	
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
	
	@RequestMapping(value = "/sotres/getSotbyUserid", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject findUserByUserID(
			HttpServletRequest request,
    		@RequestParam Integer userID) {
		//String userRes = null;
		SotRes sotres = new SotRes();
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
	public JSONObject findUserByName(
			HttpServletRequest request,
    		@RequestParam String Name) {
		//String userRes = null;
		SotRes sotres = new SotRes();
		try {
			sotres = sotresService.findUserByUserName(Name);
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
    		@RequestParam Integer id,
    		@RequestParam String name,
    		@RequestParam Integer userID,
    		@RequestParam String language,
    		@RequestParam String environment,
    		@RequestParam String reference,
    		@RequestParam String resfile,
    		@RequestParam String code,
    		@RequestParam String descrip,
    		@RequestParam double arc,
    		@RequestParam double bc,
    		@RequestParam double cm,
    		@RequestParam double fm,
    		@RequestParam double foc,
    		@RequestParam double iv,
    		@RequestParam double lr,
    		@RequestParam double ov,
    		@RequestParam double poc,
    		@RequestParam double sob,
    		@RequestParam double sv,
    		@RequestParam double vc,
    		@RequestParam double speed,
    		@RequestParam double overall,
    		@RequestParam Integer status) throws Exception {
		//String userRes = null;
		SotRes sotres = new SotRes();
		
		sotres.setId(id);
		sotres.setName(name);
		sotres.setUser_id(userID);
		sotres.setLanguage(language);
		sotres.setEnvironment(environment);
		sotres.setResfile(resfile);
		sotres.setCode(code);
		sotres.setDescrip(descrip);
		sotres.setReference(reference);
		sotres.setArc(arc);
		sotres.setBc(bc);
		sotres.setCm(cm);
		sotres.setFm(fm);
		sotres.setFoc(foc);
		sotres.setIv(iv);
		sotres.setLr(lr);
		sotres.setOv(ov);
		sotres.setPoc(poc);
		sotres.setSob(sob);
		sotres.setSv(sv);
		sotres.setVc(vc);
		sotres.setSpeed(speed);
		sotres.setOverall(overall);
		sotres.setStatus(status);
		
		PageBean<SotRes> pb = sotresService.getSotResList(sotres);
		DataGrid datagrid = new DataGrid(pb.getTotal(),pb.getList());
		datagrid.setDraw(draw);
		datagrid.setRecordsFiltered((int) pb.getTotal());
		JSONObject json = JSONObject.fromObject(datagrid);
		//JSONArray dataA = json.getJSONArray("data");
		
		//JSONObject jsonObject = JSONObject.fromObject(sotres);
		
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
		Timestamp date = Timestamp.valueOf(nowTime);
		sotres.setDate(date);
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
	public Json addSotRes(SotRes sotres) {
		
		Json json = new Json();
		log.debug("Update result: " + sotres.getId());
		Date currentDate = new Date();
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentDate);
		Timestamp date = Timestamp.valueOf(nowTime);
		sotres.setDate(date);
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
