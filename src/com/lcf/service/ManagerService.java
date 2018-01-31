package com.lcf.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lcf.dao.ManagerMapper;
import com.lcf.model.Manager;

@Service
public class ManagerService {
	
	@Resource
	private ManagerMapper managermapper;
	
	/*
	 * 登录
	 */
	public Manager findManagerByName(String username) {
		return managermapper.findManagerByName(username);
	}
}
