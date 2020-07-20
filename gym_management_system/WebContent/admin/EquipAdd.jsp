<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	<h3 style="text-align: center;">添加健身器材</h3>
     	<div id="errorMsg" style="color:red;text-align: center">${equip_msg}</div> 
        <form action="${pageContext.request.contextPath}/aEquip_saveEquip" method="post" enctype="multipart/form-data">
           <div class="form-group">
            	<label for="equip_no">器材编号：</label>
            	<input type="text" class="form-control" id="equip_no" name="equip_no"  placeholder="请输入器材编号" />
          	</div>
          	
			<div class="form-group">
            	<label for="equip_name">名称：</label>
            	<input type="text" class="form-control" id="equip_name" name="equip_name"  placeholder="请输入名称" />
          	</div>
          	<div class="form-group">
            	<label for="equip_image">器材图片：</label>
            	<input type="file" name="upload" id="equip_image" />
          	</div>
          	<div class="form-group">
            	<label for="equip_type">类型：</label>
            	<select name="equip_type" class="form-control">
					<option value="有氧健身器材">有氧健身器材</option>
					<option value="力量训练器材">力量训练器材</option>
					<option value="自由力量训练器材">自由力量训练器材</option>
				</select>
          	</div>
          	<div class="form-group">
            	<label for="equip_count">数量：</label>
            	<input type="text" id="equip_count" class="form-control"  name="equip_count" placeholder="请输入数量"/>
          	</div>
          	<div class="form-group">
            	<label for="equip_company">生产商：</label>
            	<input type="text" id="equip_company" class="form-control"  name="equip_company" placeholder="请输入生产商"/>
          	</div>
          	<div class="form-group">
            	<label for="coach_entry">采购日期：</label>
            	<input type="date" class="form-control" id="equip_purchase"  name="equip_purchase" placeholder="请输入采购日期"/>
          	</div>
          	<div class="form-group">
            	<label for="equip_state">状态：</label>
            	<input type="text" id="equip_state" class="form-control"  name="equip_state" placeholder="请输入状态"/>
          	</div>
			
             <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="添加" />
                <input class="btn btn-default" type="reset" value="重置" />
             </div>
        </form>    
    </div>
</body>
</html>