/**
 * 
 */
package com.lcf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lcf.model.User;

public interface UserMapper {
	
	//提供访问数据库的接口，和Mapper.xml中的查询语句对应
	
	public User findUserByName(@Param("username") String username);
	
	public List<User> getUserList(@Param("user")User user);

	public void addUser(User user);

	public void editUser(User user);
	
	public void deleteUser(int id);

}
