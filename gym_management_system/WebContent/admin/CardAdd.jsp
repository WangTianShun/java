<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    	<h3 style="text-align: center;">新增会员卡</h3>
    	<div id="errorMsg" style="color:red;text-align: center">${card_msg}</div>
        <form action="${pageContext.request.contextPath}/aCard_saveCard" method="post">
           
			<div class="form-group">
            	<label for="card_no">会员卡号：</label>
            	<input type="text" class="form-control" id="card_no" name="card_no"  placeholder="请输入会员卡号" />
          	</div>
          	<div class="form-group">
            	<label for="user.user_id" >持卡人：</label>
            	<select id="user.user_id" name="user.user_id" class="form-control">
            		<c:forEach items="${ulist }" var="u">
            			<option value="${u.user_id }">${u.username}</option>
            		</c:forEach>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="card_grade">会员卡等级：</label>
            	<select name="card_grade" class="form-control">
					<option value="白银会员">白银会员</option>
					<option value="黄金会员">黄金会员</option>
					<option value="砖石会员">砖石会员</option>
				</select>
          	</div>
          	<div class="form-group">
            	<label for="card_begin">开卡日期：</label>
            	<input type="date" class="form-control" id="card_begin"  name="card_begin" placeholder="请输入开卡日期"/>
          	</div>
			<div class="form-group">
            	<label for="card_end">到期日期：</label>
            	<input type="date" class="form-control" id="card_end"  name="card_end" placeholder="请输入到期日期"/>
          	</div>
          	<div class="form-group">
            	<label for="card_account">开卡金额：</label>
            	<input type="text" id="card_account" class="form-control"  name="card_account" placeholder="请输入开卡金额"/>
          	</div>
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="添加" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>