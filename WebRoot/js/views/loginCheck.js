var username_ok = false;
var code_ok = false;
var password_ok = false;
$(document).ready(function(){
	if("${sessionScope.message}"!=""){
		toastr.error("${sessionScope.message}");
	}
	changeCode();
	$("#codeImg").bind("click",changeCode);
});
function genTimestamp(){
	var time = new Date();
	return time.getTime();
}
function changeCode(){
	$("#codeImg").attr("src",ctx + "/code?t="+genTimestamp());
}
function backReg(){
	window.location.href = ctx + "/views/index"; 
}
/*  
 *user name check
 */  
function checkUsername(username){
    username_ok=checkField(username, /^[a-zA-Z0-9_]{6,20}$/, "Username can not be empty!", "The username can only be composed of letters and numbers and must be between six and twenty!");
    enableSubmit();
    return username_ok
}
/*
 *password check
 */  
function checkPassword(password){  
    password_ok=checkField(password, /^[a-zA-Z0-9]{6,20}$/,"Password can not be empty!","The password can only be composed of letters and numbers and must be between six and twenty!");
    enableSubmit();
    return password_ok;
}
function checkCode(code){
	var codeVal = code.value;
    if(codeVal.length != 4){
    	toastr.error("Verification code error!");
    	code_ok = false;
    	enableSubmit();
    	return code_ok;
    }else{
    	code_ok = true;
    	enableSubmit();
    	return code_ok;
    }
}
function enableSubmit(){
	var submit = document.getElementById('loginSubmit');
	if(username_ok && password_ok && code_ok){
		submit.removeAttribute("disabled");
	}else{
		submit.setAttribute("disabled","disabled");
	}
}
function submitLogin(){
	var submit = document.getElementById('loginSubmit');
	if(username_ok && password_ok && code_ok){
		submit.removeAttribute("disabled");
	}else{
		toastr.error("Check your information");
	}
}