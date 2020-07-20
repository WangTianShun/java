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
    	<h3 style="text-align: center;">修改健身器材信息</h3>
        <form action="${pageContext.request.contextPath}/aEquip_updateEquip" method="post" enctype="multipart/form-data">
            <!--  隐藏域 提交id-->
            <input type="hidden" name="equip_id" value="${updateEquip.equip_id}">
			<div class="form-group">
            	<label for="equip_no">器材编号：</label>
            	<input type="text" class="form-control" id="equip_no" name="equip_no"  value="${updateEquip.equip_no}" readonly="readonly" placeholder="请输入器材编号" />
          	</div>
          	<div class="form-group">
            	<label for="equip_name">名称：</label>
            	<input type="text" class="form-control" id="equip_name" name="equip_name"  value="${updateEquip.equip_name}"  placeholder="请输入名称" />
          	</div>
          	<div class="form-group">
            	<label for="equip_image">器材图片：</label>
            	<input type="file" name="upload" id="equip_image" />
          	</div>
          	<div class="form-group">
            	<label for="equip_type">类型：</label>
            	<select class="form-control" name="equip_type" id="equip_type">
	            	<c:if test="${updateEquip.equip_type == '有氧健身器材'}">
	            		<option value="有氧健身器材" selected>有氧健身器材</option>
	            		<option value="力量训练器材">力量训练器材</option>
	            		<option value="自由力量训练器材">自由力量训练器材</option>
	            	</c:if>
	            	<c:if test="${updateEquip.equip_type == '力量训练器材'}">
	            		<option value="有氧健身器材">有氧健身器材</option>
	            		<option value="力量训练器材" selected>力量训练器材</option>
	            		<option value="自由力量训练器材">自由力量训练器材</option>
	            	</c:if>
	            	<c:if test="${updateEquip.equip_type == '自由力量训练器材'}">
	            		<option value="有氧健身器材">有氧健身器材</option>
	            		<option value="力量训练器材">力量训练器材</option>
	            		<option value="自由力量训练器材" selected>自由力量训练器材</option>
	            	</c:if>
            	</select>
          	</div>
          	<div class="form-group">
            	<label for="equip_count">数量：</label>
            	<input type="text" class="form-control" id="equip_count" name="equip_count"  value="${updateEquip.equip_count}" placeholder="请输入数量" />
          	</div>
          	<div class="form-group">
            	<label for="equip_company">生产商：</label>
            	<input type="text" class="form-control" id="equip_company" name="equip_company"  value="${updateEquip.equip_company}" placeholder="请输入生产商" />
          	</div>
          	<div class="form-group">
            	<label for="equip_purchase">采购日期：</label>
            	<input type="date" class="form-control" value="<fmt:formatDate value="${updateEquip.equip_purchase}" pattern="yyyy-MM-dd"/>" id="equip_purchase"  name="equip_purchase" placeholder="请输入入职日期"/>
          	</div>
          	<div class="form-group">
            	<label for="equip_state">状态：</label>
            	<input type="text" class="form-control" id="equip_state" name="equip_state"  value="${updateEquip.equip_state}" placeholder="请输入状态" />
          	</div>
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>