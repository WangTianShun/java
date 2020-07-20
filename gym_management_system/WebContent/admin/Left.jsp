<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--导入bootstrap框架-->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script> 
    <!--导入自定义css-->
    <link rel="stylesheet" href="../css/admin_menu.css">
    <script type="text/javascript">
    	function loadPage(url) {
            $.ajax({
                type: "POST",
                url: url,
                async: true,
                dataType: "html",
                contentType: 'application/json; charset=utf-8',
                success: function (html) {
                    //$('#right').html(html);
                    $('#right').load(url);//load函数同样能实现效果
                }
            });
        }

    </script>
</head>
<body>
	<div class="navbar navbar-duomi navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/Admin/index.html" id="logo">健身房管理系统
				</a>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2  left">
				<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
					<li id="li_home" class="active">
						<a href="#">
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
							<li id="li_userAll"><a href="UserList.jsp" target="content" ><i class="glyphicon glyphicon-folder-close"></i> 基本信息管理</a></li>
							<li id="li_userAdd"><a href="#" onclick="loadPage('UserAdd.jsp')"><i class="glyphicon glyphicon-plus"></i> 添加用户管理</a></li>
							<li id="li_userOrder"><a href="AddUser.jsp" target="content"><i class="glyphicon glyphicon-list-alt"></i> 课程订单管理</a></li>
							<li id="li_userPass"><a href="#"><i class="glyphicon glyphicon-edit"></i> 修改密码管理</a></li>
						</ul> 
					</li>
					<li id="li_course">
						<a href="#courseManagement" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-book"></i>
							课程管理 
						</a>
					</li>
					<li id="li_teacher">
						<a href="./grid.html">
							<i class="glyphicon glyphicon-ruble"></i>
							教练管理
						</a>
					</li>
					<li id="li_equip">
						<a href="./charts.html">
							<i class="glyphicon glyphicon-credit-card"></i>
							器材管理
						</a>
					</li>
					<li>
						<a href="#oneselfManagement" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-user"></i>
							个人基本信息
							<span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
						</a>
						<ul id="oneselfManagement" class="nav nav-list collapse secondmenu" style="height: 0px;">
							<li id="li_oneselfAll"><a href="#"><i class="glyphicon glyphicon-folder-close"></i> 基本信息管理</a></li>
							<li id="li_oneselfPass"><a href="#"><i class="glyphicon glyphicon-edit"></i> 修改密码管理</a></li>
						</ul> 
					</li>
				</ul>	
			</div>
			<!--右侧的主题内容，用bootstrap的content类包含在一起 -->
			<div id="right" class="col-md-10">
			</div>
		</div>
	</div>
</body>
</html>