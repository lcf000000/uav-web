$(document).ready(function(){
				getInfo();
		    });
			function getInfo(){
				$.ajax({
			        url:ctx+"/info/getInfoByLoc",//提交地址
			        type:"POST",
			        data:{"location":"1"},
			        dataType:"json",
			        success:function(info){
			        	document.getElementById("show-info").innerHTML = info.content1;
			        }
});}