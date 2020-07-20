<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ include file="../public/include.jsp"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
    	<h3 style="text-align: center;">修改课程订单信息</h3>
        <form action="${pageContext.request.contextPath}/aOrders_updateOrders" method="post">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="orders_id" value="${updateOrders.orders_id}">
          	<div class="form-group">
            	<label for="course.course_id">课程：</label>      
            	<select name="course.course_id" class="form-control" id="course.course_id">
            		<c:forEach var="list" items="${clist }">
            			<option value="${list.course_id}" <c:if test="${updateOrders.course.course_id == list.course_id }">selected</c:if> >${list.course_name} </option>
            		</c:forEach>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="user.user_id">用户名：</label>      
            	<select name="user.user_id" class="form-control" id="user.user_id">
            		<c:forEach var="u" items="${ulist }">
            			<option value="${u.user_id}" <c:if test="${updateOrders.user.user_id == u.user_id }">selected</c:if> >${u.username} </option>
            		</c:forEach>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="orders_time">订单时间：</label>
            	<input type="date" class="form-control" value="<fmt:formatDate value="${updateOrders.orders_time}" pattern="yyyy-MM-dd"/>" id="orders_time"  name="orders_time" placeholder="请输入订单时间"/>
          	</div>
          	<div class="form-group">
            	<label for="orders_money">订单金额：</label>
            	<input type="text" class="form-control" id="orders_money" name="orders_money"  value="${updateOrders.orders_money}" placeholder="请输入订单金额" />
          	</div>
          	
          	
          	<div class="form-group">
            	<label for="orders_state">订单状态：</label>
            	<input type="text" class="form-control" value="${updateOrders.orders_state}" id="orders_state"  name="orders_state" placeholder="请输入订单状态"/>
          	</div>
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>	
</body>
</html>