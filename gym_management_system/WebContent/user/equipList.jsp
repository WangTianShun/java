<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--自定义css -->
	<link href="${pageContext.request.contextPath}/css/user_common.css" rel="stylesheet">
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true"/>
	<div class="container">
		<div class="row">
	        <div class="fit_title1">
	            	健身器材
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_title1_1">
	            Fitness Equip
	        </div>
	    </div>
		<div class="row" >
			 <div class="title2">
                <div>
                	<img alt="" src="${pageContext.request.contextPath }/img/icon_5.jpg">
                    <span>有氧健身器材</span>
                </div>
            </div>
			<c:forEach items="${elist}" var="equip" varStatus="s">
			<c:if test="${equip.equip_type=='有氧健身器材' }">
				<div class="col-md-3">
		            <div class="thumbnail">
		               <img src="${ pageContext.request.contextPath }/${equip.equip_image}">
		            </div>
		            <div>
		            	<div class="row title3">${equip.equip_name }</div>
		            </div>
		        </div>
	        </c:if>
			</c:forEach>
		</div>
		<div class="row" >
			<div class="title2">
                <div>
                	<img alt="" src="${pageContext.request.contextPath }/img/icon_5.jpg">
                    <span>力量训练器材</span>
                </div>
            </div>
			<c:forEach items="${elist}" var="equip" varStatus="s">
			<c:if test="${equip.equip_type=='力量训练器材' }">
				<div class="col-md-3">
		            <div class="thumbnail">
		               <img src="${ pageContext.request.contextPath }/${equip.equip_image}">
		            </div>
		            <div>
		            	<div class="row title3">${equip.equip_name }</div>
		            </div>
		        </div>
	        </c:if>
			</c:forEach>
		</div>
		<div class="row" >
			<div class="title2">
                <div>
                	<img alt="" src="${pageContext.request.contextPath }/img/icon_5.jpg">
                    <span>自由力量训练器材</span>
                </div>
            </div>
			<c:forEach items="${elist}" var="equip" varStatus="s">
			<c:if test="${equip.equip_type=='自由力量训练器材' }">
				<div class="col-md-3">
		            <div class="thumbnail">
		               <img src="${ pageContext.request.contextPath }/${equip.equip_image}">
		            </div>
		            <div>
		            	<div class="row title3">${equip.equip_name }</div>
		            </div>
		        </div>
	        </c:if>
			</c:forEach>
		</div>		
	</div>
	<!-- 	足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>