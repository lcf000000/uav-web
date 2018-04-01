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

import com.lcf.model.Manager;
import com.lcf.service.ManagerService;

@Controller
public class ManagerController {
	private final Logger log = LoggerFactory.getLogger(ManagerController.class);
	
	@Resource
	private ManagerService managerService;
	
	@RequestMapping(value = "/manager/login",method = RequestMethod.POST)
    public String login(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam String username, @RequestParam String password, 
    		@RequestParam String code) throws Exception{
		HttpSession session = request.getSession(false);
		if(session!=null) {
			if (code.toLowerCase().equals(session.getAttribute("RANDOMCODE").toString().toLowerCase())){
				Manager manager = managerService.findManagerByName(username);
				if (manager == null) {
					log.info("登陆用户名不存在");  
		    		request.setAttribute("message", "Username or password is wrong, please log in again!");
		    		return "manage/admin-login"; 
				}else {
					if (manager.getPassword().equals(password)) {
						// 保存用信息到session
						session.setAttribute("manager", manager);
		        		return "manage/userlist";//跳转至访问页面
						
					}else { 
		        		request.setAttribute("message", "Username or password is wrong, please log in again!");
		        		return "manage/admin-login"; 
					}
				}
			}else {
				request.getSession().setAttribute("message", "Verification code input error, please re-enter!");
	    		return "manage/admin-login"; 
			}
		}else {
			request.getSession().setAttribute("message", "Verification code input error, please re-enter!");
    		return "manage/admin-login"; 
		}
	}
	/**
	 * login out
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/manager/loginout",method = RequestMethod.POST)
	 public String execute(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}
