<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임전체보기</title>
		<link href="<c:url value='/css/sun/allmoimdetail.css'/>" rel="stylesheet"	type="text/css">
		<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sun/allmoimdetail.js'/>"></script>
	</head>
	<body>
		<div id="mainWrap">
			<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
			<!-- ------------------------ -->
			<section id="moimmiddle">
				<h1 id="sectioninfo">중간섹션</h1>
				<section id="moimsearch">
					<h1 id="sectioninfo">전체모임목록</h1>
					<div class="resultmoim">
						<div class="cardbox">
							<!-- 받아오기 -->
							<c:forEach items="${gatheringResult}" begin="0" end="4" var="gat" >
								<div class="card">
									<img src="<c:url value='/images/1_sport.jpg'/>" alt="LOGO">
									<div class="cardbody">
										<h5 class="cardtitle">${gat.gatName}</h5>
										<p class="hidden">${gat.gatNo}</p>
										<small class="cardtext textmuted"> <fmt:formatDate
												value="${gat.gatOpen}" pattern="YY/MM/dd" />
										</small>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="cardbox">
							<c:forEach items="${gatheringResult}" begin="5" end="9" var="gat" >
								<div class="card">
									<img src="<c:url value='/images/1_sport.jpg'/>" alt="LOGO">
									<div class="cardbody">
										<h5 class="cardtitle">${gat.gatName}</h5>
										<p class="hidden">${gat.gatNo}</p>
										<small class="cardtext textmuted"> <fmt:formatDate
												value="${gat.gatOpen}" pattern="YY/MM/dd" />
										</small>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
						<nav class="page">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
				</section>
			</section>
			<!-- ------------------------ -->
			<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		</div>
	</body>
</html>