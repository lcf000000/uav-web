var username_ok = false;
var nameOnly_ok = false;
var password_ok = false;
var rePassword_ok = false;
var realname_ok = false;
var email_ok = false;
var org_ok = false;
var country_ok = false;
var i = 3; 
function checkUsername(username){
        //验证用户名的输入格式  
        username_ok=checkField(username, /^[a-zA-Z0-9_]{6,20}$/, "Username can not be empty!", "The username can only be composed of letters and numbers and must be between six and twenty!");  
        //用户名的格式正确的条件成立则验证用户名是否唯一  
        if(username_ok){  
        	nameOnly(username);
        }
        enableSubmit();
        return username_ok&&nameOnly_ok;  
}  
//验证用户名是否唯一  
function nameOnly(username){
	$.ajax({
        url: ctx+"/user/checkUsername",//提交地址
        type:"POST",
        dataType:"json",
        data:{"username" : username.value},
        success:function(result){
        	if(result.success){
        		toastr.success(result.msg);
        		nameOnly_ok = true;
        		enableSubmit();
        		return nameOnly_ok;
        	}else{
        		toastr.error(result.msg);
        		nameOnly_ok = false;
        		enableSubmit();
        		return nameOnly_ok;
        	}
        }
    });
}
/*  
 *password check
 */  
function checkPassword(password){  
        password_ok=checkField(password,/^[a-zA-Z0-9]{6,20}$/,"Password can not be empty!","The password can only be composed of letters and numbers and must be between six and twenty!");
        enableSubmit();
        return password_ok;
}
/*
 * re-password check
 */
function checkRePassword(rePassword){
	var rv=rePassword.value.replace(/(^\s+)|(\s+$)/g,"");
	var password = $("#password").val();
	if(password.length==0){
		toastr.error("Re-Password can not be empty!");
	}else{
		if(password == rePassword.value){
			rePassword_ok = true;
			enableSubmit();
			return rePassword_ok;
		}else{
			toastr.error("The passwords entered twice are not the same!");
			rePassword_ok = false;
			enableSubmit();
			return rePassword_ok;
		}
	}
	enableSubmit();
}
/*
 * real name check
 */
function checkRealname(realname){
    realname_ok=checkField(realname,/^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/,"Realname can not be empty!","Please enter the correct name!");  
    enableSubmit();
    return realname_ok;
}
/*
 * email check
 */
function checkEmail(email){
    email_ok=checkField(email,/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,"Email can not be empty!","The format of the email address is incorrect!");  
    enableSubmit();
    return email_ok;
}
/*
 * org check
 */
function checkOrg(org){
    org_ok=checkField(org,/^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/,"Organization can not be empty!","Please enter the correct organization!");  
    enableSubmit();
    return org_ok;
}
/*
 * country check
 */
function checkCountry(country){
    country_ok=checkField(country,/^[A-Za-z0-9]{1,5}$/,"Country can not be empty!","Please enter the country code, as 'CN,US...'!");  
    enableSubmit();
    return country_ok;
}

function fun() {
	if (i == 0) { 
		window.location.href = ctx + "/views/login"; 
		clearInterval(intervalid); 
	}
	i--;
}
function backReg(){
	window.location.href = ctx + "/views/index"; 
}
function enableSubmit(){
	var submit = document.getElementById('submitReg');
	if(username_ok && nameOnly_ok && password_ok&& rePassword_ok && realname_ok && email_ok && org_ok && country_ok){
		submit.removeAttribute("disabled");
	}else{
		submit.setAttribute("disabled","disabled");
	}
}
function subReg(){
	if(username_ok && nameOnly_ok && password_ok&& rePassword_ok && realname_ok && email_ok && org_ok && country_ok){
		var submit = document.getElementById('submitReg');
		submit.removeAttribute("disabled");
		$.ajax({
	        url: ctx+"/user/addUser",//提交地址
	        type:"POST",
	        dataType:"json",
	        data:$("#register_form").serialize(),//将表单数据序列化,
	        success:function(result){
	        	if(result.success){
	        		toastr.success("Register successfully, jump after 3 seconds......");
	        		var intervalid;
	        		intervalid = setInterval("fun()", 1000);
	        	}else{
	        		toastr.error("Registration failed, please re-register");
	        	}
	        }
	    });
	}else{
		toastr.error("Check your information");
	}
}