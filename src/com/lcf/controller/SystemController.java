/**
 * 
 */
package com.lcf.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.lcf.model.User;
import com.lcf.service.UserService;
import com.lcf.util.RequestUtil;
import com.lcf.util.UserCookieUtil;
import com.lcf.util.common.Const;

@Controller
public class SystemController extends BaseController {
	private final Logger log = LoggerFactory.getLogger(SystemController.class);
	@Resource
	private UserService userService;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String home() {
		log.info("return to index ！");
		return "views/index";
	}
	
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam String loginname, @RequestParam String password, 
    		@RequestParam String code,@RequestParam String autologinch) throws Exception{
    	
		if (code.toLowerCase().equals(request.getSession().getAttribute("RANDOMCODE").toString().toLowerCase())){
			User user = userService.findUserByName(loginname);
			if (user == null) {
				log.info("username is null");  
	    		request.getSession().setAttribute("message", "Username or password is wrong, please log in again!");
	    		return "login"; 
			}else {
				if (user.getPassword().equals(password)) {
					
					if(autologinch!=null && autologinch.equals("Y")){ // 判断是否要添加到cookie中
						// 保存用户信息到cookie
						UserCookieUtil.saveCookie(user, response);
					}
					
					// 保存用信息到session
					request.getSession().setAttribute(Const.SESSION_USER, user);  
	        		return "redirect:" + RequestUtil.retrieveSavedRequest();//跳转至访问页面
					
				}else {
					log.info("登陆密码错误");  
	        		request.getSession().setAttribute("message", "Username or password is wrong, please log in again!");
	        		return "login"; 
				}
			}
		}else {
			request.getSession().setAttribute("message", "Verification code input error, please re-enter!");
    		return "login"; 
		}
    }
    
	/**
	 * 用户注销
	 * @return
	 */
	@RequestMapping(value="/user/logout")
	public String logout(HttpSession session,HttpServletResponse response){
		session.removeAttribute("user");
		UserCookieUtil.clearCookie(response);
		return "redirect:/";
	}
}
