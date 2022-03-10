<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전체커뮤니티 메인화면</title>
		<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sun/commumain.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
		<script src="<c:url value='/js/sun/commumain.js'/>"></script>
	</head>
		<body>
		<section id="mainWrap">
            <h1 id="sectioninfo">전체커뮤니티 메인화면</h1>
            <!-- -----------------header,nav메뉴 부분---------------- -->
          	<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />               
             <!-- -----------------middle부분---------------- -->
			<section id="commumiddle">
                <h1 id="sectioninfo">중간섹션/커뮤니티전체게시판</h1>
                <section>
                	<h3 id="sectioninfo">커뮤니티메뉴</h3>
                	<div class="commumenubox">
                			<ul>
                				<li><button type="button" class="category1 btn btn-outline-primary">전체글</button></li>
                				<li><button type="button" class="category2 btn btn-outline-primary">일상</button></li>
                				<li><button type="button" class="category3 btn btn-outline-primary">후기</button></li>
                				<li><button type="button" class="category4 btn btn-outline-primary">베스트</button></li>
                				<li><button type="button" class="category5 btn btn-outline-primary">게시글작성</button></li>
                			</ul>
                	</div>
                </section>
                
                <!-- 전체글 -->
                <div class="allbox">
                	<div class="board_list_wrap">
	                	<div class="board_list">
		                	<div class="top">
								<div class="num">번호</div>
								<div class="title">제목</div>
								<div class="writer">글쓴이</div>
								<div class="date">작성일</div>
								<div class="count">조회</div>
							</div>
							<c:forEach items="${comlist}" var="comlist">
								<div class="top">
									<div class="num">${comlist.commuNo}</div>
									<div class="title" id="comTitle">
										<a href="<c:url value='/ldh/Communityboard/${comlist.commuNo}'/>">${comlist.commuTitle}/댓글수${comlist.commuComNum}</a>
									</div>
									<div class="writer" id="comId">${comlist.memNick}</div>
									<div class="date" id="comDate"><fmt:formatDate value="${comlist.commuDate}" pattern="YY/MM/dd"/></div>
									<div class="count" id="comCount">${comlist.commuView}</div>
								</div>
							</c:forEach>
						</div>
						<!-- -------- 페이지이동 ------ -->
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="<c:url value='/sun/commumain/1'/>">1</a></li>
								<li class="page-item"><a class="page-link" href="<c:url value='/sun/commumain/2'/>">2</a></li>
								<li class="page-item"><a class="page-link" href="<c:url value='/sun/commumain/3'/>">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>						
					</div>
				</div>
				
				<!-- 일상카테고리 -->				
				<div class="dailybox">
					<div class="board_list_wrap">
	                	<div class="board_list">
		                	<div class="top">
								<div class="num">번호</div>
								<div class="title">제목</div>
								<div class="writer">글쓴이</div>
								<div class="date">작성일</div>
								<div class="count">조회</div>
							</div>
							<c:forEach items="${dailylist}" var="dailylist">
								<div class="top">
								<div class="num">${dailylist.commuNo}</div>
								<div class="title" id="comTitle">
									<a href="<c:url value='/ldh/Communityboard/${dailylist.commuNo}'/>">${dailylist.commuTitle}/댓글수${dailylist.commuComNum}</a>
								</div>
								<div class="writer" id="comId">${dailylist.memNick}</div>
								<div class="date" id="comDate"><fmt:formatDate value="${dailylist.commuDate}" pattern="YY/MM/dd"/></div>
								<div class="count" id="comCount">${dailylist.commuView}</div>
							</div>
							</c:forEach>
						</div>
						<!-- -------- 페이지이동 ------ -->
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
							</ul>
						</nav>						
					</div>
				</div>
				
				<!-- 후기카테고리 -->
				<div class="reviewbox">
					<div class="board_list_wrap">
	                	<div class="board_list">
		                	<div class="top">
								<div class="num">번호</div>
								<div class="title">제목</div>
								<div class="writer">글쓴이</div>
								<div class="date">작성일</div>
								<div class="count">조회</div>
							</div>
							<c:forEach items="${reviewlist}" var="reviewlist">
								<div class="top">
								<div class="num">${reviewlist.commuNo}</div>
								<div class="title" id="comTitle">
									<a href="<c:url value='/ldh/Communityboard/${reviewlist.commuNo}'/>">${reviewlist.commuTitle}/댓글수${reviewlist.commuComNum}</a>
								</div>
								<div class="writer" id="comId">${reviewlist.memNick}</div>
								<div class="date" id="comDate"><fmt:formatDate value="${reviewlist.commuDate}" pattern="YY/MM/dd"/></div>
								<div class="count" id="comCount">${reviewlist.commuView}</div>
							</div>
							</c:forEach>
						</div>
						<!-- -------- 페이지이동 ------ -->
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
							</ul>
						</nav>							
					</div>
				</div>
				
				<!-- 베스트카테고리 -->
				<div class="bestbox">
					<div class="board_list_wrap">
	                	<div class="board_list">
		                	<div class="top">
								<div class="num">번호</div>
								<div class="title">제목</div>
								<div class="writer">글쓴이</div>
								<div class="date">작성일</div>
								<div class="count">조회</div>
							</div>
							<c:forEach items="${bestlist}" var="bestlist">
								<div class="top">
								<div class="num">${bestlist.commuNo}</div>
								<div class="title" id="comTitle">
									<a href="<c:url value='/ldh/Communityboard/${bestlist.commuNo}'/>">${bestlist.commuTitle}/댓글수${bestlist.commuComNum}</a>
								</div>
								<div class="writer" id="comId">${bestlist.memNick}</div>
								<div class="date" id="comDate"><fmt:formatDate value="${bestlist.commuDate}" pattern="YY/MM/dd"/></div>
								<div class="count" id="comCount">${bestlist.commuView}</div>
							</div>
							</c:forEach>
						</div>
						<!-- -------- 페이지이동 ------ -->
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
							</ul>
						</nav>							
					</div>
				</div>
				
				<!-- 게시글작성(누르면게시글 작성페이지로 바로 넘어가게 수정예정) -->
				<div class="writebox">
                	<%-- <div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<c:forEach items="${comlist}" var="comlist">
						<div>
						<div class="num">${comlist.commuNo}</div>
						<div class="title" id="comTitle">
							<a href="#">${comlist.commuTitle}</a>
						</div>
						<div class="writer" id="comId">${comlist.memNick}</div>
						<div class="date" id="comDate"><fmt:formatDate value="${comlist.commuDate}" pattern="YY/MM/dd"/></div>
						<div class="count" id="comCount">${comlist.commuView}</div>
					</div>
					</c:forEach> --%>
				</div>				
				
			</section>

            <!-- -----------footer부분--------- -->
			 <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		</section>
	</body>
</html>
