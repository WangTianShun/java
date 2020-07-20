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
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true"/>
	<div class="container">
		<div class="row">
	        <div class="fit_title1">
	            	健身动态
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_title1_1">
	            Fitness News
	        </div>
	    </div>
	    <div class="row" >
			 <div class="title2">
                <div>
                	<img alt="" src="${pageContext.request.contextPath }/img/icon_5.jpg">
                    <span>最新新闻</span>
                </div>
            </div>
			<c:forEach items="${nlist}" var="news" varStatus="s">
				<div class="col-md-12">
		            <div>
		            	<div class="row fit_title1">${news.news_title }</div>
		            	<div class="row fit_title1_1"><fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/></div>
		            	<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;${news.news_content }</div>
		            </div>
		        </div>
			</c:forEach>
		</div>    
	 </div>
	<!-- 足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>