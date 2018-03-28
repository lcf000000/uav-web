package com.lcf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcf.model.MotRes;

public interface MotResMapper {
	
public MotRes findMotResByUserID(@Param("user_id") int id);
	
	public MotRes findMotResByName(@Param("name") String name);
	
	public MotRes findMotResByUserName(@Param("username") String username);
	
	public List<MotRes> getMotResList(@Param("motres")MotRes motres);

	public void addMotRes(MotRes motres);

	public void updateMotRes(MotRes motres);
	
	public void deleteMotRes(int id);
}