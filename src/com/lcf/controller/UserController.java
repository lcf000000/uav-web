/**
 * 
 */
package com.lcf.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.lcf.model.User;
import com.lcf.model.dataformat.DataGrid;
import com.lcf.model.dataformat.Json;
import com.lcf.model.dataformat.PageBean;
import com.lcf.service.UserService;
import com.lcf.util.SendEmailUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author
 * 2014-8-23
 */
@Controller
public class UserController {
	
	private final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Resource
	private UserService userService; //创建user服务的对象
	
	/**
	 * login
	 * @param request
	 * @param response
	 * @param loginname
	 * @param password
	 * @param code
	 * @param autologinch
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/login",method = RequestMethod.POST) // '/user/login'为前端请求的接口
    public String login(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam String username, @RequestParam String password,  // username,password,code 为前端传递过来的参数
    		@RequestParam String code) throws Exception{
		HttpSession session = request.getSession(false);
		if(session!=null) {
			if (code.toLowerCase().equals(session.getAttribute("RANDOMCODE").toString().toLowerCase())){
				User user = null;
				try{
					user = userService.findUserByName(username);
				}catch(Exception e){
				}
				if (user == null) { 
		    		request.setAttribute("message", "Username or password is wrong, please login again!");
		    		return "views/login"; 
				}else {
					if (user.getPassword().equals(password)) {
						// 保存用信息到session
						session.setAttribute("user", user);
		        		return "redirect:/";//跳转至访问页面
					}else {
		        		request.setAttribute("message", "Username or password is wrong, please login again!");
		        		return "views/login"; 
					}
				}
			}else {
				request.setAttribute("message", "Verification code input error, please re-enter!");
	    		return "views/login"; //返回某个页面 ，格式为'文件夹/页面名称' 一般返回内容为json格式
			}
		}else {
			request.setAttribute("message", "Verification code input error, please re-enter!");
    		return "views/login"; //返回某个页面 ，格式为'文件夹/页面名称' 一般返回内容为json格式
		}
	}
	/**
	 * login out
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/user/loginout",method = RequestMethod.POST)
	 public String execute(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
	/**
	 * check user name is available
	 * @param request
	 * @param response
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/user/checkUsername",method = RequestMethod.POST)
	@ResponseBody //若返回json，必须加此注解
	 public Json checkUname(HttpServletRequest request,HttpServletResponse response,
	    		@RequestParam String username){
		Json j = new Json();
		User user = null;
		try {
            user = userService.findUserByName(username);
            if(user == null || user.getUsername() == null ||  user.getUsername() == ""){
            	j.setSuccess(true);
            	j.setMsg("This username is available!");
            }else{
            	j.setSuccess(false);
            	j.setMsg("This username has been used!");
            }
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
   }
	
	/**
	 * user table
	 * @return
	 */
	@RequestMapping(value = "/user/tabledata")
	@ResponseBody 
	public JSONObject tabledata(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam Integer start, //开始索引数
    		@RequestParam Integer length, //每页显示数量
    		@RequestParam Integer draw,	//原值返回，插件的参数
    		@RequestParam String username,
    		@RequestParam String realname,
    		@RequestParam String email,
    		@RequestParam String country,
    		@RequestParam String org,
    		@RequestParam Integer right) throws Exception {
		User user = new User();
		user.setUsername(username);
		user.setRealname(realname);
		user.setCountry(country);
		user.setEmail(email);
		user.setOrg(org);
		user.setRight(right);
		PageBean<User> pb = userService.getUserList(user);//将查询到的user存入List
		DataGrid datagrid = new DataGrid(pb.getTotal(),pb.getList());//将查询到的数据分页
		datagrid.setDraw(draw);//设置行数
		datagrid.setRecordsFiltered((int) pb.getTotal());
		JSONObject json = JSONObject.fromObject(datagrid);//将数据封装成json格式
		JSONArray dataA = json.getJSONArray("data");//获取数据
		//right数值型变为String，增加可读性，数据转换
		for(int ja = 0; ja< dataA.size(); ja++){
			JSONObject dataO = dataA.getJSONObject(ja);
			Integer rig = Integer.parseInt(dataO.getString("right"));
			if(rig==1){
				dataO.put("right", "Register User");
			}else if(rig==2) {
				dataO.put("right", "Member");
			}else if(rig==3){
				dataO.put("right", "Super Member");
			}else{
				dataO.put("right", "Others");
			}
			dataO.toJSONArray(dataA);//将更改后的属性传回dataA
			json.put("data", dataA);
		}
		return json;
	}
	
	/**
	 * 新增用户
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/addUser",method = RequestMethod.POST)
    public Json addUser(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam String add_username,
    		@RequestParam String add_password,
    		@RequestParam String add_realname,
    		@RequestParam String add_email,
    		@RequestParam String add_country,
    		@RequestParam String add_org) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String regtime = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
		
		User user = new User();
		user.setRegtime(regtime);
		user.setCountry(add_country);
		user.setEmail(add_email);
		user.setOrg(add_org);
		user.setRealname(add_realname);
		user.setUsername(add_username);
		user.setPassword(add_password);
		user.setDetcnt(5);
		user.setMotcnt(5);
		user.setSotcnt(5);
		user.setVDetcnt(5);
		user.setRight(1);
		Json j = new Json();
		try {
            userService.add(user);
            j.setSuccess(true);
            j.setMsg("Add user success!");
            j.setObj(user);
            //SendEmailUtil.sendEmail(user.getEmail(), true);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }
	
	/**
	 * Find User by Id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/findUserById",method = RequestMethod.POST)
    public JSONArray findUserById(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam Integer user_id) {
		User user = new User();
		JSONArray jsonA = new JSONArray();
		try {
            user = userService.findUserByID(user_id);
            JSONObject user1 = new JSONObject();
            log.info(String.valueOf(user.getDetcnt()));
            user1.put("detcnt", String.valueOf(user.getDetcnt()));  
            user1.put("vdetcnt", String.valueOf(user.getVDetcnt()));  
            user1.put("sotcnt", String.valueOf(user.getSotcnt()));
            user1.put("motcnt", String.valueOf(user.getMotcnt()));
            jsonA.add(user1);
        } catch (Exception e) {
        	log.info(e.getMessage());
        }
        return jsonA;
    }
	
	/**
     * 修改用户
     * 
     * @param user
     * @return
     */
	@ResponseBody
    @RequestMapping(value = "/user/editUser",method = RequestMethod.POST)
    public Json editUser(User user) {
        Json j = new Json();
        try {
            userService.edit(user);
            j.setSuccess(true);
            j.setMsg("Edit user success!");
            j.setObj(user);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }
	
	/**
	 * 删除某个用户
	 * @param userId
	 * @param out
	 */
	@ResponseBody
	@RequestMapping(value = "/user/deleteUser",method = RequestMethod.POST)
	public Json deleteUser(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam Integer id) {
		Json j = new Json();
        try {
			userService.deleteUser(id);
			j.setSuccess(true);
	        j.setMsg("Delete user success！");
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/sendEmail",method = RequestMethod.POST)
	public Json regEmail(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam String username,
    		@RequestParam int flag) {
		Json j = new Json();
		User user = new User();
		user = userService.findUserByName(username);                 
		try {
			SendEmailUtil.sendEmail(user.getEmail(), flag, username, user.getPassword());
			j.setSuccess(true);
			j.setMsg("Confirm Email Send Done.");
		} catch(Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
}
