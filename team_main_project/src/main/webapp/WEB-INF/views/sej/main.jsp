<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="<c:url value='/css/sej/main.css'/>" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div id="wrap">			
		
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
			<section>
				<article id="content1"> <!-- 탭메뉴 -->
			        <div id="hobbyMenu">
						<ul id="hobbyMenuItem">
							<li><a href="#"><img src="<c:url value='/image/hobbyCtg/1_sport.jpg'/>" id="menuImg"><br>운동</a></li>
							<li><a href="#"><img src="<c:url value='/image/hobbyCtg/2_outdoor.jpg'/>" id="menuImg"><br>아웃도어</a></li>
							<li><a href="#"><img src="<c:url value='/image/hobbyCtg/3_study.jpg'/>" id="menuImg"><br>자기계발</a></li>
							<li><a href="#"><img src="<c:url value='/image/hobbyCtg/4_travel.jpg'/>" id="menuImg"><br>여행</a></li>
							<li><a href="#"><img src="<c:url value='/image/hobbyCtg/5_cook.jpg'/>" id="menuImg"><br>요리&음식</a></li>
							<li><a href="#"><img src="<c:url value='/image/hobbyCtg/6_animal.jpg'/>" id="menuImg"><br>애견&애묘</a></li>
							<li><a href="#"><img src="<c:url value='/image/hobbyCtg/7_picture.jpg'/>" id="menuImg"><br>사진&영상</a></li>
						</ul>
					</div>	

				</article>
				
				<article id="content2"> <!-- 베스트 상품 -->
					
				</article>
			</section>
			
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
	</body>
</html>

