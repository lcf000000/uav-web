var password_ok = false;
var rePassword_ok = false;
var email_ok = false;
var org_ok = false;
var country_ok = false;
//设置显示配置
var messageOpts = {
   "closeButton" : true,//是否显示关闭按钮
   "debug" : false,//是否使用debug模式
   "positionClass" : "toast-top-center",//弹出窗的位置
   "onclick" : null,
   "showDuration" : "300",//显示的动画时间
   "hideDuration" : "1000",//消失的动画时间
   "timeOut" : "6000",//展现时间
   "extendedTimeOut" : "1000",//加长展示时间
   "showEasing" : "swing",//显示时的动画缓冲方式
   "hideEasing" : "linear",//消失时的动画缓冲方式
   "showMethod" : "fadeIn",//显示时的动画方式
   "hideMethod" : "fadeOut" //消失时的动画方式
};
toastr.options = messageOpts;
/*
* Your Information Tab
*/
var i= 3;
function fun() {
	if (i == 0) { 
		window.location.href = ctx + "/views/login"; 
		clearInterval(intervalid); 
	}
	i--;
}
function checkPassword(password){  
    password_ok=checkField(password,/^[a-zA-Z0-9]{6,20}$/,"Password can not be empty!","The password can only be composed of letters and numbers and must be between six and twenty!");
    enableSubmit();
    return password_ok;
}
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
function enableSubmit(){
	var submit = document.getElementById('changeSubmit');
	if(password_ok&& rePassword_ok&& email_ok && org_ok && country_ok){
		submit.removeAttribute("disabled");
	}else{
		submit.setAttribute("disabled","disabled");
	}
}
function submitChange(){
	if(password_ok&& rePassword_ok&& email_ok && org_ok && country_ok){
		var submit = document.getElementById('changeSubmit');
		submit.removeAttribute("disabled");
		$.ajax({
	        url: ctx+"/user/editUser",//提交地址
	        type:"POST",
	        dataType:"json",
	        data:$("#changePass_form").serialize(),//将表单数据序列化,
	        success:function(result){
	        	if(result.success){
	        		toastr.success("Change successfully, jump after 3 seconds......");
	        		var intervalid;
	        		intervalid = setInterval("fun()", 1000);
	        	}else{
	        		toastr.error("Change failed, please re-change or contact us!");
	        	}
	        }
	    });
	}else{
		toastr.error("Check your information");
	}
}