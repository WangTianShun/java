<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--自定义css、js -->
	<link href="../css/login.css" rel="stylesheet"> 
	<script src="../js/login.js"></script>
</head>
<body>
	<div class="main">
		<center><h1 style="color:white">Login</h1></center>
		<div class="center">
			<form action="login" method="post" id="form">
				<div>
					<span class="glyphicon glyphicon-user Cone"></span>
					<input type="text" name="username" id="username" placeholder="请输入用户名" onblur="checkUsername()" />
					
				</div>
				<div>
					<span class="glyphicon glyphicon-lock Cone"></span>
					<input type="password" name="password" id="password" placeholder="请输入密码" onblur="checkPassword()"/>
					<span id="s_password"></span>
				</div>
				<div>
					<span class="glyphicon glyphicon-th-list Cone"></span>
					<select name="role">
						  <option value="用户">用户</option>
						  <option value="前台">前台</option>
						  <option value="管理员">管理员</option>  
					</select>
				</div>
				<div>
					<span class="glyphicon glyphicon-tag Cone"></span>
					<input type="text" name="checkCode" id="verify" placeholder="验证码" style="width:100px" onblur="checkVerify()" />
					<img id="vcode" src="${pageContext.request.contextPath}/checkCode" onclick="refreshCode();">
					<span id="s_verify"></span>
				</div>
				<div class="submit">
					<input type="submit" value="登&nbsp;&nbsp;录" class="btn btn-success " name="submit"/>
				</div>
			</form>
			<br/>
			<!-- 出错显示的信息框 -->
		    <div class="alert alert-warning alert-dismissible" role="alert">
		    	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    	<span aria-hidden="true">&times;</span></button>
		        <strong>${session.login_msg}</strong>
		    </div>
		  
		</div>
	</div>

</body>
</html>