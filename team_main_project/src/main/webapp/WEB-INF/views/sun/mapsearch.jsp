<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map으로 모임찾기(필터)</title>
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/sun/mapsearch.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/sun/mapsearch.js'/>"></script>
</head>
<body>
	<section id="wrap">
		<h1 id="sectioninfo">모임찾기</h1>
		<!-- -----------------header,nav메뉴 부분---------------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />


		<!-- -----------------middle부분---------------- -->
		<section id="mapmiddle">
			<h1 id="sectioninfo">중간섹션</h1>
			<div id="filter" class="filter">
				<ul>
					<li><div>지도로 찾기</div></li>
					<li><div>관심사 찾기</div></li>
					<li><div>인기모임</div></li>
				</ul>
			</div>

			<!-- 필터선택후 나오는화면  -->
			<div id="locationsearch">
				<div class="dropbox">
					<h3 id="sectioninfo">지역선택하기</h3>
					<div class="dropdown">
					<!-- 	<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
							Dropdown</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
							<button class="dropdown-item" type="button">Action</button>
							<button class="dropdown-item" type="button">Another
								action</button>
							<button class="dropdown-item" type="button">Something
								else here</button>
						</div> -->
						<span>서울시</span>
						<span>강남구</span>
						
					</div>
				</div>
				<div class="mapphoto">
					<a href="#"><img id="Rectangle_be"
						src="<c:url value='/images/Rectangle_be.png'/>"></a>
				</div>
			</div>
		</section>

		<!-- -----------footer부분--------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</section>
</body>
</html>