package com.lcf.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lcf.model.User;
import com.lcf.service.UserService;
import com.lcf.util.RequestUtil;

/**
 * @author lcf
 */
public class CommonInterceptor extends HandlerInterceptorAdapter{
	private final Logger log = LoggerFactory.getLogger(CommonInterceptor.class);
	@Resource
	private UserService userService;
	/*
	 * 利用正则映射到需要拦截的路径    
	 
    private String mappingURL;
    
    public void setMappingURL(String mappingURL) {    
               this.mappingURL = mappingURL;    
    }   
  */
    /** 
     * 在业务处理器处理请求之前被调用 
     * 如果返回false 
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     *     
     * 如果返回true 
     *    执行下一个拦截器,直到所有的拦截器都执行完毕 
     *    再执行被拦截的Controller 
     *    然后进入拦截器链, 
     *    从最后一个拦截器往回执行所有的postHandle() 
     *    接着再从最后一个拦截器往回执行所有的afterCompletion() 
     */  
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
		log.info("来自 >>>>>>"+RequestUtil.getIpAddr(request)+" 请求访问。");	
		
        User user =  (User)request.getSession().getAttribute("user"); 
        
        // 判断用户是否登录，一般是都没登录的
        if(user == null){
        	//request.getRequestDispatcher("/views/forwardLogin").forward(request, response);
        	response.sendRedirect(request.getContextPath()+"/manage/forwardLogin");
            return false;
	     }else{
	    	if (url.contains("login")||url.contains("register")){
			    return true;
		    }
	    	User checkUser = userService.findUserByName(user.getUsername());
        	if(user.getPassword().equals(checkUser.getPassword())) {
        		return true;
        	}else {
        		response.sendRedirect(request.getContextPath()+"/manage/forwardLogin");
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
