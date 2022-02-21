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
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
						서울시</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<button class="dropdown-item" type="button">Action</button>
						<button class="dropdown-item" type="button">Another
							action</button>
						<button class="dropdown-item" type="button">Something
							else here</button>
					</div>
				</div>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
						강남구</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<button class="dropdown-item" type="button">Action</button>
						<button class="dropdown-item" type="button">Another
							action</button>
						<button class="dropdown-item" type="button">Something
							else here</button>
					</div>
				</div>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
						베이커리</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<button class="dropdown-item" type="button">Action</button>
						<button class="dropdown-item" type="button">Another
							action</button>
						<button class="dropdown-item" type="button">Something
							else here</button>
					</div>
				</div>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
						회원많은순</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<button class="dropdown-item" type="button">Action</button>
						<button class="dropdown-item" type="button">Another
							action</button>
						<button class="dropdown-item" type="button">Something
							else here</button>
					</div>
				</div>
			</div>

			<!-- 전체모임에서 필터선택후 나오는화면  -->
			<section id="allmoimsearch">
				<h1 id="sectioninfo">전체모임목록</h1>

				<!-- 모임필터결과 -->
				<div class="filterresultmoim">
				<c:forEach items="${gatheringResult}" var="gat" begin="0" end="0"><span class="result">검색결과모임 : ${gat.hobbyNo}</span></c:forEach>
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
				<span class="result">검색결과클래스</span>
					<div class="cardbox">
						<div class="card">
							<img src="../image/LOGO.PNG" class="card-img-top" alt="LOGO">
							<div class="cardbody">
								<h5 class="cardtitle">클래스제목</h5>
								<p class="cardtext">클래스소개</p>
								<p class="cardtext">
									<small class="textmuted">개설일</small>
								</p>
							</div>
						</div>
						<div class="card">
							<img src="../image/LOGO.PNG" class="card-img-top" alt="LOGO">
							<div class="card-body">
								<h5 class="card-title">클래스제목</h5>
								<p class="card-text">클래스소개</p>
								<p class="card-text">
									<small class="text-muted">개설일</small>
								</p>
							</div>
						</div>
						<div class="card">
							<img src="../image/LOGO.PNG" class="card-img-top" alt="LOGO">
							<div class="card-body">
								<h5 class="card-title">클래스제목</h5>
								<p class="card-text">클래스소개</p>
								<p class="card-text">
									<small class="text-muted">개설일</small>
								</p>
							</div>
						</div>
						<div class="card">
							<img src="../image/LOGO.PNG" class="card-img-top" alt="LOGO">
							<div class="card-body">
								<h5 class="card-title">클래스제목</h5>
								<p class="card-text">클래스소개</p>
								<p class="card-text">
									<small class="text-muted">개설일</small>
								</p>
							</div>
						</div>
						<div class="card">
							<img src="../image/LOGO.PNG" class="card-img-top" alt="LOGO">
							<div class="card-body">
								<h5 class="card-title">클래스제목</h5>
								<p class="card-text">클래스소개</p>
								<p class="card-text">
									<small class="text-muted">개설일</small>
								</p>
							</div>
						</div>
						<div class="card">
							<img src="../image/LOGO.PNG" class="card-img-top" alt="LOGO">
							<div class="card-body">
								<h5 class="card-title">클래스제목</h5>
								<p class="card-text">클래스소개</p>
								<p class="card-text">
									<small class="text-muted">개설일</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
	<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
</body>
</html>