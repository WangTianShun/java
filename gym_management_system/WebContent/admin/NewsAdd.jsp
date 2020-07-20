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
    	<h3 style="text-align: center;">添加新闻</h3>
     	<div id="errorMsg" style="color:red;text-align: center">${user_msg}</div> 
        <form action="${pageContext.request.contextPath}/aNews_saveNews" method="post">
           
			<div class="form-group">
            	<label for="news_title">标题：</label>
            	<input type="text" class="form-control" id="news_title" name="news_title"  placeholder="请输入新闻标题" />
          	</div>
          	<div class="form-group">
            	<label for="news_time">日期：</label>
            	<input type="date" class="form-control" id="news_time" name="news_time" />
          	</div>
          	<div class="form-group">
            	<label for="news_content">：内容</label>
            	<textarea rows="7" cols="50" class="form-control" id="news_content" name="news_content" placeholder="请输入内容"></textarea>
          	</div>

             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="添加" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>