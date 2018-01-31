package com.lcf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcf.model.Manager;

public interface ManagerMapper {
	public Manager findManagerByName(@Param("username") String username);
	
	public List<Manager> getManagerAll();
}
