<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>allmoim에서 필터선택후 ajax에서 받아온값</title>
		<script src="<c:url value='/js/sun/allmoimajax.js'/>"></script>
	</head>
	<body>
	<br>
			<h1 id="sectioninfo">전체모임목록</h1>
			<div class="moim">
				<div class="cardbox" id="moimcard">
					<c:forEach items="${gatheringResult}" begin="0" end="4" var="gat">
						<div class="card">
							<img class="card-img-top"
								src="<c:url value='/images/${gat.gatPhoto}'/>" />
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
				<div class="moimplus"><c:forEach items="${gatheringResult}" begin="0" end="0" var="gat"><span class="spannone">${gat.hobbyNo}</span></c:forEach>모임더보기</div>
			</div>
	
			<div class="clas">
				<div class="cardbox" id="classcard">
					<c:forEach items="${classResult}" begin="0" end="4" var="clas">
						<div class="card">
							<img id="card-img-top" class="card-img-top"
								src="<c:url value='/images/${clas.classPhoto}'/>" />
							<div class="cardbody">
								<h5 class="cardtitle">${clas.classTitle}</h5>
								<p class="hidden">${clas.classNo}</p>
								<small class="cardtext textmuted"> <fmt:formatDate
										value="${clas.classOpen}" pattern="YY/MM/dd" />
								</small>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="classplus">
				<c:forEach items="${classResult}" begin="0" end="0" var="clas">
				<span class="spannone">${clas.hobbyNo}</span>
				</c:forEach>클래스더보기</div>
			</div>
	<br>
	</body>
</html>