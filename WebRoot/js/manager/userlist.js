var user_table;
var datatables_options = {
		"responsive": true,
        "serverSide" : true,//开启服务器模式:启用服务器分页
        "paging" : true,//是否分页
        "pagingType" : "full_numbers",//除首页、上一页、下一页、末页四个按钮还有页数按钮
        "select" : true,
        /* "buttons" : [
                  {
                      "extend" : "selected",
                      "text" : "Count selected rows",
                      "action" : function ( e, dt, button, config ) {
                          alert( dt.rows( { selected: true } ).indexes().length +' row(s) selected' );
                      }
                  }
          		], */
        "ajax" : {  
            "url" : ctx + "/user/tabledata",
            "type" : "POST",  
            //dataSrc : "list",//这个参数是自己封装的json里面的key
            "data" :  function ( d ) {
            	var param = getSearchVal();
            	d.username = param.username;
            	d.realname = param.realname;
            	d.email = param.email;
            	d.country = param.country;
            	d.org = param.org;
            	d.right = param.right;
            }
        },
        "lengthChange" : true,//是否允许用户改变表格每页显示的记录数  
        "ordering" : false,//是否允许用户排序  
        "processing" : true,//是否显示处理状态 
        //scrollX: true,//允许水平滚动 
        //scrollY: "200px", 
        //scrollCollapse: true, 
        "searching" : false,//是否开始本地搜索  
        "stateSave" : false,//刷新时是否保存状态  
        "autoWidth" : true,//自动计算宽度  
        //deferRender : true,//延迟渲染  
        "columns" : [
        	{"data" : "id"},
        	{"data" : "username"},
        	{"data" : "password"},
        	{"data" : "realname"},
        	{"data" : "right"},
        	{"data" : "email"},
        	{"data" : "country"},
        	{"data" : "regtime"},
        	{"data" : "org"},
        ]
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
function search(){
	//搜索后重新加载
	user_table.fnReloadAjax(); 
}
function getSearchVal(){
	//获取搜索的条件
	var param = {};
	param.username = $("#username-search").val();
	param.realname = $("#realname-search").val();
	param.email = $("#email-search").val();
	param.country = $("#country-search").val();
	param.org = $("#org-search").val();
	param.right = $("#right-search").val();
	return param;
}
function removeSearchVal(){
	$("#search-input :input").each(function () {  
        $(this).val("");  
    });
	$("#search-input :select").each(function () {  
        $(this).val("1");  
    });
}
function addUser(){
	$('#edit-panel').hide();
	$('#search-panel').hide();
	$('#add-panel').show();
}
function submitAdd(){
	$.ajax({
        url:ctx + "/user/addUser",//提交地址
        data:$("#addUser-form").serialize(),//将表单数据序列化
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
	removeSearchVal();
	setTimeout("user_table.fnReloadAjax();",500);
}
function cancelAdd(){
	$('#add-panel').hide();
	$('#search-panel').show();
}
function editUser(){
	//进入编辑面板，隐藏搜索面板
	var nTrs = user_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
	var flag = 0
    for ( var i = 0; i < nTrs.length; i++) {
        if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
        	flag = 1;
	        var t = user_table.fnGetData(nTrs[i]);
        }
    }
	if(flag == 1){
		$('#add-panel').hide();
    	$('#search-panel').hide();
		$('#edit-panel').show();
		document.getElementById('id-edit').value = t.id;
		document.getElementById('username-edit').value = t.username;
		document.getElementById('password-edit').value = t.password;
		document.getElementById('realname-edit').value = t.realname;
		document.getElementById('org-edit').value = t.org;
		document.getElementById('email-edit').value = t.email;
		document.getElementById('country-edit').value = t.country;
		document.getElementById('right-edit').value = t.right;
    }else{
    	alert("Please choose one !");
    }
};
function saveEdit(){
	$.ajax({
        url:ctx + "/user/editUser",//提交地址
        data:$("#editUser-form").serialize(),//将表单数据序列化
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
	setTimeout("user_table.fnReloadAjax();",500);
}
function cancelEdit(){
	$('#edit-panel').hide();
	$('#search-panel').show();
}
function removeUser(){
	var nTrs = user_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
    for ( var i = 0; i < nTrs.length; i++) {
        if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
	        var t = user_table.fnGetData(nTrs[i]);
	        $.ajax({
		        url:ctx + "/user/deleteUser",//提交地址
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
    setTimeout("user_table.fnReloadAjax();",500);
}
$(document).ready(function() {
	$('#edit-panel').hide();
	$('#add-panel').hide();
	user_table = $('#dataTables-user').dataTable(datatables_options);
});