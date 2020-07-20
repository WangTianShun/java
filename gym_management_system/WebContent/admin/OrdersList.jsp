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
	<!--导入自定义css-->
    <link href="${pageContext.request.contextPath}/css/admin_common.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_common.js"></script>
<script type="text/javascript">
function deleteBtn(orders_id){
    //用户安全提示
    if(confirm("您确定要删除吗？")){
        //访问路径
        location.href="${pageContext.request.contextPath}/aOrders_deleteOrders?orders_id="+orders_id;
    }
}
</script>
</head>
<body>
	<div class="container">
		<div style="float: left;">
	        <form  class="form-inline" action="${pageContext.request.contextPath}/aOrders_findAllOrders" method="post">
	            <div class="form-group">
	                <label for="exampleInputName2">订单号</label>
	                <input type="text" name="orders_id" value="${orders.orders_id }" class="form-control" id="exampleInputName2" >
	            </div>
	            <div class="form-group">
	                <label for="exampleInputName3">用户名</label>
	                <select name="user.user_id" class="form-control" id="user.user_id">
	            		<c:forEach var="u" items="${ulist }">
	            			<option value="${u.user_id}" <c:if test="${orders.user.user_id == u.user_id }">selected</c:if> >${u.username} </option>
	            		</c:forEach>
            		</select>
	            </div>
	            <div class="form-group">
	                <label for="exampleInputName4">状态</label>
	                <input type="text" name="orders_state" value="${orders.orders_state }" class="form-control" id="exampleInputName4" >
	            </div>
	            <button type="submit" class="btn btn-default">查询</button>
	        </form>
	    </div>
	    
	    <div style="float: right;margin: 5px;">
	
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/aOrders_toSaveOrders">添加课程订单</a>
	        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
	
	    </div>
	    <form id="form" action="${pageContext.request.contextPath}/aOrders_delSelectOrders" method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	                <th><input type="checkbox" id="firstCb"></th>
	                <th>编号</th>
	                <th>订单号</th>
	                <th>课程</th>
	                <th>用户名</th>
	                <th>订单日期</th>
	                <th>订单金额</th>
	                <th>订单状态</th>
	                <th>操作</th>
	            </tr>
	
	            <c:forEach items="${pageBean.list}" var="orders" varStatus="s">
	                <tr>
	                    <td><input type="checkbox" name="uid" value="${orders.orders_id}"></td>
	                    <td>${s.count}</td>
	                    <td>${orders.orders_id}</td>
	                    <td>${orders.course.course_name}</td>
	                    <td>${orders.user.username}</td>
	                    <td><fmt:formatDate value="${orders.orders_time}" pattern="yyyy-MM-dd"/></td>
	                    <td>${orders.orders_money}</td>
	                    <td>${orders.orders_state}</td>
	                    <td>
	                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/aOrders_findOrdersByOrders_id?orders_id=${orders.orders_id}">修改</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteBtn(${orders.orders_id})">删除</a>
	                    </td>
	                </tr>
	            </c:forEach>
	        </table>
	    </form>
		<div>
	        <nav aria-label="Page navigation">
	            <ul class="pagination">
	                <c:if test="${pageBean.currentPage == 1}">
	                    <li class="disabled">
	                </c:if>
	                <c:if test="${pageBean.currentPage != 1}">
	                    <li>
	                </c:if>
	                        <a href="${pageContext.request.contextPath}/aOrders_findAllOrders?currentPage=${pageBean.currentPage-1}&orders_id=${orders.orders_id }&user.user_id=${orders.user.user_id }&orders_state=${orders.orders_state}" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/aOrders_findAllOrders?currentPage=${i}&orders_id=${orders.orders_id }&user.user_id=${orders.user.user_id }&orders_state=${orders.orders_state}">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/aOrders_findAllOrders?currentPage=${i}&orders_id=${orders.orders_id }&user.user_id=${orders.user.user_id }&orders_state=${orders.orders_state}">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/aOrders_findAllOrders?currentPage=${pageBean.currentPage}&orders_id=${orders.orders_id }&user.user_id=${orders.user.user_id }&orders_state=${orders.orders_state}" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/aOrders_findAllOrders?currentPage=${pageBean.currentPage+1}&orders_id=${orders.orders_id }&user.user_id=${orders.user.user_id }&orders_state=${orders.orders_state}" aria-label="Next">
	                            <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                <span style="font-size: 25px;margin-left: 5px;">
	                    共${pageBean.totalCount}条记录，共${pageBean.totalPage}页
	                </span>
	            </ul>
	        </nav>
	    </div>
	</div>
</body>
</html>