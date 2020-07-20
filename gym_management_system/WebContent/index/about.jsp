<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	                        <li><a href="${pageContext.request.contextPath}/index.jsp">首页 <span class="sr-only">(current)</span></a></li>
	                        <li><a href="${pageContext.request.contextPath}/uCoach_indexCoach">教练团队</a></li>
	                        <li><a href="${pageContext.request.contextPath}/uEquip_indexEquip">健身器材</a></li>
	                        <li><a href="${pageContext.request.contextPath}/uNews_indexNews">健身动态</a></li>
	                        <li class="active"><a href="${pageContext.request.contextPath}/index/about.jsp">关于我们</a></li>
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
	            	健身俱乐部
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_title1_1">
	            Fitness Club
	        </div>
	    </div>
	    <div class="row">
	    	<div class="col-md-4">
				<img alt="" src="${pageContext.request.contextPath }/img/boy.gif">
			</div>
			<div class="col-md-8">
		    	<div class="title4">
		        	<span>健身文化</span>
		        </div>
		         <div>
		         	<div>健身俱乐部是一个人员流失很大的行业，所以只有拥有了很好的企业文化和健身文化才能提高会员的满意度，提高员工的满意度和忠诚度，所以一个俱乐部要想成功，必须有好的文化作为支撑。</div><br>
					<div>一是竖立健身傍样，俱乐部内要张贴中外健身精英、业界颂军人物画面、宣传资料等，营造健身精神氛围。</div><br>
					<div>二是普及健身知识，俱乐部内要有免费阅读的各种健身杂志、刊物等供学员学手。</div><br>
					<div>三是有很好的休闲交流区域，供健友们交流、洽谈业务、积累人脉资源，鼓励健友们结成健身伙伴。</div><br>
					<div>四是有健全的助教体系和专业教练队伍，实时激励现场健身气氛。</div><br>
					<div>五是有恰到好处的宣传标语，口号或文化宣传牌，激励健友健身斗志和毅力。</div><br>
		    	</div>
	    	</div>
	    </div>   
	    <div class="row">
	    	<div class="title4">
	        	<span>体验服务</span>
	        </div>
		    <div>在同等硬件的基础上，究竟什么最适合你呢？毕竟，健身行业仍属于一个服务行业，作为消费者，更多的应该是希望得到相应软件方面的服务及价值的提升，如会员得到的优质的服务，会让你有宾至如归的感觉。</div><br>
			<div>美容SPA：健身房的附属设施，可以让你在健身之后得到放松，同时作为一种辅助手段，让你提高运动效果。在SPA里，会有更多针对女性的美容项目，可以使你不用到处奔波，运动完后做个美容，更会觉得方便和实用。</div><br>
			<div>按摩、理疗：相信你会了解按摩的效果，适当的运动配合专业的按摩，会缓解你一天的疲劳和减轻身体的酸痛。</div><br>
			<div>会员服务：对于会员入会后的服务，除了教练，就是这个部门了，他们可以帮助你解决入会后的很多问题，比如，你要出差，可以提前请假；运动中不小心划破手指，可以给你做些简单治疗。</div><br>
			<div>当然，最体现服务水平的，是当你走进健身房，每一个你碰到的员工和教练都能和你亲切地打招呼，朝你微笑；同时教练不急不躁，时常关切你的训练和饮食；在走的时候，向你道别，欢迎你再次光临，让你感到一种轻松的活力和休闲的快感</div><br>
		</div>
	    
		<div class="row">
	        <div class="fit_title1">
	            	环境展示
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_title1_1">
	            Environment show
	        </div>
	    </div>
	    <br/>
	    <div>
			<marquee scrolldelay="20ms" onmouseover="this.stop()" onmouseout="this.start()">
				<a href="${pageContext.request.contextPath }/img/environment1.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment1.png" height="200px"></a>
				<a href="${pageContext.request.contextPath }/img/environment2.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment2.png" height="200px"></a>
				<a href="${pageContext.request.contextPath }/img/environment3.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment3.png" height="200px"></a>
				<a href="${pageContext.request.contextPath }/img/environment4.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment4.png" height="200px"></a>
				<a href="${pageContext.request.contextPath }/img/environment5.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment5.png" height="200px"></a>
				<a href="${pageContext.request.contextPath }/img/environment6.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment6.png" height="200px"></a>
				<a href="${pageContext.request.contextPath }/img/environment7.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment7.png" height="200px"></a>
				<a href="${pageContext.request.contextPath }/img/environment8.png" target="_blank"><img src="${pageContext.request.contextPath }/img/environment8.png" height="200px"></a>
			</marquee>
		</div>
	   	<div class="row">
	        <div class="fit_title1">
	            	精英团队
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_title1_1">
	            Elite Team
	        </div>
	    </div><br>
	    <div class="row">
	    	<div class="col-md-4">
	            <img src="${pageContext.request.contextPath}/img/team1.png" class="img-responsive" alt="...">  
	        </div>
	        <div class="col-md-4">
	            <img src="${pageContext.request.contextPath}/img/team2.png" class="img-responsive" alt="...">  
	        </div>
	        <div class="col-md-4">
	            <img src="${pageContext.request.contextPath}/img/team3.png" class="img-responsive" alt="...">  
	        </div>
	    </div>
	    
	    
	</div>
	 <!-- 	足部 -->
	<jsp:include page="../user/footer.jsp" flush="true"/>
</body>
</html>