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
	<link href="css/user_common.css" rel="stylesheet">
	<style type="text/css">
		.center{
			background: yellow;
			width: 100%;
			height:680px;
		}
		.main{
		background: #CCFFFF;
		}
	
	</style>
</head>
<body>
	<!-- 	头部 -->
	<jsp:include page="header.jsp"  flush="true"/>
	<div class="container main">
		<div class="col-md-4">
			<div class="row">
				<div class="fit_title1">
					我的会员卡
			    </div>
			</div>
			<div class="row">
			    <div class="fit_title1_1">
		            My Card
		        </div>
		    </div>
		    <div class="title4">会员卡信息</div>
		    <div class="thumbnail">
		    	<img src="${pageContext.request.contextPath }/img/card.png">
		    </div>
		    <!-- 判断是否办理过会员卡 -->
			<c:if test="${card==null }">
				<center><h2>您尚未办理会员卡!</h2></center>
			</c:if>
			<c:if test="${card!=null }">
		        <table border="1" class="table table-bordered table-hover">
		            <tr>
		                <td class="success">会员卡号</td>
		                <td>${card.card_no}</td>
		            </tr>
		            <tr>
			            <td class="success">持卡人</td>
			            <td>${card.user.username}</td>
		            </tr>
		            <tr>
		            	<td class="success">会员等级</td>
		            	<td>${card.card_grade}</td>
		            </tr>
		              <tr >
		            	<td class="success">开卡日期</td>
		            	<td><fmt:formatDate value="${card.card_begin}" pattern="yyyy-MM-dd"/></td>
		            </tr>
		            <tr>
		            	<td class="success">到期日期</td>
		            	<td><fmt:formatDate value="${card.card_end}" pattern="yyyy-MM-dd"/></td>
		            </tr>
		            <tr>  
		            	<td class="success">开卡金额</td>
		                <td>${card.card_account}</td>
		            </tr> 
		        </table>
	        </c:if>
		</div>
		<div class="col-md-1 center"></div>
		<div class="col-md-7">
			<div class="row">
				<div class="fit_title1">
					会员须知
			    </div>
			</div>
			<div class="row">
			    <div class="fit_title1_1">
		            Merbership Information
		        </div>
		    </div>
			<div class="title4">会员福利</div>
			<div>
				<div>1、体测:</div>
				<div>办理会员卡我们会提供体测，有时还会定期免费回访式体测，以观察会员的体质变化，给会员一步步的建议……</div><br/>
				<div>2、初步的健身方案:</div>
				<div>我们会提供一个书面的健身方案，是个宏观的初步的建议，仅供你参考，当然教练也会提供几条建议。</div><br/>
				<div>3、教授场内所有器械的使用:</div>
				<div>场内所有器械，包括有氧和器械的，教练都有义务教你使用方法和注意事项，这个工作一般交给体测你的或给你分配的巡场教练，一定要认真听和实践，正确的使用方法不但关系效果问题，更重要的是安全！</div><br/>
				<div>4、安全舒适的场地和器械:</div>
				<div>这个安全舒适是指，器械区、自由活动区、操厅及更衣间等场地应该平整无破损，软硬干湿适度，空气流动和温度舒适等；器械应该种类齐全，无影响锻炼的破损和故障，无汗渍等。</div><br/>
				<div>5、宽阔的场地:</div>
				<div>提供非常宽阔的场地，不需要出现拥挤的现象，场地和器械都比较充足</div><br>
			</div>
			<div class="title4">使用说明</div>
			<div>1、此卡仅限本人使用，不得转让他人</div>
			<div>2、本卡请在有效期内使用</div>
			<div>3、进入健身房，会员请主动出示此卡</div>
			<div>4、请妥善保管，若有遗失或损失，请及时去健身房办理挂失，补卡手续</div>
		</div>
	</div>
	<!-- 	足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>