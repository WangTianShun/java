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
    	<h3 style="text-align: center;">修改会员卡信息</h3>
        <form action="${pageContext.request.contextPath}/aCard_updateCard" method="post">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="card_id" value="${updateCard.card_id}">
			<div class="form-group">
            	<label for="card_no">会员卡号：</label>
            	<input type="text" class="form-control" id="card_no" name="card_no" readonly="readonly" value="${updateCard.card_no}" placeholder="请输入用户名" />
          	</div>
          	<div class="form-group">
            	<label for="user.user_id" >持卡人：</label>
            	<select id="user.user_id" name="user.user_id" class="form-control">
            		<c:forEach var="list" items="${ulist }">
            			<option value="${list.user_id}" <c:if test="${updateCard.user.user_id == list.user_id }">selected</c:if> >${list.username} </option>
            		</c:forEach>                    
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="card_grade">会员等级：</label>
            	<select class="form-control" name="card_grade" id="card_grade">
            	<c:if test="${updateCard.card_grade == '白银会员'}">
            		<option value="白银会员" selected>白银会员</option>
            		<option value="黄金会员">黄金会员</option>
            		<option value="砖石会员">砖石会员</option>
            	</c:if>
            	<c:if test="${updateCard.card_grade == '黄金会员'}">
            		<option value="白银会员">白银会员</option>
            		<option value="黄金会员" selected}>黄金会员</option>
            		<option value="砖石会员">砖石会员</option>
            	</c:if>	
            	<c:if test="${updateCard.card_grade == '砖石会员'}">
            		<option value="白银会员">白银会员</option>
            		<option value="黄金会员">黄金会员</option>
            		<option value="砖石会员" selected>砖石会员</option>
            	</c:if>	
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="card_begin">开卡日期：</label>
            	<input type="date" class="form-control" value="<fmt:formatDate value="${updateCard.card_begin}" pattern="yyyy-MM-dd"/>" id="card_begin"  name="card_begin" placeholder="请输入开卡日期"/>
          	</div>
          
          	<div class="form-group">
            	<label for="card_end">到期日期：</label>
            	<input type="date" class="form-control" value="<fmt:formatDate value="${updateCard.card_end}" pattern="yyyy-MM-dd"/>" id="card_end"  name="card_end" placeholder="请输入到期时间"/>
          	</div>

          	<div class="form-group">
            	<label for="card_account">开卡金额：</label>
            	<input type="text" id="card_account" class="form-control" value="${updateCard.card_account}" name="card_account" placeholder="请输入开卡金额"/>
          	</div>
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>