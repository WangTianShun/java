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
    	<h3 style="text-align: center;">修改新闻信息</h3>
        <form action="${pageContext.request.contextPath}/aNews_updateNews" method="post">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="news_id" value="${updateNews.news_id}">
			<div class="form-group">
            	<label for="news_title">标题：</label>
            	<input type="text" class="form-control" id="news_title" name="news_title"  value="${updateNews.news_title}" placeholder="请输入标题" />
          	</div>
          	<div class="form-group">
            	<label for="news_time">日期：</label>
            	<input type="date" class="form-control" value="<fmt:formatDate value="${updateNews.news_time}" pattern="yyyy-MM-dd"/>" id="news_time"  name="news_time" placeholder="请输入日期"/>
          	</div>
          
          	<div class="form-group">
            	<label for="news_content">内容：</label>
            	<input type="text" id="news_content" class="form-control" value="${updateNews.news_content}" name="news_content" placeholder="请输入内容"/>
          	</div>
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>