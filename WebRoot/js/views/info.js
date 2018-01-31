function getInfo(param){
	$.ajax({
        url:ctx+"/info/getInfoByLoc",//提交地址
        type:"POST",
        data:{"location":param},
        dataType:"json",
        success:function(info){
        	document.getElementById("show-info").innerHTML = info.content1;
        }
    });
}
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
$(document).ready(function(){
	var param = GetQueryString("loc");
	getInfo(param);
});