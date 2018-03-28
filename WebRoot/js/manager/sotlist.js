function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="5" border="0" style="padding-left:50px;">'+
        '<tr>'+
	        '<td>Environment:&nbsp&nbsp&nbsp&nbsp</td>'+
	        '<td>'+d.environment+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Reference:&nbsp&nbsp</td>'+
            '<td>'+d.reference+'</td>'+
        '</tr>'+
    '</table>';
}
var sotres_table;
var datatables_options = {
		"responsive": false,
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
		    	var param = getSearchVal();
		    	d.username = param.username;
		    	d.name = param.trackername;
		    }
		},
		"lengthChange" : true,//是否允许用户改变表格每页显示的记录数  
		"ordering" : false,//是否允许用户排序  
		"processing" : true,//是否显示处理状态 
		"scrollX": true,//允许水平滚动 
		"scrollY": "800px", 
		"scrollCollapse": true, 
		"searching" : false,//是否开始本地搜索  
		"stateSave" : false,//刷新时是否保存状态  
		"autoWidth" : false,//自动计算宽度  
		//deferRender : true,//延迟渲染  
        "columns" : [
        	{
                "class":          'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },
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
        	{"data" : "language"}
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
	sotres_table.fnReloadAjax(); 
}
function getSearchVal(){
	//获取搜索的条件
	var param = {};
	param.username = $("#username-search").val();
	param.trackername = $("#trackername-search").val();
	return param;
}
function removeSearchVal(){
	$("#search-input :input").each(function () {  
        $(this).val("");
    });
}
function removeSot(){
	var nTrs = sotres_table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
    for ( var i = 0; i < nTrs.length; i++) {
        if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
	        var t = sotres_table.fnGetData(nTrs[i]);
	        $.ajax({
		        url:ctx + "/sotres/delSotById",//提交地址
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
    setTimeout("sotres_table.fnReloadAjax();",500);
}
$(document).ready(function() {
	sotres_table = $('#dataTables-sotres').dataTable(datatables_options);
	$('#dataTables-sotres tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = sotres_table.api().row(tr);	
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );
});