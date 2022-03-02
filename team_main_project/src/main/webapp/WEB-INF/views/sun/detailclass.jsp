<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스상세화면</title>
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/sun/detailgat.css'/>" rel="stylesheet" type="text/css">
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/sun/detailgat.js'/>"></script>
	<style type="text/css"></style>
</head>
<body>
	<section id="mainWrap">
		<h1 id="sectioninfo">상세클래스</h1>

		<!-- -----------------header,nav메뉴 부분---------------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		
		
		<!-- -----------------middle부분---------------- -->
		<section id="detailgatmiddle">
			<h1 id="sectioninfo">중간섹션</h1>
			<div class="moiminfobox">
				<h3 id="sectioninfo">모임소개</h3>
				<div class="moimpic">
					<img src="<c:url value='/images/1_sport.jpg'/>">
				</div>
				<div class="moimname">
					<c:forEach items="${detail}" var="detail">
					<div>${detail.classTitle}</div>
					<div>
						강사 : <a href="#"><img src="#" alt="등급">&nbsp;${detail.memNick}</a>
						<a href="/chatbotForm"><span class="quest">1:1문의</span></a>
					</div>
					</c:forEach>
				</div>		
			</div>
			<div class="moimdetail">
				<div class="moimmenubox">
					<h3 id="sectioninfo">모임메뉴</h3>
					<ul>
						<li class="moim1"><button type="button" class="btn btn-outline-primary">정보</button></li>
						<li class="moim2"><button type="button" class="btn btn-outline-primary">클래스리뷰</button></li>
					</ul>
				</div>
				<div class="detailinfo">
					<h3 id="sectioninfo">모임메뉴별상세화면</h3>
					<!-- 정보 클릭시 -->
					<div class="moiminfodetail current">
						<h4 id="sectioninfo">!클래스정보</h4>
						<div class="photobox"><img src="/images/1.jpg"></div>
						<div class="infobox">
							<c:forEach items="${detail}" var="detail">
								<span class="large">클래스 제목 : ${detail.classTitle}</span><br>
								<span>클래스 개설일 : <fmt:formatDate value="${detail.classOpen}" pattern="YY/MM/dd"/></span><br><br>
								<span class="medium">- 클래스 소개 -</span><br>
								<span>${detail.classInfo}</span><br>
								<hr>
								<span><img src="<c:url value='/images/${detail.classPhoto}'/>"></span><br>								
								<span>${detail.classNo}</span><br>
								<span>${detail.memNick}</span><br>
								<span>${detail.hobbyNo}</span><br>
								<span>${detail.classArea}</span><br>
								<span>${detail.classHate}</span><br>						
							</c:forEach>
						</div>					
					</div>

					<!-- 리뷰게시판 클릭시 -->
					<div class="moimcommu">
						<div class="board_list_wrap">
							<div class="board_list">
								<div class="top">
									<div class="num">번호</div>
									<div class="title">제목</div>
									<div class="writer">글쓴이</div>
									<div class="date">작성일</div>
								</div>
								<c:forEach items="${revlist}" var="com">
									<div class="top">
										<div class="num">${com.classRevNo}</div>
										<div class="title" id="comTitle">
											<a href="<c:url value='/ldh/Somoimboard/${com.classNo}/${com.classRevNo}'/>">${com.classRevTitle}</a>
										</div>
										<div class="writer" id="comId">${com.memNick}</div>
										<div class="date" id="comDate"><fmt:formatDate value="${com.classRevDate}" pattern="YY/MM/dd"/></div>
									</div>
								</c:forEach>
							</div>
						</div>
							<nav aria-label="Page navigation example">
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
									<li class="bt_wrap"><a href="<c:url value='/ldh/SomoimboardWrite/{memNick}'/>" class="on">등록</a></li>
								</ul>
							</nav>	
					</div>
				</div>
			</div>
			<div class="moimjoin">
				<h3 id="sectioninfo">해당클래스찜,가입버튼</h3>
				<ul>
					<li><button type="button" class="btn btn-secondary zzim">찜하기</button></li>
					<li><button type="button" class="btn btn-primary join">가입하기</button></li>
				</ul>
			</div>
		</section>

		<!-- -----------footer부분--------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</section>
</body>
</html>