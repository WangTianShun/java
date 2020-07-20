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
    	<h3 style="text-align: center;">添加课程</h3>
     	<div id="errorMsg" style="color:red;text-align: center">${course_msg}</div> 
        <form action="${pageContext.request.contextPath}/aCourse_saveCourse" method="post" enctype="multipart/form-data">
			<div class="form-group">
            	<label for="course_no">课程号：</label>
            	<input type="text" class="form-control" id="course_no" name="course_no"  placeholder="请输入课程号" />
          	</div>
			<div class="form-group">
            	<label for="course_name">名称：</label>
            	<input type="text" class="form-control" id="course_name" name="course_name"  placeholder="请输入课程名称" />
          	</div>
          	<div class="form-group">
            	<label for="course_image">课程图片：</label>
            	<input type="file" name="upload" id="course_image" />
          	</div>
          	<div class="form-group">
            	<label for="course_type">类型：</label>
            	<select name="course_type" class="form-control">
					<option value="有氧">有氧</option>
					<option value="无氧">无氧</option>
				</select>
          	</div>
          	<div class="form-group">
            	<label for="course_time">上课时间：</label>
            	<input type="text" class="form-control" id="course_time"  name="course_time" placeholder="请输入上课时间"/>
          	</div>
          	<div class="form-group">
            	<label for="coach.coach_id">教练：</label>
            	<select name="coach.coach_id" class="form-control" id="coach.coach_id">
            		<c:forEach var="list" items="${clist }">
            			<option value="${list.coach_id}">${list.coach_name} </option>
            		</c:forEach>
            	</select>
          	</div>
			<div class="form-group">
            	<label for="course_cost">课程费用：</label>
            	<input type="text" id="course_cost" class="form-control" name="course_cost" placeholder="请输入课程费用"/>
          	</div>
          	<div class="form-group">
            	<label for="course_count">限选人数：</label>
            	<input type="text" id="course_count" class="form-control" name="course_count" placeholder="请输入限选人数"/>
          	</div>
          	<div class="form-group">
            	<label for="course_info">课程简介：</label>
            	<textarea rows="5" cols="50" class="form-control" id="course_info" name="course_info" placeholder="请输入课程简介"></textarea>
          	</div>
			
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="添加" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>