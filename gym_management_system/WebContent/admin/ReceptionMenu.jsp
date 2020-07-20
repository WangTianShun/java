<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../public/include.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--导入自定义css-->
    <link rel="stylesheet" href="../css/admin_menu.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2  left">
				<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
					<li id="li_home" class="active">
						<a href="${pageContext.request.contextPath}/admin/main.jsp" target="main">
							<i class="glyphicon glyphicon-th-large"></i>
							首页 
						</a>
					</li>
					<li>
						<a href="#userManagement" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-user"></i>
							用户管理
							<span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
						</a>
						<ul id="userManagement" class="nav nav-list collapse secondmenu" style="height: 0px;">
							<!-- 因为 a 标签的 target 属性是名为 frame_a 的 frame 框架，所以在点击链接时页面会显示在 frame框架中 -->
							<li><a href="${pageContext.request.contextPath}/aUser_findAllUser" target="main"  ><i class="glyphicon glyphicon-folder-close"></i> 基本信息管理</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/UserAdd.jsp" target="main"><i class="glyphicon glyphicon-plus"></i> 添加用户管理</a></li>
						</ul> 
					</li>
					<li>
						<a href="#cardManagement" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-picture"></i>
							会员卡管理
							<span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
						</a>
						<ul id="cardManagement" class="nav nav-list collapse secondmenu" style="height: 0px;">
							<!-- 因为 a 标签的 target 属性是名为 frame_a 的 frame 框架，所以在点击链接时页面会显示在 frame框架中 -->
							<li><a href="${pageContext.request.contextPath}/aCard_findAllCard" target="main"><i class="glyphicon glyphicon-book"></i> 基本会员卡管理</a></li>
							<li><a href="${pageContext.request.contextPath}/aCard_toSaveCard" target="main" ><i class="glyphicon glyphicon-plus"></i> 新增会员卡</a></li>
						</ul> 
					</li>
					<li>
						<a href="#courseManagement" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-book"></i>
							课程管理 
							<span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
						</a>
						<ul id="courseManagement" class="nav nav-list collapse secondmenu" style="height: 0px;">
							<!-- 因为 a 标签的 target 属性是名为 frame_a 的 frame 框架，所以在点击链接时页面会显示在 frame框架中 -->
							<li><a href="${pageContext.request.contextPath}/aCourse_findAllCourse" target="main" ><i class="glyphicon glyphicon-folder-close"></i> 基本课程管理</a></li>
							<li><a href="${pageContext.request.contextPath}/aCourse_toSaveCourse" target="main"><i class="glyphicon glyphicon-plus"></i> 添加课程</a></li>
						</ul> 
					</li>
					<li>
						<a href="#orderManagement" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-shopping-cart"></i>
							课程订单管理
							<span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
						</a>
						<ul id="orderManagement" class="nav nav-list collapse secondmenu" style="height: 0px;">
							<li><a href="${pageContext.request.contextPath}/aOrders_findAllOrders" target="main"><i class="glyphicon glyphicon-folder-close"></i> 基本订单管理</a></li>
							<li><a href="${pageContext.request.contextPath}/aOrders_toSaveOrders" target="main"><i class="glyphicon glyphicon-plus"></i> 添加课程订单</a></li>
						</ul> 
					</li>
					<li>
						<a href="#newsManagement" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-cd"></i>
							健身动态管理
							<span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
						</a>
						<ul id="newsManagement" class="nav nav-list collapse secondmenu" style="height: 0px;">
							<li><a href="${pageContext.request.contextPath}/aNews_findAllNews" target="main"><i class="glyphicon glyphicon-folder-close"></i> 基本新闻管理</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/NewsAdd.jsp" target="main"><i class="glyphicon glyphicon-plus"></i> 添加新闻</a></li>
						</ul> 
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/aReception_toPassword" target="main">
							<i class="glyphicon glyphicon-wrench"></i>
							修改密码
						</a>	
					</li>
					
				</ul>	
			</div>
		</div>
	</div>
</body>
</html>