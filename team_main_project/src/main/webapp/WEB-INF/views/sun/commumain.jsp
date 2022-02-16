<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<style type="text/css"></style>
	</head>
		<body>
		<section id="wrap">
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
                				<li><button type="button" class="btn btn-outline-primary">전체글</button></li>
                				<li><button type="button" class="btn btn-outline-primary">일상</button></li>
                				<li><button type="button" class="btn btn-outline-primary">후기</button></li>
                				<li><button type="button" class="btn btn-outline-primary">베스트</button></li>
                				<li><button type="button" class="btn btn-outline-primary">게시글작성</button></li>
                			</ul>
                	</div>
                </section>
                <div class="board_list_wrap">
                	<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<c:forEach items="${comlist}" var="com">
						<div>
						<div class="num">${com.comNo}</div>
						<div class="title" id="comTitle">
							<a href="<c:url value='/listview/${com.comNo}'/>">${com.comTitle}</a>
						</div>
						<div class="writer" id="comId">${com.memId}</div>
						<div class="date" id="comDate">${com.comDate}</div>
						<div class="count" id="comCount">${com.comCount}</div>
					</div>
					</c:forEach>
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
					</ul>
				</nav>	
			</section>

            <!-- -----------footer부분--------- -->
			 <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		</section>
	</body>
</html>