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
<script src="<c:url value='/js/sun/mapapi.js'/>"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0dazxdiykm&submodules=geocoder"></script>
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
				</div>		
				<c:forEach items="${gatheringResult}" begin="0" var="gr">
					<div class="moim hidden">
						<span class="moimno hidden">${gr.gatNo}</span>
						<span class="moimname hidden">${gr.gatName}</span>
						<span id="maps" class="area hidden">${gr.gatArea}</span>
					</div>
				</c:forEach>				
				<c:forEach items="${classResult}" begin="0" var="cr">
					<div class="class hidden">
						<span class="moimno hidden">${cr.classNo}</span>
						<span class="moimname hidden">${cr.classTitle}</span>
						<span id="maps2" class="area hidden">${cr.classArea}</span>
					</div>
				</c:forEach>
				
				<div class="mapphoto" id="map" style="width: 90%; height: 750px;"></div>
			</div>


			<!-- 필터선택후 나오는화면 hobby-->
			<div id="hobbyclick" class="hobby">
				<ul>
					<li><a href="<c:url value='/sun/allmoim/1'/>"><img src="<c:url value='/images/1.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/2'/>"><img src="<c:url value='/images/2.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/3'/>"><img src="<c:url value='/images/3.jpg'/>"></a>
					</li>
				</ul>
				<ul>
					<li><a href="<c:url value='/sun/allmoim/4'/>"><img src="<c:url value='/images/4.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/5'/>"><img src="<c:url value='/images/5.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/6'/>"><img src="<c:url value='/images/6.jpg'/>"></a>
					</li>
				</ul>
				<ul>
					<li><a href="<c:url value='/sun/allmoim/7'/>"><img src="<c:url value='/images/7.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/8'/>"><img src="<c:url value='/images/8.jpg'/>"></a>
					</li>
					<li><a href="<c:url value='/sun/allmoim/9'/>"><img src="<c:url value='/images/9.jpg'/>"></a>
					</li>
				</ul>
			</div>
		</section>

		<!-- -----------footer부분--------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</section>
</body>
</html>