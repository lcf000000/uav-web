var i=3;
var intervalid;
var messageOpts = {
   "closeButton" : true,//是否显示关闭按钮
   "debug" : false,//是否使用debug模式
   "positionClass" : "toast-top-center",//弹出窗的位置
   "onclick" : null,
   "showDuration" : "300",//显示的动画时间
   "hideDuration" : "1000",//消失的动画时间
   "timeOut" : "5000",//展现时间
   "extendedTimeOut" : "1000",//加长展示时间
   "showEasing" : "swing",//显示时的动画缓冲方式
   "hideEasing" : "linear",//消失时的动画缓冲方式
   "showMethod" : "fadeIn",//显示时的动画方式
   "hideMethod" : "fadeOut" //消失时的动画方式
};
toastr.options = messageOpts;
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
function fun() { 
	if (i == 0) { 
	window.location.href = ctx + "/views/login"; 
	clearInterval(intervalid); 
	} 
	document.getElementById("time").innerHTML = "Redirecting  " + i.toString() +" S..."; 
	i--; 
} 
$(document).ready(function(){
	var userId = GetQueryString("id");
	var checkCode = GetQueryString("checkCode");
	if(user_id!=null&&checkCode!=null){
		$.ajax({
	        url:ctx+"/user/activateAcount",
	        type:"POST",
	        data:{"userId" : userId,
	        	  "checkCode" : checkCode},
	        dataType:"json",
	        async:false,
	        success:function(result){
	        	if(result.success){
	        		toastr.success("Your account is activated, please login...!");
	        		intervalid = setInterval("fun()", 1000);
	        	}else{
	        		toastr.error("Your verification code is wrong!");
	        	}
	        }
	    });
	}else{
		window.location.href = ctx + "/views/index";
	}
});