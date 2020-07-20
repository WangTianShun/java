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
    	<h3 style="text-align: center;">修改课程信息</h3>
        <form action="${pageContext.request.contextPath}/aCourse_updateCourse" method="post" enctype="multipart/form-data">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="course_id" value="${updateCourse.course_id}">
            <div class="form-group">
            	<label for="course_no">课程号：</label>
            	<input type="text" class="form-control" id="course_no" name="course_no"  value="${updateCourse.course_no}" readonly="readonly" placeholder="请输入课程号" />
          	</div>
			<div class="form-group">
            	<label for="course_name">课程名称：</label>
            	<input type="text" class="form-control" id="course_name" name="course_name"  value="${updateCourse.course_name}"  placeholder="请输入课程名称" />
          	</div>
          	<div class="form-group">
            	<label for="course_image">课程图片：</label>
            	<input type="file" name="upload" id="course_image" />
          	</div>
          	<div class="form-group">
            	<label for="course_type">课程类型：</label>
            	<select class="form-control" name="course_type" id="course_type">
	            	<c:if test="${updateCourse.course_type == '有氧'}">
	            		<option value="有氧" selected>有氧</option>
	            		<option value="无氧">无氧</option>
	            	</c:if>
	            	<c:if test="${updateCourse.course_type == '无氧'}">
	            		<option value="有氧">有氧</option>
	            		<option value="无氧" selected>无氧</option>
	            	</c:if>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="course_cost">课程费用：</label>
            	<input type="text" class="form-control" id="course_cost" name="course_cost"  value="${updateCourse.course_cost}" placeholder="请输入课程费用" />
          	</div>
          	<div class="form-group">
            	<label for="coach.coach_id">教练：</label>      
            	<select name="coach.coach_id" class="form-control" id="coach.coach_id">
            		<c:forEach var="list" items="${clist }">
            			<option value="${list.coach_id}" <c:if test="${updateCourse.coach.coach_id == list.coach_id }">selected</c:if> >${list.coach_name} </option>
            		</c:forEach>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="course_time">上课时间：</label>
            	<input type="text" class="form-control" value="${updateCourse.course_time}" id="course_time"  name="course_time" placeholder="请输入上课时间"/>
          	</div>
          	<div class="form-group">
            	<label for="course_count">限选人数：</label>
            	<input type="text" class="form-control" value="${updateCourse.course_count}" id="course_count"  name="course_count" placeholder="请输入课程人数"/>
          	</div>
          	<div class="form-group">
            	<label for="course_info">课程简介：</label>
            	<input type="text" class="form-control" value="${updateCourse.course_info}" id="course_info"  name="course_info" placeholder="请输入课程简介"/>
          	</div>
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>