function loginOut(){
	$.ajax({
        url:ctx+"/manager/loginout",//提交地址
        type:"POST",
        success:function(){
        	window.location.href = ctx + "/manage/admin-login"; 
        }
    });
}