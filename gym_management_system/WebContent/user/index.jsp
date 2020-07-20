<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
</head>
<body>
	<!-- 头部 -->
	<jsp:include  page="header.jsp" flush="true"/>
	<div class="container" >
		<div class="row">
	        <div class="fit_course">
	            	健身课程
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_course_1">
	            Fitness Course
	        </div>
	    </div>
	    <div class="row" >
	        <div class="col-md-3">
	            <div class="thumbnail">
	                <img src="${pageContext.request.contextPath }/img/course_yujia.png" alt="...">  
	            </div>
	            <div>
	            	<div class="row course_name">瑜伽</div>
	            	<p>瑜伽（英文：Yoga，印地语：योग）是一个汉语词汇，最早是从印度梵语“yug”或“yuj”而来，其含意为“一致”、“结合”或“和谐”。瑜伽源于古印度，是古印度六大哲学派别中的一系，探寻“梵我合一”的道理与方法。而现代人所称的瑜伽则主要是一系列的修身养心方法。</p>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <div class="thumbnail">
	                <img src="${pageContext.request.contextPath }/img/course_youyong.png" alt="...">
	            </div>
	            <div>
	            	<div class="row course_name">游泳</div>
	            	<p>游泳(Swimming)，是人在水的浮力作用下产生向上漂浮，凭借浮力通过肢体有规律的运动，使身体在水中有规律运动的技能。</p>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <div class="thumbnail">
	                <img src="${pageContext.request.contextPath }/img/course_danche.png" alt="...">   
	            </div>
	            <div>
	            	<div class="row course_name">动感单车</div>
	            	<p>动感单车，英文名字（SPINNING），是由美国私人教练兼极限运动员JOHNNYG于二十世纪八十年代首创，是一种结合了音乐、视觉效果等独特的充满活力的室内自行车训练课程。</p>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <div class="thumbnail">
	                <img src="${pageContext.request.contextPath }/img/course_boji.png" alt="...">     
	            </div>
	           	<div>
	           		<div class="row course_name">搏击操</div>
	                <p>搏击操，是一种有氧操，是Aerobics的又一创新，它结合了拳击、泰拳、跆拳道、散手、太极的基本动作，遵循健美操最新编排方法，在强有力的音乐节拍下完成的一种身体锻炼方式。</p>
	            </div>
	        </div>
	    </div>
	    
		<!--健身动态-->
	    <div class="row">
	        <div class="fit_course">
	            	健身动态
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_course_1">
	            	Information
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-3">
		        <a href="${pageContext.request.contextPath}/uNews_findAllNews"> 
		        	<div class="fit_dongtai dongtai_title">
			            <div>冬季健身小卫士</div>
			            <div>发布时间：2020-03-08 </div>
			        </div>
			    </a>    
	        </div>
	        <div class="col-md-3">
	            <img src="${pageContext.request.contextPath}/img/dongtai_1.png" class="img-responsive" alt="...">  
	        </div>
	        <div class="col-md-3">
	        	<a href="${pageContext.request.contextPath}/uNews_findAllNews"> 
		        	<div class="fit_dongtai dongtai_title" >
			            <div>运动健身后如何消除疲劳</div>
			            <div>发布时间：2020-03-01 </div>
			        </div>
		        </a> 
	        </div>
	        <div class="col-md-3">
	            <img src="${pageContext.request.contextPath}/img/dongtai_2.png" class="img-responsive" alt="...">  
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-3">
	            <img src="${pageContext.request.contextPath}/img/dongtai_3.png" class="img-responsive" alt="...">  
	        </div>
	        <div class="col-md-3">
	       		<a href="${pageContext.request.contextPath}/uNews_findAllNews"> 
		        	<div class="fit_dongtai dongtai_title">
		        		<div>空腹有氧训练</div>
		            	<div>发布时间：2020-03-01 </div>
		        	</div>
	            </a>
	        </div>
	        <div class="col-md-3">
	            <img src="${pageContext.request.contextPath}/img/dongtai_4.png" class="img-responsive" alt="...">  
	        </div>
	        <div class="col-md-3 ">
	        	<a href="${pageContext.request.contextPath}/uNews_findAllNews"> 
		        	<div class="fit_dongtai dongtai_title">
			            <div>不可轻视的运动健身误区</div>
			            <div>发布时间：2020-03-01 </div>
			        </div>
			    </a>
	        </div>
	    </div> 
	</div>
	<!-- 	足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>