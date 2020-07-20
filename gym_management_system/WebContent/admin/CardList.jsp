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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_common.js"></script>
<script type="text/javascript">
function deleteBtn(card_id){
    //用户安全提示
    if(confirm("您确定要删除吗？")){
        //访问路径
        location.href="${pageContext.request.contextPath}/aCard_deleteCard?card_id="+card_id;
    }
}
</script>
</head>
<body>
	<div class="container">
		<div style="float: left;">
	
	        <form  class="form-inline" action="${pageContext.request.contextPath}/aCard_findAllCard" method="post">
	            <div class="form-group">
	                <label for="exampleInputName2">会员卡号</label>
	                <input type="text" name="card_no" value="${card.card_no}" class="form-control" id="exampleInputName2" >
	            </div>
	            <div class="form-group">
	                <label for="exampleInputName4">到期日期</label>
	                <input type="date" name="card_end" value="<fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/>"  class="form-control" id="exampleInputName4" >
	            </div>
	            <button type="submit" class="btn btn-default">查询</button>
	        </form>
	    </div>
	    
	    <div style="float: right;margin: 5px;">
	
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/aCard_toSaveCard">添加会员卡</a>
	        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
	
	    </div>
	    <form id="form" action="${pageContext.request.contextPath}/aCard_delSelectCard" method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	                <th><input type="checkbox" id="firstCb"></th>
	                <th>编号</th>
	                <th>会员卡号</th>
	                <th>持卡人</th>
	                <th>会员等级</th>
	                <th>开卡日期</th>
	                <th>到期日期</th>
	                <th>开卡金额</th>
	                <th>操作</th>
	            </tr>
	
	            <c:forEach items="${pageBean.list}" var="card" varStatus="s">
	                <tr>
	                    <td><input type="checkbox" name="uid" value="${card.card_id}"></td>
	                    <td>${s.count}</td>
	                    <td>${card.card_no}</td>
	                    <td>${card.user.username}</td>
	                    <td>${card.card_grade}</td>
	                    <td><fmt:formatDate value="${card.card_begin}" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/></td>
	                    <td>${card.card_account}</td>
	                    <td>
	                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/aCard_findCardByCard_id?card_id=${card.card_id}">修改</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteBtn(${card.card_id})">删除</a>
	                    </td>
	                </tr>
	            </c:forEach>
	        </table>
	    </form>
		<div>
	        <nav aria-label="Page navigation">
	            <ul class="pagination">
	                <c:if test="${pageBean.currentPage == 1}">
	                    <li class="disabled">
	                </c:if>
	                <c:if test="${pageBean.currentPage != 1}">
	                    <li>
	                </c:if>
	                        <a href="${pageContext.request.contextPath}/aCard_findAllCard?currentPage=${pageBean.currentPage-1}&card_no=${card.card_no}&card_end=<fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/>" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/aCard_findAllCard?currentPage=${i}&card_no=${card.card_no}&card_end=<fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/>">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/aCard_findAllCard?currentPage=${i}&card_no=${card.card_no}&card_end=<fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/>">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/aCard_findAllCard?currentPage=${pageBean.currentPage}&card_no=${card.card_no}&card_end=<fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/>" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/aCard_findAllCard?currentPage=${pageBean.currentPage+1}&card_no=${card.card_no}&card_end=<fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/>" aria-label="Next">
	                            <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                <span style="font-size: 25px;margin-left: 5px;">
	                    共${pageBean.totalCount}条记录，共${pageBean.totalPage}页
	                </span>
	            </ul>
	        </nav>
	    </div>
	</div>
</body>
</html>