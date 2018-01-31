package com.lcf.controller;

import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.servlet.ModelAndView;  
/** 
 * @package: com.lcf.controller  
 * @Title: PageController  
 * @Description: WEB-INF中的jsp跳转
 * @author lcf
 */  
@RequestMapping("/")  
@Controller  
public class PageController {  
  
    /** 
     * @Title: toPage  
     * @Description: 二级页面跳转，例如 WEB-INF/views/login.jsp 
     * @param: @param pageName1  例如 views
     * @param: @param pageName2 例如 login 
     * @param: @return     
     * @return: ModelAndView   views/login
     */  
    @RequestMapping(value = "{pageName1}/{pageName2}", method = RequestMethod.GET)  
    public ModelAndView toPage(@PathVariable("pageName1") String pageName1,@PathVariable("pageName2") String pageName2) {  
        ModelAndView mv = new ModelAndView(pageName1+"/"+pageName2);  
        return mv;  
    }  
      
      
    /** 
     * @Title: toPage  
     * @Description: 一级页面跳转，例如 WEB-INF/logout.jsp 
     * @param: @param pageName1  例如 logout 
     * @param: @return     
     * @return: ModelAndView   login
     */  
    @RequestMapping(value = "{pageName1}", method = RequestMethod.GET)  
    public ModelAndView toPage(@PathVariable("pageName1") String pageName1) {  
        ModelAndView mv = new ModelAndView(pageName1);  
        return mv;  
    }  
      
  
}  
