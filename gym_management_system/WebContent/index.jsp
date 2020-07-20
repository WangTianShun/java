<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健身房管理系统</title>
	<!--自定义css -->
	<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
</head>
<body>
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
	                        <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">首页 <span class="sr-only">(current)</span></a></li>
	                        <li><a href="${pageContext.request.contextPath}/uCoach_indexCoach">教练团队</a></li>
	                        <li><a href="${pageContext.request.contextPath}/uEquip_indexEquip">健身器材</a></li>
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
	    <!--健身课程-->
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
	                <img src="${pageContext.request.contextPath}/img/course_yujia.png" alt="...">  
	            </div>
	            <div>
	            	<div class="row course_name">瑜伽</div>
	            	<p>瑜伽（英文：Yoga，印地语：योग）是一个汉语词汇，最早是从印度梵语“yug”或“yuj”而来，其含意为“一致”、“结合”或“和谐”。瑜伽源于古印度，是古印度六大哲学派别中的一系，探寻“梵我合一”的道理与方法。而现代人所称的瑜伽则主要是一系列的修身养心方法。</p>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <div class="thumbnail">
	                <img src="${pageContext.request.contextPath}/img/course_youyong.png" alt="...">
	                
	            </div>
	            <div>
	            	<div class="row course_name">游泳</div>
	            	<p>游泳(Swimming)，是人在水的浮力作用下产生向上漂浮，凭借浮力通过肢体有规律的运动，使身体在水中有规律运动的技能。</p>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <div class="thumbnail">
	                <img src="${pageContext.request.contextPath}/img/course_danche.png" alt="...">   
	            </div>
	            <div>
	            	<div class="row course_name">动感单车</div>
	            	<p>动感单车，英文名字（SPINNING），是由美国私人教练兼极限运动员JOHNNYG于二十世纪八十年代首创，是一种结合了音乐、视觉效果等独特的充满活力的室内自行车训练课程。</p>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <div class="thumbnail">
	                <img src="${pageContext.request.contextPath}/img/course_boji.png" alt="...">     
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
		        <a href="${pageContext.request.contextPath}/uNews_indexNews"> 
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
	        	<a href="${pageContext.request.contextPath}/uNews_indexNews"> 
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
	       		<a href="${pageContext.request.contextPath}/uNews_indexNews"> 
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
	        	<a href="${pageContext.request.contextPath}/uNews_indexNews"> 
		        	<div class="fit_dongtai dongtai_title">
			            <div>不可轻视的运动健身误区</div>
			            <div>发布时间：2020-03-01 </div>
			        </div>
			    </a>
	        </div>
	    </div> 
	</div>

	<footer class="container-fluid">
		<div class="row footer1">
			<div class="row">
				<div class="col-md-1 "></div>
				<div class="col-md-2 ">
					<div class="row">
						<div class="footer_context">联系我们</div>
						<div class="footer_context1">CONTECT</div>
					</div>					
				</div>
				<div class="col-md-3 ">
					<div class="footer_text">健身管理系统</div>
					<div class="footer_text1" >
						<div>地址：常熟市东南开发区湖山路99号</div>
						<div>电话：0537-5097777</div>
						<div>传真：0537-5097777</div>
					</div>
				</div>
			
				<div class="col-md-3 ">
					<div class="footer_text">联系方式</div>
					<div class="footer_text1" >
						<div>邮编：272000</div>
						<div>微信：18896736055</div>
						<div>邮箱：yixuanjianshen@163.com</div>
					</div>
				</div>
				
				<div class="col-md-3 ">
					<div class="footer_text">关于</div>
					<div class="footer_text1" >
						<div>男生健身</div>
						<div>女生健身</div>
						<div>健身营养</div>
					</div>
				</div>
			</div>
		</div>
	    <div class="row footer2">
	       Copyright © 2020 逸轩健身房 版权所有 All Rights Reserved 
	    </div>
	</footer>

</body>
</html>