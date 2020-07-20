<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../public/include.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/user_common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/user_course.css" rel="stylesheet">
	<script type="text/javascript">
	function reserveBtn(course_id){
   	 //用户安全提示
    	if(confirm("您确定要预定吗？")){
        	//访问路径
       	 	location.href="${pageContext.request.contextPath}/uCourse_findCourseByCourse_id?course_id="+course_id;
    	}
	}
	</script>
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true"/>
	<div class="container">
		<div class="row">
	        <div class="fit_title1">
	            	健身课程
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_title1_1">
	            Fitness Course
	        </div>
	        <div class=" row search">
	        <form  class="form-inline" action="${pageContext.request.contextPath}/uCourse_findAllCourse" method="post">
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
	     
	    </div>
	    <div class="row" >
			<c:forEach items="${pageBean.list}" var="course" varStatus="s">
				<div class="row single">
					<div class="col-md-3">
				    	<div class="thumbnail">
				            <img src="${ pageContext.request.contextPath }/${course.course_image}">
				        </div>
				   </div>
					<div class="col-md-6">
						<div class="row center ">
							<div class="row course_name">${course.course_name}</div>
							<div class="row"> 
								<div class="leftt">
									<div class="left_1">类型：</div>
									<div class="left_2">${course.course_type}</div>
								</div>
								<div class="right">
									<div class="left_1">上课时间：</div>
									<div class="left_2">${course.course_time}</div>
								</div>
							</div>
							<div class="row"> 
								<div class="leftt">
									<div class="left_1">教练：</div>
									<div class="left_2">${course.coach.coach_name}</div>
								</div>
								<div class="right">
									<div class="left_1">限选人数：</div>
									<div class="left_2">${course.course_count}</div>
								</div>
							</div>
							<div class="row info">${course.course_info}</div>	
						</div>
					</div>
					<div class="col-md-3 ">
		            	<div class="row submit">
		            		<div class="price_num">
			                   <span>&yen;</span>
			                   <span>${course.course_cost}</span>
		                	</div>
		                	<div class="btn_sub"><a href="javascript:reserveBtn(${course.course_id})" >订购</a></div>
		                	<c:if test="${failCourse_id==course.course_id}">
		                	<div class="error">${reserveFail}</div>
		                	</c:if>
		            	</div>
            		</div>
				</div>	
			</c:forEach>
	  	</div>
		<div>
	        <nav aria-label="Page navigation">
	            <ul class="pagination">
	                <c:if test="${pageBean.currentPage == 1}">
	                    <li class="disabled">
	                </c:if>
	                <c:if test="${pageBean.currentPage != 1}">
	                    <li>
	                </c:if>
	                        <a href="${pageContext.request.contextPath}/uCourse_findAllCourse?currentPage=${pageBean.currentPage-1}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/uCourse_findAllCourse?currentPage=${i}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/uCourse_findAllCourse?currentPage=${i}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/uCourse_findAllCourse?currentPage=${pageBean.currentPage}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/uCourse_findAllCourse?currentPage=${pageBean.currentPage+1}&course_name=${condition.course_name[0]}&course_type=${condition.course_type[0]}" aria-label="Next">
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
	<!-- 	足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>