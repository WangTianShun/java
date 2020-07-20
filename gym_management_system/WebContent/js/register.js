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
/*
表单校验：
	1.用户名：单词字符，长度6到12位
	2.密码：单词字符，长度6到12位
	3.email：邮件格式
	4.姓名：非空
	5.手机号：手机号格式
	6.出生日期：非空
	7.验证码：非空
*/
window.onload = function(){
    //1、给注册表单绑定onSubmit事件。
    document.getElementById("form").onsubmit = function(){
        //验证用户名、密码。。。。。
        //都成功则返回true
        return checkUsername() && checkPassword() && checkName() && checkEmail() 
        && checkPhone() && checkIdentity() && checkVerify();
    }
//    document.getElementById("username").onblur = checkUsername;
//    document.getElementById("password").onblur = checkPassword;
//    document.getElementById("name").onblur = checkName;
//    document.getElementById("email").onblur = checkEmail;
//    document.getElementById("phone").onblur = checkPhone;
//    document.getElementById("identity").onblur = checkIdentity;
//    document.getElementById("checkCode").onblur = checkVerify;
}

//校验用户名
function checkUsername(){
    //1、获取用户名的值
    var username = document.getElementById("username").value;
    // 2、定义正则表达式，以字母开头，以字母结尾
    var reg_username = /^\w{6,12}$/;
    //3、判断值是否符合正则的规则
    var flag = reg_username.test(username);
    var s_username = document.getElementById("s_username");
    //4、提示信息
    if(flag){
        s_username.innerHTML = "<img height='25' width='35' src='../img/gou.png'>"
    }else{
        s_username.innerHTML = "用户名长度为6-12";
    }
    return flag;
}

//校验密码
function checkPassword(){
	//1、获取密码值
    var password = document.getElementById("password").value;
	//2、定义正则
	var reg_password = /^\w{6,12}$/;
	//3、判断，给出提示信息
	var flag = reg_password.test(password);
	if(flag){
		s_password.innerHTML = "<img height='25' width='35' src='../img/gou.png'>"
	}else{
		s_password.innerHTML = '密码长度为6-12';		
    }
	return flag;
}
function checkName(){
    //1、获取用户名的值
    var name = document.getElementById("name").value;
    var flag = false;
    if(name=='' || name==null){
    	s_name.innerHTML = '用户名不能为空';
    	flag = false;
    }else{
    	s_name.innerHTML = "<img height='25' width='35' src='../img/gou.png'>"
    	flag = true;
    }
    return flag;
}
//校验邮箱
function checkEmail(){
	//1、获取邮箱
	var email = document.getElementById("email").value;	
	//2、定义正则
	var reg_email = /^\w+@\w+\.\w+$/;
	//3、判断
	var flag = reg_email.test(email);
	if(flag){
		s_email.innerHTML = "<img height='25' width='35' src='../img/gou.png'>"	
	}else{
		s_email.innerHTML = 'email格式有误';
	}
	return flag;
}
//手机号校验
function checkPhone(){
	//获取手机号
	var phone = document.getElementById("phone").value;
	//2、定义正则
	var reg_phone = /^1(3|4|5|7|8)\d{9}$/;
	//3、判断
	var flag = reg_phone.test(phone);
	if(flag){
		s_phone.innerHTML = "<img height='25' width='35' src='../img/gou.png'>"
	}else{
		s_phone.innerHTML = '手机号格式有误';
    }
	return flag;
}
function checkIdentity(){
    var identity = document.getElementById("identity").value;
    var flag = false;
    if(identity=='' || identity==null){
    	s_identity.innerHTML ='身份号不能为空';
    	flag = false;
    }else{
    	s_identity.innerHTML = "<img height='25' width='35' src='../img/gou.png'>"
    	flag = true;	
    }
    return flag;
}
function checkVerify(){
	var checkCode = document.getElementById("checkCode").value;
	var flag = false;
	if(checkCode=='' || checkCode==null){
		s_verify.innerHTML ='验证码不能为空';
		flag = false;
	}else{
		flag = true;
	}
	return flag;
}











