<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	<h3 style="text-align: center;">添加前台</h3>
     	<div id="errorMsg" style="color:red;text-align: center">${reception_msg}</div> 
        <form action="${pageContext.request.contextPath}/aReception_saveReception" method="post">
           
			<div class="form-group">
            	<label for="username">用户名：</label>
            	<input type="text" class="form-control" id="username" name="username"  placeholder="请输入用户名" />
          	</div>
          	<div class="form-group">
            	<label for="password">密码：</label>
            	<input type="text" class="form-control" id="password" name="password"   placeholder="请输入密码" />
          	</div>
          	<div class="form-group">
            	<label for="name">姓名：</label>
            	<input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名" />
          	</div>
            <%--进行判断做出回显--%>
          	<div class="form-group">
            	<label>性别：</label>
              	<input type="radio" name="gender" value="男" checked>男
	            <input type="radio" name="gender" value="女" >女
          	</div>
          	<div class="form-group">
            	<label for="phone">手机号：</label>
            	<input type="text" id="phone" class="form-control"  name="phone" placeholder="请输入手机号"/>
          	</div>
            <div class="form-group" style="text-align: center">
               <input class="btn btn-primary" type="submit" value="添加" />
               <input class="btn btn-default" type="reset" value="重置" />
            </div>
        </form>    
    </div>
</body>
</html>