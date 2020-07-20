<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--导入自定义css-->
    <link rel="stylesheet" href="../css/admin_menu.css">
</head>
<body>
	<div class="row">
	        <nav class="navbar navbar-default">
	            <div class="container-fluid">
	                <!-- 指定商标和开关的样式，让它在手机上更好的显示-->
	                <div class="navbar-header">
	                    <!--开关按钮-->
	                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                        <span class="glyphicon glyphicon-th-list" style="color: white"></span>
	                    </button>
	                    <a class="navbar-brand" href="#">健身俱乐部</a>
	                </div>
	
	                <!-- 下拉菜单，表单等-->
	                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                    <ul class="nav navbar-nav navbar-right">
	                        <li><a>您好! 欢迎${admin.username } 登录</a></li>
	                        <li><a href="${pageContext.request.contextPath}/exitAction" target="_top">退出系统</a></li>
	                    </ul>
	                </div><!-- /.navbar-collapse -->
	            </div><!-- /.container-fluid -->
	        </nav>
	    </div>
</body>
</html>