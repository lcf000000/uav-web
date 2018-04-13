function subDet(){
	window.location.href = ctx + "/my/submitDet";
}
function subVdet(){
	window.location.href = ctx + "/my/submitVdet";
}
function subSot(){
	window.location.href = ctx + "/my/submitSot";
}
function subMot(){
	window.location.href = ctx + "/my/submitMot";
}
function IntoMy(){
	window.location.href = ctx + "/my/myInfo";
}
$(document).ready(function(){
	var detcnt = 0;
	var vdetcnt = 0;
	var sotcnt = 0;
	var motcnt = 0;
	$.ajax({
        url:ctx+"/user/findUserById",//提交地址
        type:"POST",
        data:{"user_id":$("#user_id").val()},
        dataType:"json",
        success:function(data){
        	detcnt = parseInt(data[0].detcnt);
        	vdetcnt = parseInt( data[0].vdetcnt);
        	sotcnt =  parseInt(data[0].sotcnt);
        	motcnt =  parseInt(data[0].motcnt);
        	document.getElementById('det').innerHTML = detcnt;
        	document.getElementById('vdet').innerHTML = vdetcnt;
        	document.getElementById('sot').innerHTML = sotcnt;
        	document.getElementById('mot').innerHTML = motcnt;
        	if(detcnt>0){
        		var subDet = document.getElementById('subDet');
        		subDet.removeAttribute("disabled");
        	}if(vdetcnt>0){
        		var subDet = document.getElementById('subVdet');
        		subDet.removeAttribute("disabled");
        	}if(sotcnt>0){
        		var subDet = document.getElementById('subSot');
        		subDet.removeAttribute("disabled");
        	}if(motcnt>0){
        		var subDet = document.getElementById('subMot');
        		subDet.removeAttribute("disabled");
        	}
        }
    });
});