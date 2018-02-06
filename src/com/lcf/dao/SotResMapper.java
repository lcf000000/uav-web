/**
 * @author Pangpang Ma
 * @date  2018.02.06
 * 
 * 提供访问数据库的接口，和Mapper.xml中的查询语句对应
 */
package com.lcf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcf.model.SotRes;

public interface SotResMapper {
	
	public SotRes findUserByUserID(@Param("user_id") int id);
	public SotRes findUserByName(@Param("name") String name);
	public SotRes findUserByUserName(@Param("username") String username);
	
	public List<SotRes> getSotResList(@Param("sotres")SotRes sotres);

	public void addSotRes(SotRes sotres);

	public void updateSotRes(SotRes sotres);
	
	public void deleteSotRes(int id);

}