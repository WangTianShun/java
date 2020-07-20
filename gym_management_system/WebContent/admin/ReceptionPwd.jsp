<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--导入自定义css-->
    <link href="${pageContext.request.contextPath}/css/admin_common.css" rel="stylesheet">
</head>
<body>
	<div class="container" style="width: 400px;">
    	<h3 style="text-align: center;">修改密码</h3>
        <form action="${pageContext.request.contextPath}/aReception_alterReception" method="post">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="reception_id" value="${passwordReception.reception_id}">
			<div class="form-group">																									<!-- readonly 属性规定输入字段为只读 -->
            	<label for="username">用户名：</label>
            	<input type="text" class="form-control" id="username" name="username"  value="${passwordReception.username}" readonly="readonly" placeholder="请输入用户名" />
          	</div>
          	<div class="form-group">
            	<label for="password">密码：</label>
            	<input type="text" class="form-control" id="password" name="password"  value="${passwordReception.password}"  placeholder="请输入密码" />
          	</div>
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
            </div>
        </form>    
    </div>
</body>
</html>