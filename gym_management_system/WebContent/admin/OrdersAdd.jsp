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
    	<h3 style="text-align: center;">添加订单</h3>
        <form action="${pageContext.request.contextPath}/aOrders_saveOrders" method="post">
           
          		<div class="form-group">
            	<label for="course.course_id" >课程：</label>
            	<select id="course.course_id" name="course.course_id" class="form-control">
            		<c:forEach items="${clist }" var="c">
            			<option value="${c.course_id }">${c.course_name}</option>
            		</c:forEach>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="user.user_id" >用户名：</label>
            	<select id="user.user_id" name="user.user_id" class="form-control">
            		<c:forEach items="${ulist }" var="u">
            			<option value="${u.user_id }">${u.username}</option>
            		</c:forEach>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="orders_time">订单日期：</label>
            	<input type="date" class="form-control" id="orders_time"  name="orders_time" placeholder="请输入订单日期"/>
          	</div>
          	<div class="form-group">
            	<label for="orders_money">订单金额：</label>
            	<input type="text" id="orders_money" class="form-control"  name="orders_money" placeholder="请输入订单金额"/>
          	</div>
          	<div class="form-group">
            	<label for="orders_state">订单状态：</label>
            	<input type="text" id="orders_state" class="form-control"  name="orders_state" placeholder="请输入订单状态"/>
          	</div>
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="添加" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>