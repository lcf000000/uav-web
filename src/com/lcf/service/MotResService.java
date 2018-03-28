/**
 * @author Pangpang Ma
 * @date  2018.02.06
 * 
 * MotRes 服务代理
 */

package com.lcf.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lcf.dao.MotResMapper;
import com.lcf.model.MotRes;
import com.lcf.model.dataformat.PageBean;
import com.lcf.model.dataformat.PaginationContext;
import com.github.pagehelper.*;


@Service 
public class MotResService {

	@Resource
	private MotResMapper motresMapper;
	
	/**
	 * @param userID
	 * @return
	 */
	public MotRes findUserByUserID(int userID) {
		return motresMapper.findMotResByUserID(userID);
	}
	
	/**
	 * @param result_name
	 * @return
	 */
	public MotRes findUserByName(String name) {
		return motresMapper.findMotResByName(name);
	}
	
	/**
	 * @param userName
	 * @return
	 */
	public MotRes findUserByUserName(String userName) {
		return motresMapper.findMotResByUserName(userName);
	}
	
	/**
	 * 获取result_mot列表
	 */
	public PageBean<MotRes> getMotResList(MotRes motres) {
		PageHelper.startPage(PaginationContext.getPageNum(), PaginationContext.getPageSize());
        List<MotRes> list = this.motresMapper.getMotResList(motres);
		return new PageBean<MotRes>(list);  
	}
	
	/**
	 * @param motres
	 * @新增result_mot
	 */
	public void addMotRes(MotRes motres) {
		motresMapper.addMotRes(motres);
	}
	
	/**
	 * @param motres
	 * @更新result_mot
	 */
	public void updateMotRes(MotRes motres) {
		motresMapper.updateMotRes(motres);
	}
	
	/**
	 * @param resultID
	 * @删除result_mot
	 */
	public void deleteMotRes(int resultID) {
		motresMapper.deleteMotRes(resultID);
	}
}