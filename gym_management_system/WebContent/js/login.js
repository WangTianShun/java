//切换验证码
function refreshCode(){
	//1.获取验证码图片对象
    var vcode = document.getElementById("vcode");
    //2.设置其src属性，加时间戳
    vcode.src = "${pageContext.request.contextPath}/checkCode?time="+new Date().getTime();
    
    if(vcode.value==''||vcode.value==null){
    	s_vcode.innerHTML = "验证码不能为空";
    }
}
/**
 * 1、给表单绑定onSubmit事件。监听器中判断每一个校验的结果
 * 如果都为true监听器返回true
 * 如果有一个为false则监听器返回false
 * 2、定义一些方法分别校验各个表单项
 * 3、给各个表单项绑定onBlur事件
 * */

//前台的js简单的校验
function checkUsername(){
    //1、获取用户名的值
	//方法一：	var username = $("#username").val();
	 //方法二：
    var username = document.getElementById("username").value;
    if(username=='' || username==null){
    	$("#username").css("border","1px solid red");
    }else{
    	$("#username").css("border","");
    }
}
function checkPassword(){
	var password = document.getElementById("password").value;
	if(password=='' || password==null){
		$("#password").css("border","1px solid red");
	}else{
		$("#password").css("border","");
    }
}
function checkVerify(){
	var verify = document.getElementById("verify").value;
	if(verify=='' || verify==null){
		$("#verify").css("border","1px solid red");
	}else{
		$("#password").css("border","");
	}
}
window.onload = function(){
    //1、给注册表单绑定onSubmit事件。
    document.getElementById("form").onsubmit = function(){
        //验证用户名
        //验证密码
        //...
        //都成功则返回true
        //
        return checkUsername() && checkPassword() && checkVerify();
    }
}