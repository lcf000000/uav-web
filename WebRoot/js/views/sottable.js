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
            	d.username = "";
            	d.trackername = "";
            }
        },
        "lengthChange" : true,//是否允许用户改变表格每页显示的记录数  
        "ordering" : false,//是否允许用户排序  
        "processing" : true,//是否显示处理状态 
        "scrollX": true,//允许水平滚动 
        "scrollY": "500px", 
        "scrollCollapse": true, 
        "searching" : false,//是否开始本地搜索  
        "stateSave" : false,//刷新时是否保存状态  
        "autoWidth" : false,//自动计算宽度  
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

$(document).ready(function() {
	sotres_table = $('#dataTables-sotres').dataTable(datatables_options);
});