<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="<c:url value='/css/sej/main/main.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/main/slideShow.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/main/slideShow.js'/>"></script>
	</head>
	<body>
		<div id="mainWrap">			
		
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
		   <div id="searchResultbox">
			<section>
				<article id="content1"> <!-- 탭메뉴 -->
			        <div id="hobbyMenu">
						<ul id="hobbyMenuItem">
							<li><a href="/sun/allmoimdetail2/1"><img src="<c:url value='/img/hobbyCtg/1_sport2.png'/>" id="menuImg"><br>운동</a></li>
							<li><a href="/sun/allmoimdetail2/2"><img src="<c:url value='/img/hobbyCtg/2_outdoor2.png'/>" id="menuImg"><br>아웃도어</a></li>
							<li><a href="/sun/allmoimdetail2/3"><img src="<c:url value='/img/hobbyCtg/3_study2.png'/>" id="menuImg"><br>자기계발</a></li>
							<li><a href="/sun/allmoimdetail2/4"><img src="<c:url value='/img/hobbyCtg/4_travel2.png'/>" id="menuImg"><br>여행</a></li>
							<li><a href="/sun/allmoimdetail2/5"><img src="<c:url value='/img/hobbyCtg/5_cook2.png'/>" id="menuImg"><br>요리&음식</a></li>
							<li><a href="/sun/allmoimdetail2/6"><img src="<c:url value='/img/hobbyCtg/6_animal2.png'/>" id="menuImg"><br>애견&애묘</a></li>
							<li><a href="/sun/allmoimdetail2/7"><img src="<c:url value='/img/hobbyCtg/7_picture2.png'/>" id="menuImg"><br>사진&영상</a></li>
						</ul>
					</div>	

				</article>
			</section>
			<section>
				<article id="slideShow"> <!-- 슬라이드 쇼  -->
					<!-- 이전/다음 버튼 -->
					<div id="prevNextButtonBox">
						<img src="<c:url value='/img/sej/leftButton.png'/>" id="prevButton">
						<img src="<c:url value='/img/sej/rightButton.png'/>" id="nextButton">
					</div>				
					<div id="slideShowBox">
						<div id="slidePanel">
							<img src="<c:url value='/img/sej/banner/003.png'/>"  class="slideImage">
							<img src="<c:url value='/img/sej/banner/004.png'/>"  class="slideImage">
							<img src="<c:url value='/img/sej/banner/002.png'/>" class="slideImage">
							<img src="<c:url value='/img/sej/banner/001.png'/>" class="slideImage">
							<img src="<c:url value='/img/sej/banner/005.png'/>" class="slideImage">
						</div>
					</div> <!-- slideShowBox 끝 -->
				</article>
			</section>
			<section>
				<div id="bestItem">
					<div id="itemTop">
						<div id="bestName">BEST 모임</div>
						<div id="allView"><a href="#">전체 보기</a></div>
					</div>
					 <div id="bestMenu">
						<ul id="bestMenuList">
							<c:forEach items="${gatListBest}" var="gat" begin="0" end="2"><li>	
									<a href="<c:url value='/sun/detailgat/${gat.gatNo}'/>"><img src="<c:url value='/images/${gat.gatPhoto}'/>" id="bestImg">	
									<br id="bestBr"><p id="gatherCtg">소모임</p>
									<br id="bestBr"><p id="gatherName">${gat.gatName}</p>
									<br id="bestBr"><div id="gatherArea">${gat.gatArea}</div> </a></li>
							</c:forEach>
						</ul>
					</div>	
				</div>
				
				<div id="bestItem">
					<div id="itemTop">
						<div id="bestName">BEST 클래스</div>
						<div id="allView"><a href="#">전체 보기</a></div>
					</div>
					 <div id="bestMenu">
						<ul id="bestMenuList">

							<c:forEach items="${classListBest}" var="classVo" begin="0" end="2"><li>	
									<a href="#"><img src="<c:url value='/images/${classVo.classPhoto}'/>" id="bestImg">
									<br id="bestBr"><p id="gatherCtg">클래스</p>
									<br id="bestBr"><p id="gatherName">${classVo.classTitle}</p>
									<br id="bestBr"><div id="gatherArea">${classVo.classArea}</div> </a></li>
							</c:forEach>
						</ul>
					</div>	
				</div>
				
				<div id="bestItem">
					<div id="itemTop">
						<div id="bestName">신규 모임</div>
						<div id="allView"><a href="#">전체 보기</a></div>
					</div>
					 <div id="bestMenu">
						<ul id="bestMenuList">
							<c:forEach items="${gatListNew}" var="gat" begin="0" end="2"><li>	
									<a href="<c:url value='/sun/detailgat/${gat.gatNo}'/>"><img src="<c:url value='/images/${gat.gatPhoto}'/>" id="bestImg">	
									<br id="bestBr"><p id="gatherCtg">소모임</p>
									<br id="bestBr"><p id="gatherName">${gat.gatName}</p>
									<br id="bestBr"><div id="gatherArea">${gat.gatArea}</div> </a></li>
							</c:forEach>
						</ul>
					</div>	
				</div>
				<div id="bestItem">
					<div id="itemTop">
						<div id="bestName">신규 클래스</div>
						<div id="allView"><a href="#">전체 보기</a></div>
					</div>
					 <div id="bestMenu">
						<ul id="bestMenuList">
							<c:forEach items="${classListNew}" var="classVo" begin="0" end="2"><li>	
									<a href="#"><img src="<c:url value='/images/${classVo.classPhoto}'/>" id="bestImg">	
									<br id="bestBr"><p id="gatherCtg">클래스</p>
									<br id="bestBr"><p id="gatherName">${classVo.classTitle}</p>
									<br id="bestBr"><div id="gatherArea">${classVo.classArea}</div> </a></li>
							</c:forEach>
						</ul>
					</div>	
				</div>
				
			</section>
			</div>
		   
		<%-- 	<!-- chatting Button  -->
		    <jsp:include page="/WEB-INF/views/sej/chatBtn.jsp" flush='true' />
		 --%>	
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
	</body>
</html>

