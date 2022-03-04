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
	<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		<!-- --------------------------------- -->
	<div class="formbox">
		<form class="find">
			 <span>
                    <select name="gatArea" id="gatArea" onchange="categoryChange(this)">
                        <option value="">시/도 선택</option>
                        <option value="서울">서울 특별시</option>
                        <option value="강원">강원도</option>
                        <option value="경기">경기도</option>
                        <option value="경남">경상남도</option>
                        <option value="경북">경상북도</option>
                        <option value="광주">광주 광역시</option>
                        <option value="대구">대구 광역시</option>
                        <option value="대전">대전 광역시</option>
                        <option value="부산">부산 광역시</option>
                        <option value="울산">울산 광역시</option>
                        <option value="인천">인천 광역시</option>
                        <option value="전남">전라남도</option>
                        <option value="전북">전라북도</option>
                        <option value="제주">제주 특별자치도</option>
                        <option value="충남">충청남도</option>
                        <option value="충북">충청북도</option>
                    </select>                  
            </span>
            <span> 
            	<select name="category" id="category" class="category">
            			<option class="option" value="">전체목록
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
				</span>               
                <button id="findPlaceBtn">검색</button>
		</form>
	</div>
	<hr size="3px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
	<section id="allmoimclass">
		<h1 id="sectioninfo">전체모임목록</h1>
			<div class="moim">
				<div class="cardbox" id="moimcard">
				<c:forEach items="${gatheringResult}" begin="0" end="4" var="gat">
					<div class="card">
						<img class="card-img-top" src="<c:url value='/images/${gat.gatPhoto}'/>" />
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
				<div class="plus">모임더보기</div>
			</div>

			<div class="class">
				<div class="cardbox" id="moimcard">
				<c:forEach items="${classResult}" begin="0" end="4" var="clas">
					<div class="card">
						<img class="card-img-top" src="<c:url value='/images/${clas.classPhoto}'/>"/>
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
				<div class="plus">클래스더보기</div>
			</div>
	</section>
		<!-- --------------------------------- -->
	<hr size="3px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
	<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</div>		
</body>
</html>