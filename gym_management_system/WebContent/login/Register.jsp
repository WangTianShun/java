<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/register.js"></script>
	
</head>
<body>
	<div class="rg_layout">
        <div class="rg_left">
            <p>新用户注册</p>
            <p>USER REGISTER</p>
        </div>
        <div class="rg_center">
        	<div id="errorMsg" style="color:red;text-align: center">${register_msg}</div>
            <form id="form" action="register" method="post">
                <table>
                    <tr>
                        <td class="td_left"><label for="username">用户名</label></td>
                        <td class="td_right">
                        	<input type="text" name="username" id="username" placeholder="请输入用户名" onblur="checkUsername()">
                        	<span id="s_username" class="error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="password">密码</label></td>
                        <td class="td_right">
                        	<input type="password" name="password" id="password" placeholder="请输入密码" onblur="checkPassword()">
                        	<span id="s_password" class="error"></span>
                        </td>
	                </tr>
	                <tr>
	                    <td class="td_left"><label for="name">姓名</label></td>
	                    <td class="td_right">
	                    	<input type="text" name="name"  id="name" placeholder="请输入姓名" onblur="checkName()">
	                    	<span id="s_name" class="error"></span>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_left">性别</td>
	                    <td class="td_right">
	                        <input type="radio" name="gender" value="男" checked>男
	                        <input type="radio" name="gender" value="女" >女
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_left"><label for="birth">出生日期</label></td>
	                    <td class="td_right">
	                    	<input type="date" name="birth" id="birth" placeholder="请输入出生日期">
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_left"><label for="phone">手机号</label></td>
	                    <td class="td_right">
	                    	<input type="text" name="phone"id="phone" placeholder="请输入手机号" onblur="checkPhone()">
	                    	<span id="s_phone" class="error"></span>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_left"><label for="identity">身份证</label></td>
	                    <td class="td_right">
	                    	<input type="text" name="identity" id="identity" placeholder="请输入身份证" onblur="checkIdentity()">
	                    	<span id="s_identity" class="error"></span>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_left"><label for="email">Email</label></td>
	                    <td class="td_right">
	                    	<input type="email" name="email" id="email" placeholder="请输入邮箱" onblur="checkEmail()">
	                    	<span id="s_email" class="error"></span>
	                    </td>
	                </tr> 
	                <tr>
	                    <td class="td_left"><label for="checkcode">验证码</label></td>
	                    <td class="td_right">
	                        <input type="text" name="checkCode" id="checkCode" placeholder="请输入验证码" onblur="checkVerify()">
	                        <img id=vcode src="${pageContext.request.contextPath}/checkCode" onclick="refreshCode();">
	                    	<span id="s_verify" class="error"></span>
	                    </td>
	                </tr>
	                <tr align="center">
	                    <td colspan="2"><input type="submit" id="btn_sub" value="注册"></td>
	                </tr>
                </table>
            </form>
        </div>
        <div class="rg_right">
            <p>已有账号?<a href="Login.jsp">立刻登录</a></p>
        </div>
    </div>
</body>
</html>