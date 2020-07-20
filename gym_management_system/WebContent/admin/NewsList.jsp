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
function deleteBtn(news_id){
    //用户安全提示
    if(confirm("您确定要删除吗？")){
        //访问路径
        location.href="${pageContext.request.contextPath}/aNews_deleteNews?news_id="+news_id;
    }
}
</script>
</head>
<body>
	<div class="container">
		<div style="float: left;">
	
	        <form  class="form-inline" action="${pageContext.request.contextPath}/aNews_findAllNews" method="post">    
	            <div class="form-group">
	                <label for="exampleInputName2">编号</label>
	                <input type="text" name="news_id" value="${news.news_id }" class="form-control" id="exampleInputName2" >
	            </div>
	             <div class="form-group">
	                <label for="exampleInputName3">标题</label>
	                <input type="text" name="news_title" value="${news.news_title }" class="form-control" id="exampleInputName3" >
	            </div>
	            <div class="form-group">
	                <label for="exampleInputName3">日期</label>
	                <input type="date" name="news_time" value="<fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/>"  class="form-control" id="exampleInputName3" >
	            </div>
	            <button type="submit" class="btn btn-default">查询</button>
	        </form>
	    </div>
	    
	    <div style="float: right;margin: 5px;">
	
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/NewsAdd.jsp">添加新闻</a>
	        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
	
	    </div>
	    <form id="form" action="${pageContext.request.contextPath}/aNews_delSelectNews" method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	                <th><input type="checkbox" id="firstCb"></th>
	                <th>编号</th>
	                <th>标题</th>
	                <th>日期</th>
	                <th>内容</th>
	                <th>操作</th>
	            </tr>
	
	            <c:forEach items="${pageBean.list}" var="news" varStatus="s">
	                <tr>
	                    <td><input type="checkbox" name="uid" value="${news.news_id}"></td>
	                    <td>${s.count}</td>
	                    <td>${news.news_title}</td>
	                    <td><fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/></td>
	                    <td>${news.news_content}</td>
	                    <td>
	                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/aNews_findNewsByNews_id?news_id=${news.news_id}">修改</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteBtn(${news.news_id})">删除</a>
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
	                        <a href="${pageContext.request.contextPath}/aNews_findAllNews?currentPage=${pageBean.currentPage-1}&news_id=${news.news_id }&news_title=${news.news_title}&news_time=<fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/>" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/aNews_findAllNews?currentPage=${i}&news_id=${news.news_id }&news_title=${news.news_title}&news_time=<fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/>">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/aNews_findAllNews?currentPage=${i}&news_id=${news.news_id }&news_title=${news.news_title}&news_time=<fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/>">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/aNews_findAllNews?currentPage=${pageBean.currentPage}&news_id=${news.news_id }&news_title=${news.news_title}&news_time=<fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/>" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/aNews_findAllNews?currentPage=${pageBean.currentPage+1}&news_id=${news.news_id }&news_title=${news.news_title}&news_time=<fmt:formatDate value="${news.news_time}" pattern="yyyy-MM-dd"/>" aria-label="Next">
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