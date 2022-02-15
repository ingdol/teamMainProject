<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심사로 모임찾기(필터)</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/css/sun/hobbysearch.css'/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/sun/hobbysearch.js'/>"></script>
</head>
<body>
	<section id="wrap">
		<h1 id="sectioninfo">모임찾기</h1>
		<!-- -----------------header,nav메뉴 부분---------------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />


		<!-- -----------------middle부분---------------- -->
		<section id="hobbymiddle">
			<h1 id="sectioninfo">중간섹션</h1>
			<div id="filter" class="filter">
				<ul>
					<li><div>지도로 찾기</div></li>
					<li><div>관심사 찾기</div></li>
					<li><div>인기모임</div></li>
				</ul>
			</div>

			<!-- 필터선택후 나오는화면  -->
			<div id="hobbyclick">
				<ul>
					<li><a href="#"><img src="<c:url value='/images/1.jpg'/>"></a>
					</li>
					<li><a href="#"><img src="<c:url value='/images/2.jpg'/>"></a>
					</li>
					<li><a href="#"><img src="<c:url value='/images/3.jpg'/>"></a>
					</li>
				</ul>
				<ul>
					<li><a href="#"><img src="<c:url value='/images/4.jpg'/>"></a>
					</li>
					<li><a href="#"><img src="<c:url value='/images/5.jpg'/>"></a>
					</li>
					<li><a href="#"><img src="<c:url value='/images/6.jpg'/>"></a>
					</li>
				</ul>
				<ul>
					<li><a href="#"><img src="<c:url value='/images/7.jpg'/>"></a>
					</li>
					<li><a href="#"><img src="<c:url value='/images/8.jpg'/>"></a>
					</li>
					<li><a href="#"><img src="<c:url value='/images/9.jpg'/>"></a>
					</li>
				</ul>
			</div>
		</section>

		<!-- -----------footer부분--------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</section>
</body>
</html>