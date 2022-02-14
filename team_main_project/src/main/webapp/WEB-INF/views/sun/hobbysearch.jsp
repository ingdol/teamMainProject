<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>map으로 모임찾기(필터)</title>
		<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sun/hobbysearch.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
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
					<div id="mapsearch">
						<svg class="n_108">
						<rect id="n_108" rx="50" ry="50" x="0" y="0" width="402"
								height="283">
						</rect>
					</svg>
						<img id="Rectangle_" src="Rectangle_.png"
							srcset="Rectangle_.png 1x, Rectangle_@2x.png 2x">
		
						<div id="n_">
							<span>지도로 찾기</span>
						</div>
					</div>
					<div id="hobby">
						<svg class="n_109">
						<rect id="n_109" rx="50" ry="50" x="0" y="0" width="402"
								height="283">
						</rect>
					</svg>
						<div id="Text">
							<span>관심사 찾기</span>
						</div>
					</div>
					<div id="memmax">
						<svg class="n_115" viewBox="0 0 402 283">
						<path id="n_115"
								d="M 66.55628967285156 0 L 335.4437255859375 0 C 372.2017211914062 0 402 22.38576126098633 402 50 L 402 233 C 402 260.6142272949219 372.2017211914062 283 335.4437255859375 283 L 66.55628967285156 283 C 29.79826545715332 283 0 260.6142272949219 0 233 L 0 50 C 0 22.38576126098633 29.79826545715332 0 66.55628967285156 0 Z">
						</path>
					</svg>
						<div id="Text_bb">
							<span>인기 모임</span>
						</div>
					</div>
				</div>
				
				<!-- 필터선택후 나오는화면  -->
				<div id="hobbyclick">
                   <button type="button">운동</button>
                   <button type="button">아웃도어</button>
                   <button type="button">자기계발</button>
                   <button type="button">여행</button>
                   <button type="button">음식&요리</button>
                   <button type="button">애견&애묘</button>
                   <button type="button">사진&영상</button>
                   <button type="button">봉사활동</button>
                   <button type="button">문화예술</button>
				</div>
			</section>

            <!-- -----------footer부분--------- -->
            <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		</section>
	</body>
</html>