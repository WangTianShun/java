<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ include file="../public/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <title></title>
    <!--导入自定义css-->
    <link href="${pageContext.request.contextPath}/css/admin_common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_common.js"></script>
	<script type="text/javascript">
		function deleteUser(user_id){
			//用户安全提示
		    if(confirm("您确定要删除吗？")){
		    //访问路径
		    location.href="${pageContext.request.contextPath}/aUser_deleteUser?user_id="+user_id;
		    }
		}
	</script>
</head>
<body>

	<div class="container">
	    <div style="float: left;">
	
	        <form  class="form-inline" action="${pageContext.request.contextPath}/aUser_findAllUser" method="post">
	            <div class="form-group">
	                <label for="exampleInputName2">用户名</label>
	                <input type="text" name="username" value="${condition.username[0] }" class="form-control" id="exampleInputName2" >
	            </div>
	            <div class="form-group">
	                <label for="exampleInputName3">性别</label>
	                <input type="text" name="gender" value="${condition.gender[0] }" class="form-control" id="exampleInputName3" >
	            </div>
	
	            <div class="form-group">
	                <label for="exampleInputEmail2">邮箱</label>
	                <input type="email" name="email" value="${condition.email[0] }" class="form-control" id="exampleInputEmail2"  >
	            </div>
	            <button type="submit" class="btn btn-default">查询</button>
	        </form>
	
	    </div>
	
	    <div style="float: right;margin: 5px;">
	
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/UserAdd.jsp">添加用户</a>
	        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
	
	    </div>
	    <form id="form" action="${pageContext.request.contextPath}/aUser_delSelectUser" method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	                <th><input type="checkbox" id="firstCb"></th>
	                <th>编号</th>
	                <th>用户名</th>
	                <th>密码</th>
	                <th>姓名</th>
	                <th>性别</th>
	                <th>生日</th>
	                <th>手机号</th>
	                <th>身份证</th>
	                <th>邮箱</th>
	                <th>操作</th>
	            </tr>
	
	            <c:forEach items="${pageBean.list}" var="user" varStatus="s">
	                <tr>
	                    <td><input type="checkbox" name="uid" value="${user.user_id}"></td>
	                    <td>${s.count}</td>
	                    <td>${user.username}</td>
	                    <td>${user.password}</td>
	                    <td>${user.name}</td>
	                    <td>${user.gender}</td>
	                    <td><fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/></td>
	                    <td>${user.phone}</td>
	                    <td>${user.identity}</td>
	                    <td>${user.email}</td>
	                    <td>
	                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/aUser_findUserByUser_id?user_id=${user.user_id}">修改</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.user_id})">删除</a>
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
	                        <a href="${pageContext.request.contextPath}/aUser_findAllUser?currentPage=${pageBean.currentPage-1}&username=${condition.username[0]}&gender=${condition.gender[0]}&email=${condition.email[0]}" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/aUser_findAllUser?currentPage=${i}&username=${condition.username[0]}&gender=${condition.gender[0]}&email=${condition.email[0]}">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/aUser_findAllUser?currentPage=${i}&username=${condition.username[0]}&gender=${condition.gender[0]}&email=${condition.email[0]}">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/aUser_findAllUser?currentPage=${pageBean.currentPage}&username=${condition.username[0]}&gender=${condition.gender[0]}&email=${condition.email[0]}" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/aUser_findAllUser?currentPage=${pageBean.currentPage+1}&username=${condition.username[0]}&gender=${condition.gender[0]}&email=${condition.email[0]}" aria-label="Next">
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