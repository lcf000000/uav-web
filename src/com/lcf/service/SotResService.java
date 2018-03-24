/**
 * @author Pangpang Ma
 * @date  2018.02.06
 * 
 * SotRes 服务代理
 */

package com.lcf.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lcf.dao.SotResMapper;
import com.lcf.model.SotRes;
import com.lcf.model.dataformat.PageBean;
import com.lcf.model.dataformat.PaginationContext;
import com.github.pagehelper.*;


@Service 
public class SotResService {

	@Resource
	private SotResMapper sotresMapper;
	
	/**
	 * @param userID
	 * @return
	 */
	public SotRes findUserByUserID(int userID) {
		return sotresMapper.findSotResByUserID(userID);
	}
	
	/**
	 * @param result_name
	 * @return
	 */
	public SotRes findUserByName(String name) {
		return sotresMapper.findSotResByName(name);
	}
	
	/**
	 * @param userName
	 * @return
	 */
	public SotRes findUserByUserName(String userName) {
		return sotresMapper.findSotResByUserName(userName);
	}
	
	/**
	 * 获取result_sot列表
	 */
	public PageBean<SotRes> getSotResList(SotRes sotres) {
		PageHelper.startPage(PaginationContext.getPageNum(), PaginationContext.getPageSize());
        List<SotRes> list = this.sotresMapper.getSotResList(sotres);
		return new PageBean<SotRes>(list);  
	}
	
	/**
	 * @param sotres
	 * @新增result_sot
	 */
	public void addSotRes(SotRes sotres) {
		sotresMapper.addSotRes(sotres);
	}
	
	/**
	 * @param sotres
	 * @更新result_sot
	 */
	public void updateSotRes(SotRes sotres) {
		sotresMapper.updateSotRes(sotres);
	}
	
	/**
	 * @param resultID
	 * @删除result_sot
	 */
	public void deleteSotRes(int resultID) {
		sotresMapper.deleteSotRes(resultID);
	}
}