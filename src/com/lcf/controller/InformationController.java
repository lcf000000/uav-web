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
				dataO.put("location", "Image-Detection");
			}else if(loc==3){
				dataO.put("location", "Video-Detection");
			}else if(loc==4){
				dataO.put("location", "Single-Trcking");
			}else if(loc==5){
				dataO.put("location", "Multi-Tracking");
			}else if(loc==6){
				dataO.put("location", "Res-Idet");
			}else if(loc==7){
				dataO.put("location", "Res-Vdet");
			}else if(loc==8){
				dataO.put("location", "Res-Sot");
			}else if(loc==9){
				dataO.put("location", "Res-Mot");
			}else if(loc==14){
				dataO.put("location", "Instructions");
			}else if(loc==15){
				dataO.put("location", "FAQ");
			}else if(loc==16){
				dataO.put("location", "People");
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
		log.debug(infoData);
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
		log.debug(infoData);
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
        log.debug("Get----------------->："+info.getContent1());
        String content = StringEscapeUtils.escapeHtml(info.getContent1());
		info.setContent1(content);
		log.debug("Encode----------------->："+info.getContent1());
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
        log.debug("Delete info by id ："+id);
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
