<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>健身房后台管理系统</title>
    </head>
    <frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
        <frame src="Top.jsp" name="topFrame" scrolling="no">
        <frameset cols="220,*" name="btFrame" frameborder="NO" border="0" framespacing="0">
            <frame src="Menu.jsp" noresize name="menu" scrolling="yes">
            <frame src="${pageContext.request.contextPath}/admin/main.jsp" noresize name="main" scrolling="yes">
        </frameset>
    </frameset>
    <noframes>
	<body>您的浏览器不支持框架！</body>
    </noframes>
</html>