<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	<h3 style="text-align: center;">添加教练</h3>
     	<div id="errorMsg" style="color:red;text-align: center">${coach_msg}</div> 
        <form action="${pageContext.request.contextPath}/aCoach_saveCoach" method="post" enctype="multipart/form-data">
           <div class="form-group">
            	<label for="coach_no">教练号：</label>
            	<input type="text" class="form-control" id="coach_no" name="coach_no"  placeholder="请输入教练号" />
          	</div>
			<div class="form-group">
            	<label for="coach_name">姓名：</label>
            	<input type="text" class="form-control" id="coach_name" name="coach_name"  placeholder="请输入姓名" />
          	</div>
          	<div class="form-group">
            	<label for="coach_image">照片：</label>
            	<input type="file" name="upload" id="coach_image" />
          	</div>
          	<div class="form-group">
            	<label>性别：</label>
              	<input type="radio" name="coach_gender" value="男" checked>男
	            <input type="radio" name="coach_gender" value="女" >女
          	</div>
          	<div class="form-group">
            	<label for="coach_grade">教练等级：</label>
            	<select name="coach_grade" class="form-control">
					<option value="初级教练">初级教练</option>
					<option value="中级教练">中级教练</option>
					<option value="高级教练">高级教练</option>
				</select>
          	</div>
          	<div class="form-group">
            	<label for="coach_entry">入职日期：</label>
            	<input type="date" class="form-control" id="coach_entry"  name="coach_entry" placeholder="请输入入职日期"/>
          	</div>
			<div class="form-group">
            	<label for="coach_email">Email：</label>
            	<input type="email" id="coach_email" class="form-control" name="coach_email" placeholder="请输入邮箱地址"/>
          	</div>
          	<div class="form-group">
            	<label for="coach_phone">手机号：</label>
            	<input type="text" id="coach_phone" class="form-control"  name="coach_phone" placeholder="请输入手机号"/>
          	</div>
			
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="添加" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>