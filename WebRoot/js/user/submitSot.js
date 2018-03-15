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
var description_ok = true;
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
function submitLogin(){
	var submit = document.getElementById('submitSot');
	if(name_ok && language_ok && enviroment_ok && description_ok && results_ok){
		submit.removeAttribute("disabled");
	}else{
		toastr.error("Check your submission");
	}
}