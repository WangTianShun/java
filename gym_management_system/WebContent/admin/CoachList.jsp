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
    function deleteUser(coach_id){
        //用户安全提示
        if(confirm("您确定要删除吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/aCoach_deleteCoach?coach_id="+coach_id;
        }
    }
    </script>
</head>
<body>

	<div class="container">
	    <div style="float: left;">
	
	        <form  class="form-inline" action="${pageContext.request.contextPath}/aCoach_findAllCoach" method="post">
	            <div class="form-group">
	                <label for="exampleInputName2">姓名</label>
	                <input type="text" name="coach_name" value="${condition.coach_name[0] }" class="form-control" id="exampleInputName2" >
	            </div>
	            <div class="form-group">
	                <label for="exampleInputName3">性别</label>
	                <input type="text" name="coach_gender" value="${condition.coach_gender[0] }" class="form-control" id="exampleInputName3" >
	            </div>
	
	            <div class="form-group">
	                <label for="exampleInputName4">教练级别</label>
	                <input type="text" name="coach_grade" value="${condition.coach_grade[0] }" class="form-control" id="exampleInputName4"  >
	            </div>
	            <button type="submit" class="btn btn-default">查询</button>
	        </form>
	
	    </div>
	
	    <div style="float: right;margin: 5px;">
	
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/CoachAdd.jsp">添加教练</a>
	        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
	
	    </div>
	    <form id="form" action="${pageContext.request.contextPath}/aCoach_delSelectCoach" method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	                <th><input type="checkbox" id="firstCb"></th>
	                <th>编号</th>
	                <th>教练号</th>
	                <th>姓名</th>
	                <th>照片</th>
	                <th>性别</th>
	                <th>教练等级</th>
	                <th>手机号</th>
	                <th>邮箱</th>
	                <th>入职日期</th>
	                <th>操作</th>
	            </tr>
	
	            <c:forEach items="${pageBean.list}" var="coach" varStatus="s">
	                <tr>
	                    <td><input type="checkbox" name="uid" value="${coach.coach_id}"></td>
	                    <td>${s.count}</td>
	                     <td>${coach.coach_no}</td>
	                    <td>${coach.coach_name}</td>
	                     <td><img width="45px" height="40px" src="${ pageContext.request.contextPath }/${coach.coach_image}"></td>
	                    <td>${coach.coach_gender}</td>
	                    <td>${coach.coach_grade}</td>
	                    <td>${coach.coach_phone}</td>
	                    <td>${coach.coach_email}</td>
	                    <td><fmt:formatDate value="${coach.coach_entry}" pattern="yyyy-MM-dd"/></td>
	                    <td>
	                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/aCoach_findCoachByCoach_id?coach_id=${coach.coach_id}">修改</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${coach.coach_id})">删除</a>
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
	                        <a href="${pageContext.request.contextPath}/aCoach_findAllCoach?currentPage=${pageBean.currentPage-1}&coach_name=${condition.coach_name[0]}&coach_gender=${condition.coach_gender[0]}&coach_grade=${condition.coach_grade[0]}" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/aCoach_findAllCoach?currentPage=${i}&coach_name=${condition.coach_name[0]}&coach_gender=${condition.coach_gender[0]}&coach_grade=${condition.coach_grade[0]}">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/aCoach_findAllCoach?currentPage=${i}&coach_name=${condition.coach_name[0]}&coach_gender=${condition.coach_gender[0]}&coach_grade=${condition.coach_grade[0]}">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/aCoach_findAllCoach?currentPage=${pageBean.currentPage}&coach_name=${condition.coach_name[0]}&coach_gender=${condition.coach_gender[0]}&coach_grade=${condition.coach_grade[0]}" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/aCoach_findAllCoach?currentPage=${pageBean.currentPage+1}&coach_name=${condition.coach_name[0]}&coach_gender=${condition.coach_gender[0]}&coach_grade=${condition.coach_grade[0]}" aria-label="Next">
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