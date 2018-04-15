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
var name_ok = false;
var language_ok = false;
var enviroment_ok = false;
var results_ok = false;
var description_ok = false;
var sotcnt = 0;
function checkName(trackername){
	var name = trackername.value;
    if(name.length == 0){
    	toastr.error("Please fill in tracker name!");
    	name_ok = false;
    }else{
    	name_ok = true;
    }
    enableSubmit();
    return name_ok;
}
function checkLang(language){
	var languageVal = language.value;
    if(languageVal.length == 0){
    	toastr.error("Please fill in language!");
    	language_ok = false;
    }else{
    	language_ok = true;
    }
    enableSubmit();
    return language_ok;
}
function checkEnviroment(input){
	var inputVal = input.value;
    if(inputVal.length == 0){
    	toastr.error("Please fill in the complete enviroment!");
    	enviroment_ok = false;
    }else{
    	enviroment_ok = true;
    }
    enableSubmit();
    return enviroment_ok;
}
function checkResFile(results){
	var resultsVal = results.value;
	if(resultsVal.length != 0){
		var index = resultsVal.lastIndexOf(".");
		var ext = resultsVal.substr(index+1);
		if(ext == "zip"){
			results_ok = true;
		}else{
			results_ok = false;
			toastr.error("Please upload 'zip' format results file!");
		}
	}
	enableSubmit();
}
function checkDesFile(descrip){
	var descripVal = descrip.value;
	if(descripVal.length != 0){
		var index = descripVal.lastIndexOf(".");
		var ext = descripVal.substr(index+1);
		if(ext == "doc" || ext == "pdf" ||ext == "docx"){
			description_ok = true;
		}else{
			description_ok = false;
			toastr.error("Please upload 'pdf','doc' or 'docx' format file!");
		}
	}
	enableSubmit();
}
function enableSubmit(){
	var submit = document.getElementById('submitSot');
	if(name_ok && language_ok && enviroment_ok && description_ok && results_ok){
		submit.removeAttribute("disabled");
	}else{
		submit.setAttribute("disabled","disabled");
	}
}
var i= 3;
function fun() {
	if (i == 0) { 
		window.location.href = ctx + "/views/index"; 
		clearInterval(intervalid); 
	}
	i--;
}
function subtSot(){
	var submit = document.getElementById('submitSot');
	if(sotcnt>0){
		if(name_ok && language_ok && enviroment_ok && description_ok && results_ok){
			submit.removeAttribute("disabled");
			var formData = new FormData($("#sotSubmit_form")[0]);
			var trackerName = document.getElementById('trackerName');
			toastr.success("Uploading... Please stay on this page until you are prompted to jump");
			if(trackerName.hasOwnProperty('readonly')){
				$.ajax({
			        url: ctx+"/sotres/updateSotbyId",//提交地址
			        type:"POST",
			        dataType:"json",
			        data:formData,//将表单数据序列化,
			        contentType: false, //必须
			        processData: false, //必须
			        success:function(result){
			        	if(result.success){
			        		toastr.success("Update successfully, jump after 3 seconds......");
			        		$.ajax({
			        			  type: 'POST',
			        			  url: ctx+"/user/sendEmail",
			        			  data: {username: $("#username").val(), flag:2},
			        		});
			        		var intervalid;
			        		intervalid = setInterval("fun()", 1000);
			        	}else{
			        		toastr.error("Update failed, please re-update or contact us!");
			        	}
			        }
			    });
			}else{
				$.ajax({
			        url: ctx+"/sotres/addres",//提交地址
			        type:"POST",
			        dataType:"json",
			        data:formData,//将表单数据序列化,
			        contentType: false, //必须
			        processData: false, //必须
			        success:function(result){
			        	if(result.success){
			        		toastr.success("Submit successfully, jump after 3 seconds......");
			        		$.ajax({
			        			  type: 'POST',
			        			  url: ctx+"/user/sendEmail",
			        			  data: {username: $("#username").val(), flag:2},
			        		});
			        		var intervalid;
			        		intervalid = setInterval("fun()", 1000);
			        	}else{
			        		toastr.error("Submit failed, please re-submit or contact us!");
			        	}
			        }
			    });
			}
		}else{
			toastr.error("Check your submission");
		}
	}else{
		toastr.error("Your submission has been exhausted!");
	}
}
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
$(document).ready(function(){
	$.ajax({
        url:ctx+"/user/findUserById",//提交地址
        type:"POST",
        data:{"user_id":$("#user_id").val()},
        dataType:"json",
        async:false,
        success:function(data){
        	sotcnt = parseInt(data[0].sotcnt);
        	document.getElementById('sot').innerHTML = sotcnt;
        	if(sotcnt<=0){
        		toastr.error("Your submission has been exhausted!");
        	}
        }
    });
	var sotid = GetQueryString("sotid");
	var sotname = GetQueryString("sotname");
	var trackerName = document.getElementById('trackerName');
	if(sotid!=null&&sotname!=null){
		trackerName.value = sotname;
		trackerName.setAttribute("readonly","readonly");
	}else{
		trackerName.removeAttribute("readonly");
	}
});