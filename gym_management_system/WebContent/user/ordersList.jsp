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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_common.js"></script>
	<script type="text/javascript">
	function deleteBtn(orders_id){
	    //用户安全提示
	    if(confirm("您确定要删除吗？")){
	        //访问路径
	        location.href="${pageContext.request.contextPath}/uOrders_deleteOrders?orders_id="+orders_id;
	    }
	}
	
	</script>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true"/>
	<div class="container orders">
		<div class="row">
		        <div class="fit_title1">
		            	我的订单
		        </div>
		    </div>
			<div class="row">
		        <div class="fit_title1_1">
	            My Orders
	        </div>
	    </div>
	    <form id="form"  method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	               	<th>编号</th>
	                <th>订单号</th>
	                <th>课程</th>
 	                <th>图片</th> 
	                <th>订单日期</th>
	                <th>订单金额</th>
	                <th>订单状态</th>
	                <th>操作</th>
	            </tr>
	            <c:forEach items="${olist}" var="orders" varStatus="s">
	                <tr>
	                    <td>${s.count}</td>
	                    <td>${orders.orders_id}</td>
	                    <td>${orders.course.course_name}</td>
						<td><img width="45px" height="40px" src="${ pageContext.request.contextPath }/${orders.course.course_image}"></td>
	                    <td><fmt:formatDate value="${orders.orders_time}" pattern="yyyy-MM-dd"/></td>
	                    <td>${orders.orders_money}</td>
	                    <td>${orders.orders_state}</td>
	                    <td>
<%-- 	                    	<a class="btn btn-default btn-sm" href="javascript:(0)" onclick="confirmPay(${orders.orders_id});">支付</a>&nbsp; --%>
	                        <a class="btn btn-default btn-sm" href="javascript:confirmPay(${orders.orders_id})">支付</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteBtn(${orders.orders_id})">删除</a>
	                    </td>
	                </tr>
	            </c:forEach>
	        </table>
	    </form>
	</div>
	<!-- 足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
	<script type="text/javascript">
		function confirmPay(id){
			if(confirm("您确定要付款吗？")){
				$.ajax({
					url:'${ pageContext.request.contextPath }/uOrders_payMoney?orders_id='+id,
					type:'POST',
					dataType:'json',
					success:function(data){
						if(data.data!=null){
// 							alert(data.data);
							 console.log(data);
							alert('付款成功');
							window.location.href = '${pageContext.request.contextPath}/uOrders_findAllOrders'
						}else{
							alert('你已经完成付款，不需要再付款！！！');
							window.location.href = '${pageContext.request.contextPath}/uOrders_findAllOrders'
						}
					},
					error:function(data){
						alert('付款失败');
						window.location.href = '${pageContext.request.contextPath}/uOrders_findAllOrders'
					}
				})
				
			}
		}
	</script>

</body>
</html>