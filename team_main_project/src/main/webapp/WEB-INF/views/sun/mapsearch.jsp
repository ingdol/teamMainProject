<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리별 모임찾기(필터)</title>
<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/sun/mapsearch.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/sun/hobbysearch.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/sun/mapsearch.js'/>"></script>
</head>
<body>
	<section id="mainWrap">
		<h1 id="sectioninfo">모임찾기</h1>
		<!-- -----------------header,nav메뉴 부분---------------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />


		<!-- -----------------middle부분---------------- -->
		<section id="mapmiddle">
			<h1 id="sectioninfo">중간섹션</h1>
			<div id="filter" class="filter">
				<ul>
					<li><div class="mapmenu">지도로 찾기</div></li>
					<li><div class="hobbymenu">관심사 찾기</div></li>
					<li><div class="hotmenu">인기모임</div></li>
				</ul>
			</div>

			<!-- 필터선택후 나오는화면 map -->
			<div id="locationsearch" class="map">
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
			
			
			<!-- 필터선택후 나오는화면 hobby-->
			<div id="hobbyclick" class="hobby">
				<ul>
					<li><a href="<c:url value='/sun/allmoim/1'/>"><img src="<c:url value='/images/1_sport.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/2'/>"><img src="<c:url value='/images/2_outdoor.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/3'/>"><img src="<c:url value='/images/3_study.jpg'/>"></a>
					</li>
				</ul>
				<ul>
					<li><a href="<c:url value='/sun/allmoim/4'/>"><img src="<c:url value='/images/4_travel.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/5'/>"><img src="<c:url value='/images/5_cook.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/6'/>"><img src="<c:url value='/images/6_animal.jpg'/>"></a>
					</li>
				</ul>
				<ul>
					<li><a href="<c:url value='/sun/allmoim/7'/>"><img src="<c:url value='/images/7_picture.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/8'/>"><img src="<c:url value='/images/8_help.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/9'/>"><img src="<c:url value='/images/9_art2.jpg'/>"></a>
					</li>
				</ul>
			</div>
		</section>

		<!-- -----------footer부분--------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</section>
</body>
</html>