<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ include file="../public/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <title></title>
    <!--导入自定义css-->
    <link href="${pageContext.request.contextPath}/css/admin_common.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_common.js"></script>
    <script type="text/javascript">
	    function deleteUser(equip_id){
	    	//用户安全提示
	        if(confirm("您确定要删除吗？")){
	        //访问路径
	        location.href="${pageContext.request.contextPath}/aEquip_deleteEquip?equip_id="+equip_id;
	        }
	    }
    </script>
</head>
<body>

	<div class="container">
	    <div style="float: left;">
	
	        <form  class="form-inline" action="${pageContext.request.contextPath}/aEquip_findAllEquip" method="post">
	            <div class="form-group">
	                <label for="exampleInputName2">名称</label>
	                <input type="text" name="equip_name" value="${condition.equip_name[0] }" class="form-control" id="exampleInputName2" >
	            </div>
	            <div class="form-group">
	                <label for="exampleInputName3">类型</label>
	                <input type="text" name="equip_type" value="${condition.equip_type[0] }" class="form-control" id="exampleInputName3" >
	            </div>
				<div class="form-group">
	                <label for="exampleInputName4">状态</label>
	                <input type="text" name="equip_state" value="${condition.equip_state[0] }" class="form-control" id="exampleInputName4" >
	            </div>
	            <button type="submit" class="btn btn-default">查询</button>
	        </form>
	
	    </div>
	
	    <div style="float: right;margin: 5px;">
	
	        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/EquipAdd.jsp">添加健身器材</a>
	        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
	
	    </div>
	    <form id="form" action="${pageContext.request.contextPath}/aEquip_delSelectEquip" method="post">
	        <table border="1" class="table table-bordered table-hover">
	            <tr class="success">
	                <th><input type="checkbox" id="firstCb"></th>
	                <th>编号</th>
	                <th>器材编号</th>
	                <th>名称</th>
	                <th>图片</th>
	                <th>类型</th>
	                <th>数量</th>
	                <th>生产商</th>
	                <th>采购日期</th>
	                <th>状态</th>
	                <th>操作</th>
	            </tr>
	
	            <c:forEach items="${pageBean.list}" var="equip" varStatus="s">
	                <tr>
	                    <td><input type="checkbox" name="uid" value="${equip.equip_id}"></td>
	                    <td>${s.count}</td>
	                    <td>${equip.equip_no}</td>
	                    <td>${equip.equip_name}</td>
	                    <td><img width="45px" height="40px" src="${ pageContext.request.contextPath }/${equip.equip_image}"></td>
	                    <td>${equip.equip_type}</td>
	                    <td>${equip.equip_count}</td>
	                    <td>${equip.equip_company}</td>
	                    <td><fmt:formatDate value="${equip.equip_purchase}" pattern="yyyy-MM-dd"/></td>
	                    <td>${equip.equip_state}</td>
	                    <td>
	                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/aEquip_findEquipByEquip_id?equip_id=${equip.equip_id}">修改</a>&nbsp;
	                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${equip.equip_id})">删除</a>
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
	                        <a href="${pageContext.request.contextPath}/aEquip_findAllEquip?currentPage=${pageBean.currentPage-1}&equip_name=${condition.equip_name[0]}&equip_type=${condition.equip_type[0]}&equip_state=${condition.equip_state[0]}" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                        </a>
	                    </li>
	                <%-- 分页激活状态和禁止状态 --%>
	                <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
	                    <c:if test="${pageBean.currentPage == i}">
	                        <li class="active"><a href="${pageContext.request.contextPath}/aEquip_findAllEquip?currentPage=${i}&equip_name=${condition.equip_name[0]}&equip_type=${condition.equip_type[0]}&equip_state=${condition.equip_state[0]}">${i}</a></li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != i}">
	                        <li><a href="${pageContext.request.contextPath}/aEquip_findAllEquip?currentPage=${i}&equip_name=${condition.equip_name[0]}&equip_type=${condition.equip_type[0]}&equip_state=${condition.equip_state[0]}">${i}</a></li>
	                    </c:if>
	                </c:forEach>
	                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
	                    <%--  对于点击 》 如果currentPage大于totalPage,则让他始终为totalPage--%>
	                        <li class="disabled">
	                            <a href="${pageContext.request.contextPath}/aEquip_findAllEquip?currentPage=${pageBean.currentPage}&equip_name=${condition.equip_name[0]}&equip_type=${condition.equip_type[0]}&equip_state=${condition.equip_state[0]}" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
	                    </c:if>
	                    <c:if test="${pageBean.currentPage != pageBean.totalPage}">
	                        <li>
	                            <a href="${pageContext.request.contextPath}/aEquip_findAllEquip?currentPage=${pageBean.currentPage+1}&equip_name=${condition.equip_name[0]}&equip_type=${condition.equip_type[0]}&equip_state=${condition.equip_state[0]}" aria-label="Next">
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