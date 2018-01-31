/**
 * 
 */
package com.lcf.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.lcf.dao.UserMapper;
import com.lcf.model.User;
import com.lcf.model.dataformat.PageBean;
import com.lcf.model.dataformat.PaginationContext;
import com.github.pagehelper.*;


@Service //一定要加注解
public class UserService {

	@Resource
	private UserMapper userMapper;
	/**
	 * @param username
	 * @return
	 */
	public User findUserByName(String username) {
		return userMapper.findUserByName(username);
	}
	
	/**
	 * 获取用户列表
	 */
	public PageBean<User> getUserList(User user) {
		PageHelper.startPage(PaginationContext.getPageNum(), PaginationContext.getPageSize());
        List<User> list = this.userMapper.getUserList(user);
		return new PageBean<User>(list);  
	}
	/**
	 * 新增用户
	 * @param user
	 */
	public void add(User user) {
		userMapper.addUser(user);  
	}

	/**
	 * 编辑用户
	 * @param user
	 */
	public void edit(User user) {
		userMapper.editUser(user);  
	}  
    
	/**
	 * 删除用户
	 * @param id
	 */
	public void deleteUser(int id){
		userMapper.deleteUser(id);
	}
    
    
}
