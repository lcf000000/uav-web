var E = window.wangEditor;
var adder = new E('#adder');
var editor = new E('#editor');
adder.customConfig.uploadFileName = 'file';
adder.customConfig.uploadImgServer = ctx + '/upload/img';
adder.customConfig.uploadImgMaxSize = 20 * 1024 * 1024;//设置图片大小为20M
editor.customConfig.uploadFileName = 'file';
editor.customConfig.uploadImgServer = ctx + '/upload/img';
editor.customConfig.uploadImgMaxSize = 20 * 1024 * 1024;
adder.customConfig.uploadImgHooks = {
	 customInsert: function (insertImg, result, adder) {
	        // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
        // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
        // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
		
        var url = result.data
        insertImg(url)
        // result 必须是一个 JSON 格式字符串！！！否则报错
	 }
};
editor.customConfig.uploadImgHooks = {
	 customInsert: function (insertImg, result, editor) {
	        var url = result.data
	        insertImg(url)
	 }
};
adder.create();
editor.create();
E.fullscreen.init('#editor');
E.fullscreen.init('#adder');
var info_table;
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
        "url" : ctx+"/info/tabledata",
        "type" : "POST",  
        //dataSrc : "list",//这个参数是自己封装的json里面的key
        "data" :  function ( d ) {
        	var param = getSearchVal();
        	d.location = param.location;
        	d.comment = param.comment;
        	d.title = param.title;
        	d.author = param.author;
        	d.datetime = param.datetime;
        	d.content1 = param.content1;
        	d.content2 = param.content2;
        	d.content3 = param.content3;
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
    	{"data" : "title"},
    	{"data" : "author"},
    	{"data" : "location"},
    	{"data" : "datetime"},
    	{"data" : "comment"}
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
   "timeOut" : "5000",//展现时间
   "extendedTimeOut" : "1000",//加长展示时间
   "showEasing" : "swing",//显示时的动画缓冲方式
   "hideEasing" : "linear",//消失时的动画缓冲方式
   "showMethod" : "fadeIn",//显示时的动画方式
   "hideMethod" : "fadeOut" //消失时的动画方式
};
toastr.options = messageOpts;
function search(){
	//搜索后重新加载
	info_table.fnReloadAjax(); 
}
function getSearchVal(){
	//获取搜索的条件
	var param = {};
	param.comment = $("#comment-search").val();
	param.title = $("#title-search").val();
	param.author = $("#author-search").val();
	param.datetime = $("#date-search").val();
	param.content1 = $("#content-search").val();
	param.content2 = $("#content-search").val();
	param.content3 = $("#content-search").val();
	param.location = $("#loc-search").val();
	return param;
}
function removeSearchVal(){
	$("#search-input :input").each(function () {  
        $(this).val("");  
    });
	$("#search-input :select").each(function () {  
        $(this).val("");  
    });
}
function addInfo(){
	document.getElementById('loc-add').value = "";
	$('#edit-panel').hide();
	$('#search-panel').hide();
	$('#add-panel').show();
}
function submitAdd(){
	if($("#loc-add").val()==null){
		toastr.error("Please select location!");
	}else{
	    $.ajax({
	        url:ctx+"/info/addInfo",//提交地址
	        data:{	
	        	"content1":adder.txt.html(),
        		"title":$("#title-add").val(),
        		"author":$("#author-add").val(),
        		"comment":$("#comment-add").val(),
        		"location":$("#loc-add").val(),
        	},
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
		setTimeout("info_table.fnReloadAjax();",500);
	}
}
function cancelAdd(){
	$('#add-panel').hide();
	$('#search-panel').show();
}
function editInfo(){
	//进入编辑面板，隐藏搜索面板
	var nTrs = info_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
	var flag = 0
	var t = null
    for ( var i = 0; i < nTrs.length; i++) {
        if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
        	flag = 1;
	        t = info_table.fnGetData(nTrs[i]);
        }
    }
	if(flag == 1){
		$('#add-panel').hide();
    	$('#search-panel').hide();
		$('#edit-panel').show();
		$.ajax({
	        url:ctx+"/info/getInfoById",//提交地址
	        data:{"id":t.id},
	        type:"POST",
	        dataType:"json",
	        success:function(info){
	        	document.getElementById('id-edit').value = info.id;
	        	document.getElementById('title-edit').value = info.title;
	        	document.getElementById('comment-edit').value = info.comment;
	        	document.getElementById('loc-edit').value = info.location;
	        	document.getElementById('id-edit').value = info.id;
	        	editor.txt.html(info.content1);
	        }
	    });
    }else{
    	alert("Please choose one !");
    }
};
function saveEdit(){
	if($("#loc-edit").val()==null){
		toastr.error("Please select location!");
	}else{
		$.ajax({
	        url:ctx+"/info/editInfo",//提交地址
	        data:{	"content1":editor.txt.html(),
	        		"id":$("#id-edit").val(),
	        		"title":$("#title-edit").val(),
	        		"author":$("#author-edit").val(),
	        		"comment":$("#comment-edit").val(),
	        		"location":$("#loc-edit").val(),
	        	},
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
		setTimeout("info_table.fnReloadAjax();",500);
	}
}
function cancelEdit(){
	$('#edit-panel').hide();
	$('#search-panel').show();
}
function removeInfo(){
	var nTrs = info_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
    for ( var i = 0; i < nTrs.length; i++) {
        if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
	        var t = info_table.fnGetData(nTrs[i]);
	        $.ajax({
		        url:ctx+"/info/deleteInfo",//提交地址
		        data: {"id" : t.id},
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
    setTimeout("info_table.fnReloadAjax();",500);
}
$(document).ready(function() {
	$('#edit-panel').hide();
	$('#add-panel').hide();
	info_table = $('#dataTables-info').dataTable(datatables_options);
});