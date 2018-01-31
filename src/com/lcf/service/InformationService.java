package com.lcf.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lcf.dao.InformationMapper;
import com.lcf.model.Information;
import com.lcf.model.dataformat.PageBean;
import com.lcf.model.dataformat.PaginationContext;
import com.github.pagehelper.*;

@Service
public class InformationService {

	@Resource
	private InformationMapper infomapper;
	
	/*
	 * find by location
	 */
	public Information findInfoByLoc(Integer location) {
		return infomapper.findInfoByLoc(location);
	}
	/*
	 * find by id
	 */
	public Information findInfoById(Integer id) {
		return infomapper.findInfoById(id);
	}
	/*
	 * get information list by search rules
	 */
	public PageBean<Information> getInfoList(Information info) {
		PageHelper.startPage(PaginationContext.getPageNum(), PaginationContext.getPageSize());
        List<Information> list = this.infomapper.getInfoList(info);
		return new PageBean<Information>(list);
	}
	/*
	 * add information
	 */
	public void addInfo(Information info) {
		infomapper.addInfo(info);
	}
	/*
	 * edit information
	 */
	public void editInfo(Information info) {
		infomapper.editInfo(info);
	}
	/*
	 * delete information by id
	 */
	public void deleteInfo(int id){
		infomapper.deleteInfo(id);
	}
}
