function loginOut(){
	$.ajax({
        url:ctx+"/user/loginout",//提交地址
        type:"POST",
        success:function(){
        	window.location.href = ctx + "/views/index"; 
        }
    });
	
}