package com.lcf.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lcf.model.Manager;
import com.lcf.service.ManagerService;
import com.lcf.util.RequestUtil;

/**
 * @author lcf
 */
public class ManagerInterceptor extends HandlerInterceptorAdapter{
	
	private final Logger log = LoggerFactory.getLogger(ManagerInterceptor.class);
	
	@Resource
	private ManagerService managerService;
	
    @Override  
    public boolean preHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler) throws Exception {  
    	
    	if ("GET".equalsIgnoreCase(request.getMethod())) {
    		RequestUtil.saveRequest();
        }
        //log.info("==============执行拦截: preHandle================");  
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());
		
		//这里对拉入黑名单的ip进行处理
		log.info("来自 >>>>>>"+RequestUtil.getIpAddr(request)+" 请求访问后台页面。");	
		
        Manager manager =  (Manager)request.getSession().getAttribute("manager"); 
        
        // 判断用户是否登录，一般是都没登录的
        if(manager == null){
        	//request.getRequestDispatcher("/views/forwardLogin").forward(request, response);
        	response.sendRedirect(request.getContextPath()+"/manage/admin-login");
            return false;
	     }else{
	    	if (url.contains("login")||url.contains("register")){
			    return true;
		    }
	    	Manager checkUser = managerService.findManagerByName(manager.getUsername());
        	if(manager.getPassword().equals(checkUser.getPassword())) {
        		return true;
        	}else {
        		response.sendRedirect(request.getContextPath()+"/manage/admin-login");
        		return false;
        	}
            
	    }
    }
    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作   
     * 可在modelAndView中加入数据，比如当前时间
     */
    @Override  
    public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {
    }  
  
    /** 
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等  
     *  
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion() 
     */  
    @Override  
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex)  
            throws Exception {  
    }
    

}  
