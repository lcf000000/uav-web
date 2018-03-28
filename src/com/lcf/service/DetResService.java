/**
 * @author Pangpang Ma
 * @date  2018.02.20
 * 
 * DetRes 服务代理
 */

package com.lcf.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lcf.dao.DetResMapper;
import com.lcf.model.DetRes;
import com.lcf.model.dataformat.PageBean;
import com.lcf.model.dataformat.PaginationContext;
import com.github.pagehelper.*;


@Service 
public class DetResService {

	@Resource
	private DetResMapper detresMapper;
	
	/**
	 * @param userID
	 * @return
	 */
	public DetRes findUserByUserId(int userID) {
		return detresMapper.findDetResByUserId(userID);
	}
	
	/**
	 * @param result_name
	 * @return
	 */
	public DetRes findUserByName(String name) {
		return detresMapper.findDetResByName(name);
	}
	
	/**
	 * @param userName
	 * @return
	 */
	public DetRes findUserByUserName(String userName) {
		return detresMapper.findDetResByUserName(userName);
	}
	
	/**
	 * 获取result_det列表
	 */
	public PageBean<DetRes> getDetResList(DetRes detres) {
		PageHelper.startPage(PaginationContext.getPageNum(), PaginationContext.getPageSize());
        List<DetRes> list = this.detresMapper.getDetResList(detres);
		return new PageBean<DetRes>(list);  
	}
	
	/**
	 * @param detres
	 * @新增result_det
	 */
	public void addDetRes(DetRes detres) {
		detresMapper.addDetRes(detres);
	}
	
	/**
	 * @param detres
	 * @更新result_det
	 */
	public void updateDetRes(DetRes detres) {
		detresMapper.updateDetRes(detres);
	}
	
	/**
	 * @param resultID
	 * @删除result_det
	 */
	public void deleteDetRes(int resultID) {
		detresMapper.deleteDetRes(resultID);
	}
}