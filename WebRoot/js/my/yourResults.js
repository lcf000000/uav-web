var chose_det = document.getElementById('chose_det');
var chose_vdet = document.getElementById('chose_vdet');
var chose_sot = document.getElementById('chose_sot');
var chose_mot = document.getElementById('chose_mot');
var chose_your = document.getElementById('chose_your');
var password_ok = false;
var rePassword_ok = false;
function showDet(){
	chose_vdet.removeAttribute("class");
	chose_sot.removeAttribute("class");
	chose_mot.removeAttribute("class");
	chose_your.removeAttribute("class");
	chose_det.setAttribute("class","active");
	$('#tab-vdet').hide();
	$('#tab-sot').hide();
	$('#tab-mot').hide();
	$('#tab-det').show();
}
function showVdet(){
	chose_det.removeAttribute("class");
	chose_sot.removeAttribute("class");
	chose_mot.removeAttribute("class");
	chose_your.removeAttribute("class");
	chose_vdet.setAttribute("class","active");
	$('#tab-det').hide();
	$('#tab-sot').hide();
	$('#tab-mot').hide();
	$('#tab-your').hide();
	$('#tab-vdet').show();
}
function showSot(){
	chose_det.removeAttribute("class");
	chose_vdet.removeAttribute("class");
	chose_mot.removeAttribute("class");
	chose_your.removeAttribute("class");
	chose_sot.setAttribute("class","active");
	$('#tab-det').hide();
	$('#tab-vdet').hide();
	$('#tab-mot').hide();
	$('#tab-your').hide();
	$('#tab-sot').show();
	iSot_table.fnReloadAjax();
}
function showMot(){
	chose_det.removeAttribute("class");
	chose_vdet.removeAttribute("class");
	chose_sot.removeAttribute("class");
	chose_your.removeAttribute("class");
	chose_mot.setAttribute("class","active");
	$('#tab-det').hide();
	$('#tab-sot').hide();
	$('#tab-your').hide();
	$('#tab-mot').show();
	
}
function showYour(){
	chose_det.removeAttribute("class");
	chose_vdet.removeAttribute("class");
	chose_mot.removeAttribute("class");
	chose_sot.removeAttribute("class");
	chose_your.setAttribute("class","active");
	$('#tab-det').hide();
	$('#tab-vdet').hide();
	$('#tab-mot').hide();
	$('#tab-sot').hide();
	$('#tab-your').show();
}
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
* Sot Tab
*/
var iSot_table;
var iSot_table_options = {
		"responsive": true,
        "serverSide" : true,//开启服务器模式:启用服务器分页
        "paging" : true,//是否分页
        "pagingType" : "full_numbers",//除首页、上一页、下一页、末页四个按钮还有页数按钮
        "select" : true,
        "ajax" : {  
            "url" : ctx + "/sotres/tabledata",
            "type" : "POST",  
            //dataSrc : "list",//这个参数是自己封装的json里面的key
            "data" :  function ( d ) {
            	d.userID = $("#user_id").val();
            }
        },
        "lengthChange" : false,//是否允许用户改变表格每页显示的记录数  
        "ordering" : false,//是否允许用户排序  
        "processing" : true,//是否显示处理状态 
        "scrollX": true,//允许水平滚动 
        //"scrollCollapse": true, 
        "searching" : false,//是否开始本地搜索  
        "stateSave" : false,//刷新时是否保存状态  
        "autoWidth" : true,//自动计算宽度  
        //deferRender : true,//延迟渲染  
        "columns" : [
        	{"data" : "id" , "visible": false},
        	{"data" : "name"},
        	{"data" : "date"},
        	{"data" : "overall_p"},
        	{"data" : "overall_iou"},
        	{"data" : "speed"},
        	{"data" : "arc_p"},
        	{"data" : "bc_p"},
        	{"data" : "cm_p"},
        	{"data" : "fm_p"},
        	{"data" : "foc_p"},
        	{"data" : "iv_p"},
        	{"data" : "lr_p"},
        	{"data" : "ov_p"},
        	{"data" : "poc_p"},
        	{"data" : "sob_p"},
        	{"data" : "sv_p"},
        	{"data" : "vc_p"},
        	{"data" : "arc_iou"},
        	{"data" : "bc_iou"},
        	{"data" : "cm_iou"},
        	{"data" : "fm_iou"},
        	{"data" : "foc_iou"},
        	{"data" : "iv_iou"},
        	{"data" : "lr_iou"},
        	{"data" : "ov_iou"},
        	{"data" : "poc_iou"},
        	{"data" : "sob_iou"},
        	{"data" : "sv_iou"},
        	{"data" : "vc_iou"},
        	{"data" : "language"},
        	{"data" : "environment"},
        	{"data" : "reference"}
        ]
}
function addIsot(){
	window.location.href = ctx + "/my/submitSot"; 
}
function updateIsot(){
	var nTrs = iSot_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
	var flag = 0
    for (var indx = 0; indx < nTrs.length; indx++) {
        if($(nTrs[indx]).hasClass('selected')){//相当于$(tr)
        	flag = 1;
	        var t = iSot_table.fnGetData(nTrs[indx]);
	        window.location.href = ctx + "/my/submitSot?sotid=" + t.id + "&sotname=" + t.name; 
        }
    }
	if(flag == 0){ 
    	alert("Please choose one !");
    }
};
function removeIsot(){
	var nTrs = iSot_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
	var flag = 0
    for ( var i = 0; i < nTrs.length; i++) {
        if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
	        var t = iSot_table.fnGetData(nTrs[i]);
	        $.ajax({
		        url:ctx + "/sotres/delSotbyId",//提交地址
		        data: {"id" : t.id},//将表单数据序列化
		        type:"POST",
		        dataType:"json",
		        success:function(result){
		        	if(result.success){
		        		toastr.success(result.msg);
		        	}else{
		        		toastr.error("Error!");
		        	}
		        }
		    });
        }
    }
    if(flag == 0){ 
    	alert("Please choose one !");
    }
    setTimeout("iSot_table.fnReloadAjax();",500);
}

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
function enableSubmit(){
	var submit = document.getElementById('changeSubmit');
	if(password_ok&& rePassword_ok){
		submit.removeAttribute("disabled");
	}else{
		submit.setAttribute("disabled","disabled");
	}
}
function submitChange(){
	if(password_ok&& rePassword_ok){
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
$(document).ready(function() {
	iSot_table = $('#dataTables-isot').dataTable(iSot_table_options);
	showDet();	
});