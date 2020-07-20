<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../public/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--自定义css -->
	<link href="css/user_common.css" rel="stylesheet">
</head>
<body>
	<!-- 头部 -->
	<jsp:include page="header.jsp" flush="true"/>
	<div class="container">
		<div class="row">
	        <div class="fit_title1">
	            	教练团队
	        </div>
	    </div>
		<div class="row">
	        <div class="fit_title1_1">
	            coachTeam
	        </div>
	    </div>
		<div class="row" >
			<div class="title2">
                <div>
                	<img alt="" src="${pageContext.request.contextPath }/img/icon_5.jpg">
                    <span>教练帅照</span>
                </div>
            </div>
			<c:forEach items="${clist}" var="coach" >
				<div class="col-md-3 " >
					<div class="coach">
				    	<div class="thumbnail">
				        	<img src="${ pageContext.request.contextPath }/${coach.coach_image}">
				    	</div>
				    	<div>
				    		<div class="row title4_1">${coach.coach_grade}:</div>
				        	<div class="row title4_2">${coach.coach_name }</div>
				       </div>
			       </div>
			    </div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="title2">
                <div>
                	<img alt="" src="${pageContext.request.contextPath }/img/icon_6.jpg">
                    <span>健身教练必备素质</span>
                </div>
            </div>
			<div class="col-md-5">
				<img alt="" src="${pageContext.request.contextPath }/img/boy.gif">
			</div>
			<div class="col-md-7">
	        	<div class="title4">
	            	<span>简介</span>
	            </div>   
				<p>健身俱乐部健身教练，分为团体操课教练和私人教练，私人健身教练是指在健身俱乐部中一对一进行指导训练的专业健身教练，其作具有互动性、针对性等特点，并且是按课时收费的。团体操教练是一对多，一人带领多数会员在有氧操厅进行有氧运动的团体操课程（团体操课程包括：有氧健身操、有氧舞蹈、踏板、动感单车、搏击、普拉提、瑜伽等)</p>
				<div class="title4">
	            	<span>职责</span>
	            </div> 
				<p>健身教练，其最重要的职责就是帮助顾客获得健康，来健身的顾客需要的是科学的健身指导，并以此获得身体的健康。因此，健身教练应该具有比较专业的人体解剖、生理、医学、营养和运动技能知识，此外，还应懂得心理学。因为教练要善于与顾客沟通，以准确了解顾客的需求并提供帮助。见多识广是一个健身教练起码的素质。比如，为让健身运动达到最好效果，教练还应是“私人医生”，掌握一定的健康知识，了解会员的饮食状况、工作性质、睡眠质量等。针对不同的人，制定出不同的训练方法。但同时，健身教练只是针对会员的健康锻炼提出指导，对部分病后或术后恢复进行一定指导，但不能取代医生的治病功能。</p>
				
			</div>
			<div class="row">
				<div class="title4">
	            	<span>教练能帮你做什么</span>
	            </div>
				<div>
					<div>1、带你入门。当你第一次站到那些高高低低的器材面前，或者第一次站在节奏强劲的舞曲中准备跳操时，绝大部分人会感到手足无措。特别是那些身材原本就比较臃肿的“胖哥胖妹”们，甚至会产生很大的恐惧感，近而还会影响自己的自信心而使自己的健身计划泡汤。这时，如果有个温和耐心的教练在你身旁，可以很快稳定健身者的情绪，使初学者能够很快进入状态，入门其实并不难，但是有一个好的开头已经成功了一半，因此教练的作用不能忽视。</div><br/>
					<div>2、不断提高。众所周知，训练计划需要不断地调整，才能让身体更好地发展，更快地进步。然而有些制约你自己改变的因素是自身所看不到的，旁观者清嘛。连国际上著名的健身、健美运动员都有自己的私人教练，你当然更需要了。</div><br/>
					<div>3、你需要一个交流平台并不断地摄取新的知识。健身行业的知识更新得非常快，私教由于站在行业的最前端，可以及时地把这些更新的东西告诉你，协助你更快地达到目标。</div><br/>
					<div>4、协助你达到极限。器械练习是需要达到一定的极限程度，才能使你的身体最大限度地收到效果，因此，教练正确的协助是非常必要的。</div><br/>
					<div>5、训练及饮食建议。针对你个人的训练及饮食制定的计划，是收到成效的关键。</div><br/>
					<div>6、体形修正，体态调整。不同的体形，需要不同的训练指导。</div><br/>
					<div>7、大型俱乐部的教练培训体系，是你得到安全、先进健身的有效保障。</div><br/>
				</div>
			</div>
		</div>
	</div>
	<!-- 	足部 -->
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>