package com.lcf.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lcf.model.Information;
import com.lcf.model.dataformat.DataGrid;
import com.lcf.model.dataformat.Json;
import com.lcf.model.dataformat.PageBean;
import com.lcf.service.InformationService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class InformationController {
	
	private final Logger log = LoggerFactory.getLogger(InformationController.class);
	
	@Resource
	private InformationService infoService;

	/**
	 * Info tables
	 */
	@RequestMapping(value = "/info/tabledata")
	@ResponseBody 
	public JSONObject tabledata(HttpServletRequest request,
    		@RequestParam Integer start, 
    		@RequestParam Integer length, 
    		@RequestParam Integer draw,
    		@RequestParam String comment,
    		@RequestParam String author,
    		@RequestParam String title,
    		@RequestParam String datetime,
    		@RequestParam String content1,
    		@RequestParam Integer location) throws Exception {
		Information info = new Information();
		info.setTitle(title);
		info.setAuthor(author);
		info.setDatetime(datetime);
		info.setComment(comment);
		info.setLocation(location);
		String content = StringEscapeUtils.escapeHtml(content1);
		info.setContent1(content);
		PageBean<Information> pb = infoService.getInfoList(info);
		DataGrid datagrid = new DataGrid(pb.getTotal(),pb.getList());
		datagrid.setDraw(draw);
		datagrid.setRecordsFiltered((int) pb.getTotal());
		JSONObject json = JSONObject.fromObject(datagrid);
		JSONArray dataA = json.getJSONArray("data");
		for(int ja = 0; ja< dataA.size(); ja++){
			JSONObject dataO = dataA.getJSONObject(ja);
			Integer loc = Integer.parseInt(dataO.getString("location"));
			if(loc==1){
				dataO.put("location", "Index welcome");
			}else if(loc==2){
				dataO.put("location", "BM-Idet");
			}else if(loc==3){
				dataO.put("location", "BM-Vdet");
			}else if(loc==4){
				dataO.put("location", "BM-Sot");
			}else if(loc==5){
				dataO.put("location", "BM-Mot");
			}else if(loc==6){
				dataO.put("location", "Results Format");
			}else if(loc==7){
				dataO.put("location", "Test Guidelines");
			}else if(loc==8){
				dataO.put("location", "Upload Results");
			}else if(loc==9){
				dataO.put("location", "Eva-Idet");
			}else if(loc==10){
				dataO.put("location", "Eva-Vdet");
			}else if(loc==11){
				dataO.put("location", "Eva-Sot");
			}else if(loc==12){
				dataO.put("location", "Eva-Mot");
			}else if(loc==13){
				dataO.put("location", "LB-Idet");
			}else if(loc==14){
				dataO.put("location", "LB-Vdet");
			}else if(loc==15){
				dataO.put("location", "LB-Sot");
			}else if(loc==16){
				dataO.put("location", "LB-Mot");
			}else if(loc==17){
				dataO.put("location", "FAQ");
			}else if(loc==18){
				dataO.put("location", "Bibtex source");
			}else if(loc==19){
				dataO.put("location", "Abstract");
			}else if(loc==20){
				dataO.put("location", "PDF");
			}else if(loc==21){
				dataO.put("location", "Download");
			}else{
				dataO.put("location", "other");
			}
			dataO.toJSONArray(dataA);
			json.put("data", dataA);
		}
		return json;
	}
	/*
	 * get info by location
	 */
	@ResponseBody
	@RequestMapping(value = "/info/getInfoByLoc", method = RequestMethod.POST)
	public JSONObject getInfoByLoc(HttpServletRequest request,
    		@RequestParam Integer location){
		String infoData = null;
		Information info = new Information();
		try{
			info = infoService.findInfoByLoc(location);
		}catch(Exception e){
			log.debug(e.getMessage());
		}
		infoData = StringEscapeUtils.unescapeHtml(info.getContent1());
		info.setContent1(infoData);
		JSONObject j = JSONObject.fromObject(info);
		return j;
	}
	/*
	 * get info by id
	 */
	@ResponseBody
	@RequestMapping(value = "/info/getInfoById", method = RequestMethod.POST)
	public JSONObject getInfoById(HttpServletRequest request,
    		@RequestParam Integer id){
		String infoData = null;
		Information info = new Information();
		try{
			info = infoService.findInfoById(id);
		}catch(Exception e){
			log.debug(e.getMessage());
		}
		infoData = StringEscapeUtils.unescapeHtml(info.getContent1());
		info.setContent1(infoData);
		JSONObject j = JSONObject.fromObject(info);
		return j;
	}
	
	/**
	 * add info
	 */
	@ResponseBody
	@RequestMapping(value = "/info/addInfo",method = RequestMethod.POST)
    public Json addInfo(Information info) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String datetime = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
		info.setDatetime(datetime);
		String content = StringEscapeUtils.escapeHtml(info.getContent1());
		info.setContent1(content);
		Json j = new Json();
		try {
			infoService.addInfo(info);
            j.setSuccess(true);
            j.setMsg("Publish an information success!");
            j.setObj(info);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }
	
	/**
     * edit info
     */
	@ResponseBody
    @RequestMapping(value = "/info/editInfo",method = RequestMethod.POST)
    public Json editUser(Information info) {
        Json j = new Json();
        String content = StringEscapeUtils.escapeHtml(info.getContent1());
		info.setContent1(content);
        try {
        	infoService.editInfo(info);
            j.setSuccess(true);
            j.setMsg("Edit an information success!");
            j.setObj(info);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }
	
	/**
	 * delete info
	 */
	@ResponseBody
	@RequestMapping(value = "/info/deleteInfo",method = RequestMethod.POST)
	public Json deleteUser(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam Integer id) {
		Json j = new Json();
        log.info("Delete info by id ："+id);
        try {
        	infoService.deleteInfo(id);
			j.setSuccess(true);
	        j.setMsg("Delete  an information success！");
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
	}
}
