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
	<!-- 头部 -->
	<header class="container-fluid">   
	    <!--第一行-->
	    <div class="row">
	        <nav class="navbar navbar-default">
	            <div class="container-fluid">
	                <!-- 指定商标和开关的样式，让它在手机上更好的显示-->
	                <div class="navbar-header">
	                    <!--开关按钮-->
	                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                        <span class="glyphicon glyphicon-th-list" style="color: white"></span>
	                    </button>
	                    <a class="navbar-brand" href="#">健身俱乐部</a>
	                </div>
	                <!-- 下拉菜单，表单等-->
	                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                    <ul class="nav navbar-nav navbar-right">
	                        <li><a href="${pageContext.request.contextPath}/index.jsp">首页 <span class="sr-only">(current)</span></a></li>
	                        <li><a href="${pageContext.request.contextPath}/uCoach_indexCoach">教练团队</a></li>
	                        <li class="active"><a href="${pageContext.request.contextPath}/uEquip_indexEquip">健身器材</a></li>
	                        <li><a href="${pageContext.request.contextPath}/uNews_indexNews">健身动态</a></li>
	                        <li><a href="${pageContext.request.contextPath}/index/about.jsp">关于我们</a></li>
	                        <li><a href="${pageContext.request.contextPath}/login/Login.jsp">登录</a></li>
	                        <li><a href="${pageContext.request.contextPath}/login/Register.jsp">注册</a></li>
	                    </ul>
	                </div><!-- /.navbar-collapse -->
	            </div><!-- /.container-fluid -->
	        </nav>
	    </div>
	    <!--第二行：轮播图-->
	    <div class="row" >
	        <div id="carousel-example-generic" data-interval="2000" class="carousel slide" data-ride="carousel">
	            <!-- 中间的小圆点 -->
	            <ol class="carousel-indicators">
	                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	            </ol>
	
	            <!-- 包含图片 -->
	            <div class="carousel-inner" role="listbox">
	                <!--每个div是一张图片-->
	                <div class="item active">
	                    <img width="100%" src="${pageContext.request.contextPath}/img/bg_1.png" >
	                    <div class="carousel-caption">
	                        	拳击
	                    </div>
	                </div>
	                <div class="item">
	                    <img width="100%" src="${pageContext.request.contextPath}/img/bg_2.png" alt="...">
	                    <div class="carousel-caption">
	                        	力量
	                    </div>
	                </div>
	                <div class="item">
	                    <img width="100%" src="${pageContext.request.contextPath}/img/bg_3.png" alt="...">
	                    <div class="carousel-caption">
	                        	瑜伽
	                    </div>
	                </div>
	            </div>
	
	            <!-- 控制按钮 -->
	            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
 	                <span class="sr-only">Previous</span> 
	            </a>
	            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                <span class="sr-only">Next</span>
	            </a>
	        </div>
	    </div>
	</header>
	
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
			<c:forEach items="${equipList}" var="equip" varStatus="s">
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
			<c:forEach items="${equipList}" var="equip" varStatus="s">
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
			<c:forEach items="${equipList}" var="equip" varStatus="s">
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
	<jsp:include page="../user/footer.jsp" flush="true"/>
</body>
</html>