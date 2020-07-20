<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    function deleteBtn(course_id){
	    	//用户安全提示
	        if(confirm("您确定要删除所选中的健身课程吗？")){
	        //访问路径
	        location.href="${pageContext.request.contextPath}/aCourse_deleteCourse?course_id="+course_id;
	        }
	    }
    </script>
    </script>
</head>
<body>

	<div class="container">
	    <div style="float: left;">
	
	        <form  class="form-inline" action="${pageContext.request.contextPath}/aCourse_findAllCourse" method="post">
	            <div class="form-group">
	                <label for="exampleInputName2">课程名称</label>
	                <input type="text" name="course_name" value="${condition.course_name[0] }" class="form-control" id="exampleInputName2" >
	            </div>
	            
	            <div class="form-group">
	                <label for="exampleInputName3">课程类型</label>
	                <input type="text" name="course_type" value="${condition.course_type[0] }" class="form-control" id="exampleInputName3" >
	            </div>
	            <button type="submit" class="btn btn-default">查询</button>
	        </form>
	
	    </div>
	
	    <div style="float: right;margin: 5px;">
	
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/aCourse_toSaveCourse">添加课程</a>
	        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
	
	    </div>
	    <form id="form" action="${pageContext.request.contextPath}/aCourse_delSelectCourse" method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	                <th><input type="checkbox" id="firstCb"></th>
	                <th>编号</th>
	                <th>课程号</th>
	                <th>课程名称</th>
	                <th>课程图片</th>
	                <th>教练</th>
	                <th>课程类型</th>
	                <th>课程费用</th>
	                <th>上课时间</th>
	                <th>限选人数</th>
	                <th>操作</th>
	            </tr>
	
	            <c:forEach items="${pageBean.list}" var="course" varStatus="s">
	                <tr>
	                    <td><input type="checkbox" name="uid" value="${course.course_id}"></td>
	                    <td>${s.count}</td>
	                    <td>${course.course_no}</td>
	                    <td>${course.course_name}</td>
	                    <td><img width="45px" height="40px" src="${ pageContext.request.contextPath }/${course.course_image}"></td>
	                    <td>${course.coach.coach_name}</td>
	                    <td>${course.course_type}</td>
	                    <td>${course.course_cost}</td>
	                    <td>${course.course_time}</td>
	                    <td>${course.course_count}</td>
	                    <td>
	                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/aCourse_findCourseByCourse_id?course_id=${course.course_id}">修改</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteBtn(${course.course_id})">删除</a>
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
	                        <a href="${pageContext.request.contextPath}/aCourse_findAllCourse?currentPage=${pageBean.currentPage-1}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/aCourse_findAllCourse?currentPage=${i}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/aCourse_findAllCourse?currentPage=${i}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/aCourse_findAllCourse?currentPage=${pageBean.currentPage}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/aCourse_findAllCourse?currentPage=${pageBean.currentPage+1}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}" aria-label="Next">
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