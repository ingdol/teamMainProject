<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체모임(필터)</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/sun/allmoim.css'/>" rel="stylesheet"	type="text/css">
<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/sun/allmoim.js'/>"></script>
</head>
<body>
	<div id="wrap">			
		    
		<h1 id="sectioninfo">전체모임</h1>
		<!-- -----------------header,nav메뉴 부분---------------- -->
		
		<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		<!-- -----------------middle부분---------------- -->
		<section id="allmoimmiddle">
			<h1 id="sectioninfo">중간섹션</h1>

			<!-- 전체모임에서 필터 -->
			<div id="allfilter" class="allfilter">
				<form class="dropdown">
					<fieldset>
						<legend id="sectioninfo">지역정보</legend>
						<div>
							<select name="area">
								<option value="all" selected>전체지역
								<option value="seoul">서울시
								<option value="gyeonggi">경기도
								<option value="gyeongsang">경상도
								<option value="jeolla">전라도
							</select>
						</div>
					</fieldset>
				</form>
				<form class="dropdown">
					<fieldset>
						<legend id="sectioninfo">관심사</legend>
						<div>
							<c:forEach items="${ctg}" begin="0" end="0" var="ct">
							<select name="hobbyselect" id="hobbyselect">
									<option class="option" value="--">관심사
									<option class="option" value="all" <c:if test="${ct.hobbyNo eq '10'}">selected</c:if>>전체목록
									<option class="option" value="1" <c:if test="${ct.hobbyNo eq '1'}">selected</c:if>>운동
									<option class="option" value="2" <c:if test="${ct.hobbyNo eq '2'}">selected</c:if>>아웃도어
									<option class="option" value="3" <c:if test="${ct.hobbyNo eq '3'}">selected</c:if>>자기계발
									<option class="option" value="4" <c:if test="${ct.hobbyNo eq '4'}">selected</c:if>>여행
									<option class="option" value="5" <c:if test="${ct.hobbyNo eq '5'}">selected</c:if>>음식&요리
									<option class="option" value="6" <c:if test="${ct.hobbyNo eq '6'}">selected</c:if>>애견&애묘
									<option class="option" value="7" <c:if test="${ct.hobbyNo eq '7'}">selected</c:if>>사진&영상
									<option class="option" value="8" <c:if test="${ct.hobbyNo eq '8'}">selected</c:if>>봉사활동
									<option class="option" value="9" <c:if test="${ct.hobbyNo eq '9'}">selected</c:if>>문화예술
							</select>
							</c:forEach>
							<!--  <c:if test="${ct.hobbyNo eq '9'}">selected</c:if> -->
						</div>
					</fieldset>
				</form>
				<form class="dropdown">
					<fieldset>
						<legend id="sectioninfo">회원수필터</legend>
						<div>
							<select name="hot" id="hot">
								<option class="num" value="joinmax">회원수많은순
								<option class="num" value="datemax">개설일순
							</select>
						</div>
					</fieldset>
				</form>
			</div>

			<!-- 전체모임에서 필터선택후 나오는화면  -->
			<section id="allmoimsearch">
				<h1 id="sectioninfo">전체모임목록</h1>

				<!-- 모임필터결과 -->
				<div class="filterresultmoim">
				<c:forEach items="${gatheringResult}" var="gat" begin="0" end="0"><span class="result">검색결과모임 : ${gat.hobbyNo}&nbsp;&nbsp;<button class="btn">↑지역,hobbyNo,회원수별 전체보기</button></span></c:forEach>
					<div class="cardbox">						
						<!-- 받아오기 -->
						<c:forEach items="${gatheringResult}" begin="0" end="5" var="gat">
						<div class="card">
							<img src="<c:url value='/images/4_travel.jpg'/>" class="card-img-top" alt="LOGO">
							<div class="cardbody">
								<h5 class="cardtitle">${gat.gatName}</h5>
								<p class="cardtext">${gat.gatInfo}</p>
								<p class="hidden">${gat.gatNo}</p>
								<small class="cardtext textmuted">
									<fmt:formatDate value="${gat.gatOpen}" pattern="YY/MM/dd"/>
								</small>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>

				<!-- 클래스필터결과 -->
				<div class="filterresultclass">
				<c:forEach items="${classResult}" var="clas" begin="0" end="0"><span class="result">검색결과클래스 : <span class="hobby">${clas.hobbyNo}</span>&nbsp;&nbsp;<button class="btn">↑지역,hobbyNo,회원수별 전체보기</button></span></c:forEach>
					<div class="cardbox">
						<!-- 클래스 받아오기 -->
						<c:forEach items="${classResult}" begin="0" end="5" var="clas">
						<div class="card">
							<img src="<c:url value='/images/4_travel.jpg'/>" class="card-img-top" alt="LOGO">
							<div class="cardbody">
								<h5 class="cardtitle">${clas.classTitle}</h5>
								<p class="cardtext">${clas.classInfo}</p>
								<p class="hidden">${clas.classNo}</p>
								<small class="cardtext textmuted">
									<fmt:formatDate value="${clas.classOpen}" pattern="YY/MM/dd"/>
								</small>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</section>
	<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
</body>
</html>