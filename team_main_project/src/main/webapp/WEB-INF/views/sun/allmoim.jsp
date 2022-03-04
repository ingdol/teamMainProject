<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체모임(필터)</title>
<link href="<c:url value='/css/sun/allmoim.css'/>" rel="stylesheet"	type="text/css">
<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/sun/allmoim.js'/>"></script>
</head>
<body>
	<div id="mainWrap">			
		    
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
							<select name="area" id="area">
								<option value="all">전체지역
								<option value="서울">서울시
								<option value="경기">경기도
								<option value="경상">경상도
								<option value="전라">전라도
								<option value="충청">충청도
								<option value="강원">강원도
							</select>
						</div>
					</fieldset>
				</form>
				<form class="dropdown">
					<fieldset>
						<legend>관심사</legend>
						<div>
							<select name="hobbyselect" id="hobbyselect">
									<option class="option" value="all">전체목록
									<option class="option" value="1">운동
									<option class="option" value="2">아웃도어
									<option class="option" value="3">자기계발
									<option class="option" value="4">여행
									<option class="option" value="5">음식&요리
									<option class="option" value="6">애견&애묘
									<option class="option" value="7">사진&영상
									<option class="option" value="8">봉사활동
									<option class="option" value="9">문화예술
							</select>
							<!--  <c:if test="${ct.hobbyNo eq '9'}">selected</c:if> -->
						</div>
					</fieldset>
				</form>
			</div>

			<!-- 전체모임에서 필터선택후 나오는화면  -->
			<section id="allmoimsearch">
				<h1 id="sectioninfo">전체모임목록</h1>

				<!-- 모임필터결과 -->
				<div class="filterresultmoim">
					<div class="cardbox" id="moimcard">						
						<!-- 받아오기 -->
						<c:forEach items="${gatheringResult}" begin="0" end="4" var="gat">
						<div class="card">
							<img src="<c:url value='/images/${gat.gatPhoto}'/>" class="card-img-top" alt="LOGO">
							<div class="cardbody">
								<h5 class="cardtitle">${gat.gatName}</h5>
								<p class="hidden">${gat.gatNo}</p>
								<small class="cardtext textmuted">
									<fmt:formatDate value="${gat.gatOpen}" pattern="YY/MM/dd"/>
								</small>
							</div>
						</div>
						</c:forEach>
					</div>
					<div class="moimplus">모임더보기</div>
				</div>

				<!-- 클래스필터결과 -->
				<div class="filterresultclass">
					<div class="cardbox" id="classcard">
						<!-- 클래스 받아오기 -->
						<c:forEach items="${classResult}" begin="0" end="4" var="clas">
						<div class="card">
							<img src="<c:url value='/images/${clas.classPhoto}'/>" class="card-img-top" alt="LOGO">
							<div class="cardbody">
								<h5 class="cardtitle">${clas.classTitle}</h5>
								<p class="hidden">${clas.classNo}</p>
								<small class="cardtext textmuted">
									<fmt:formatDate value="${clas.classOpen}" pattern="YY/MM/dd"/>
								</small>
							</div>
						</div>
						</c:forEach>						
					</div>
					<div class="classplus">클래스더보기</div>
				</div>
			</section>
		</section>
	<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
</body>
</html>