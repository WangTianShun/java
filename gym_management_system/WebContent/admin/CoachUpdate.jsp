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

</head>
<body>
		<div class="container" style="width: 400px;">
    	<h3 style="text-align: center;">修改教练信息</h3>
        <form action="${pageContext.request.contextPath}/aCoach_updateCoach" method="post" enctype="multipart/form-data">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="coach_id" value="${updateCoach.coach_id}">
            <div class="form-group">
            	<label for="coach_no">教练号：</label>
            	<input type="text" class="form-control" id="coach_no" name="coach_no"  value="${updateCoach.coach_no}" readonly="readonly" placeholder="请输入教练号" />
          	</div>
			<div class="form-group">
            	<label for="coach_name">姓名：</label>
            	<input type="text" class="form-control" id="coach_name" name="coach_name"  value="${updateCoach.coach_name}" placeholder="请输入姓名" />
          	</div>
          	<div class="form-group">
            	<label for="coach_image">照片：</label>
            	<input type="file" name="upload" id="coach_image" />
          	</div>
          	<div class="form-group">
            	<label for="coach_gender">性别：</label>
            	<input type="text" class="form-control" id="coach_gender" name="coach_gender"  value="${updateCoach.coach_gender}" placeholder="请输入性别" />
          	</div>
          	<div class="form-group">
            	<label for="coach_grade">教练等级：</label>
            	<select class="form-control" name="coach_grade" id="coach_grade">
	            	<c:if test="${updateCoach.coach_grade == '初级教练'}">
	            		<option value="初级教练" selected>初级教练</option>
	            		<option value="中级教练">中级教练</option>
	            		<option value="高级教练">高级教练</option>
	            	</c:if>
	            	<c:if test="${updateCoach.coach_grade == '中级教练'}">
	            		<option value="初级教练">初级教练</option>
	            		<option value="中级教练" selected>中级教练</option>
	            		<option value="高级教练">高级教练</option>
	            	</c:if>
	            	<c:if test="${updateCoach.coach_grade == '高级教练'}">
	            		<option value="初级教练">初级教练</option>
	            		<option value="中级教练">中级教练</option>
	            		<option value="高级教练" selected>高级教练</option>
	            	</c:if>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="coach_phone">手机号：</label>
            	<input type="text" class="form-control" id="coach_phone" name="coach_phone"  value="${updateCoach.coach_phone}" placeholder="请输入手机号" />
          	</div>
          	<div class="form-group">
            	<label for="coach_email">email：</label>
            	<input type="text" class="form-control" id="coach_email" name="coach_email"  value="${updateCoach.coach_email}" placeholder="请输入邮箱" />
          	</div>
          	<div class="form-group">
            	<label for="coach_entry">入职日期：</label>
            	<input type="date" class="form-control" value="<fmt:formatDate value="${updateCoach.coach_entry}" pattern="yyyy-MM-dd"/>" id="coach_entry"  name="coach_entry" placeholder="请输入入职日期"/>
          	</div>
          
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>