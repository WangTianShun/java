<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/user_common.css" rel="stylesheet">
	<style type="text/css">
		.main{
		background: #CCFFFF;
		}
		.from{
		width: 400px;
		margin: 0 auto;
		}
	</style>
</head>
<body>
	<!-- 	头部 -->
	<jsp:include page="header.jsp"  flush="true"/>
		<div class="container main "  >
			<div class="row">
				<div class="fit_title1">
					修改个人信息
			    </div>
			</div>
			<div class="row">
			    <div class="fit_title1_1">
		            Update Information
		        </div>
		    </div>
		    <div class="from">
		        <form action="${pageContext.request.contextPath}/updateUser" method="post">
		            <!--  隐藏域 提交id-->
		            <input type="hidden" name="user_id" value="${user.user_id}">
					<div class="form-group">																								<!-- readonly 属性规定输入字段为只读 -->
		            	<label for="username">用户名：</label>
		            	<input type="text" class="form-control" id="username" name="username"  value="${user.username}" readonly="readonly" placeholder="请输入用户名" />
		          		<label for="password">密码：</label>
		            	<input type="text" class="form-control" id="password" name="password"  value="${user.password}"  placeholder="请输入密码" />
		          	</div>
		          
		          	<div class="form-group">
		            	<label for="name">姓名：</label>
		            	<input type="text" class="form-control" id="name" name="name"  value="${user.name}"  placeholder="请输入姓名" />
		          	</div>
		            <%--进行判断做出回显--%>
		          	<div class="form-group">
		            	<label>性别：</label>
		              	<c:if test="${user.gender == '男'}">
		                  	<input type="radio" name="gender" value="男" checked />男
		                  	<input type="radio" name="gender" value="女"  />女
		              	</c:if>
		
		              	<c:if test="${user.gender == '女'}">
		                  	<input type="radio" name="gender" value="男"  />男
		                  	<input type="radio" name="gender" value="女" checked  />女
		              	</c:if>
		          	</div>
		          	<div class="form-group">
		            	<label for="birth">生日：</label>
		            	<input type="date" class="form-control" value="<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/>" id="birth"  name="birth" placeholder="请输入出生日期"/>
		          	</div>
		
		          	<div class="form-group">
		            	<label for="phone">手机号：</label>
		            	<input type="text" id="phone" class="form-control" value="${user.phone}" name="phone" placeholder="请输入手机号"/>
		          	</div>
					<div class="form-group">
		            	<label for="identity">身份证号：</label>
		            	<input type="text" id="identity" class="form-control" value="${user.identity}" name="identity" placeholder="请输入身份证号"/>
		          	</div>
		          	<div class="form-group">
		            	<label for="email">Email：</label>
		            	<input type="text" id="email" class="form-control" value="${user.email}" name="email" placeholder="请输入邮箱地址"/>
		          	</div>
		
		             <div class="form-group" style="text-align: center">
		                <input class="btn btn-primary" type="submit" value="提交" />
		                <input class="btn btn-default" type="reset" value="重置" />
		             </div>
		        </form>
	        </div>    
	    </div>
	<!-- 	足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>