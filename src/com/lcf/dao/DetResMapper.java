package com.lcf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcf.model.DetRes;

public interface DetResMapper {
	
	public DetRes findUserByUserId(@Param("userId") int id);
	public DetRes findUserByName(@Param("name") String name);
	public DetRes findUserByUserName(@Param("userName") String userName);
	
	public List<DetRes> getDetResList(@Param("detres")DetRes detres);
	
	public void addDetRes(DetRes detres);
	public void updateDetRes(DetRes detres);
	public void deleteDetRes(int id);
}