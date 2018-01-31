var iSot_table;
var iSot_table_options = {
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
            "url" : ctx + "/sotres/tabledata",
            "type" : "POST",  
            //dataSrc : "list",//这个参数是自己封装的json里面的key
            "data" :  function ( d ) {
            	d.user_id = $("#user_id").val();
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
        	{"data" : "id" , "visible": false},
        	{"data" : "name"},
        	{"data" : "date"},
        	{"data" : "arc"},
        	{"data" : "bc"},
        	{"data" : "cm"},
        	{"data" : "foc"},
        	{"data" : "iv"},
        	{"data" : "lr"},
        	{"data" : "ov"},
        	{"data" : "ov"},
        	{"data" : "ov"},
        	{"data" : "ov"},
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
	iSot_table.fnReloadAjax(); 
}
function addIsot(){
	
}
function editIsot(){
	var nTrs = iSot_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
	var flag = 0
	var indx = 0
    for ( ; indx < nTrs.length; indx++) {
        if($(nTrs[indx]).hasClass('selected')){//相当于$(tr)
        	flag = 1;
	        var t = iSot_table.fnGetData(nTrs[indx]);
        }
    }
	if(flag == 1){ 
		//此处拿到隐藏列的id  
		var id = $('#dataTables-isot').DataTable().row(indx).data().id;
		window.location.href = ctx + "/user/submitSot?sotid=" + id; 
    }else{
    	alert("Please choose one !");
    }
};
function removeIsot(){
	var nTrs = iSot_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
    for ( var i = 0; i < nTrs.length; i++) {
        if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
	        var t = iSot_table.fnGetData(nTrs[i]);
	        $.ajax({
		        url:ctx + "/sotres/deleteIsot",//提交地址
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
    setTimeout("iSot_table.fnReloadAjax();",500);
}
$(document).ready(function() {
	iSot_table = $('#dataTables-isot').dataTable(iSot_table_options);
});