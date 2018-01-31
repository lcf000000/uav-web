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
  
String.prototype.trim=function(){  
    return this.replace(/(^\s+)|(\s+$)/g, "");  
}  
  
/** 
 * 验证表单域的值是否符合指定的格式 
 * fieldObj是传入的表单对象  比如：username表单中传入的this对象 
 * msgOb是指表单后面的span对象  用来显示验证的具体情况包括js和Ajax验证 
 * re表示正则表达式 
 * nullMsg输入如果为空的消息 
 * errorMsg输入信息错误的消息 
 */  
function checkField(fieldObj,re,nullMsg,errorMsg){
    var v=fieldObj.value.replace(/(^\s+)|(\s+$)/g,"");  
    var flag=true;  
    if(v.length==0){
    	toastr.error(nullMsg); 
        flag=false;  
    }else{  
        if(!re.test(v)){  
        	toastr.error(errorMsg); 
            flag=false;  
        }  
    }  
    return flag;  
}