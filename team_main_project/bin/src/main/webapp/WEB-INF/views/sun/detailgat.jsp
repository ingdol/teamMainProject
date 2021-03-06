<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임상세화면</title>
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/sun/detailgat.css'/>" rel="stylesheet" type="text/css">
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/sun/detailgat.js'/>"></script>
	<style type="text/css"></style>
</head>
<body>
	<section id="wrap">
		<h1 id="sectioninfo">상세모임</h1>

		<!-- -----------------header,nav메뉴 부분---------------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		
		
		<!-- -----------------middle부분---------------- -->
		<section id="detailgatmiddle">
			<h1 id="sectioninfo">중간섹션</h1>
			<div class="moiminfobox">
				<h3 id="sectioninfo">모임소개</h3>
				<div class="moimpic">
					<img src="../image/LOGO.png">
				</div>
				<div class="moimname">
					<div>소모임이름</div>
					<div><a href="#"><img src="#" alt="등급">모임개설자닉네임</a><button>1:1문의</button></div>
				</div>		
			</div>
			<div class="moimdetail">
				<div class="moimmenubox">
					<h3 id="sectioninfo">모임메뉴</h3>
					<ul>
						<li class="moim1"><button type="button" class="btn btn-outline-primary">정보</button></li>
						<li class="moim2"><button type="button" class="btn btn-outline-primary">모임게시판</button></li>
						<li class="moim3"><button type="button" class="btn btn-outline-primary">사진첩</button></li>
						<li class="moim4"><button type="button" class="btn btn-outline-primary">채팅</button></li>
					</ul>
				</div>
				<div class="detailinfo">
					<h3 id="sectioninfo">모임메뉴별상세화면</h3>
					<!-- 정보 클릭시 -->
					<div class="moiminfodetail current">
						<h4>!모임정보</h4>
					</div>
	
					<!-- 모임게시판 클릭시 -->
					<div class="moimcommu">모임게시판</div>
	
					<!-- 모임사진첩 클릭시 -->
					<div class="moimphoto">
						<h4>!모임사진첩</h4>
						<div class="card-group">
							<ul>
								<li>
									<div class="card">
										<img src="<c:url value='/image/hobbyCtg/1_sport.jpg'/>" class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">사진제목</h5>
											<p class="card-text">사진내용(글자수정해놓아야함)</p>
										</div>
										<div class="card-footer">
											<small class="text-muted">작성날짜</small>
										</div>
									</div>
								</li>
								<li>
									<div class="card">
										<img src="<c:url value='/image/hobbyCtg/1_sport.jpg'/>" class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">사진제목</h5>
											<p class="card-text">사진내용(글자수정해놓아야함)</p>
										</div>
										<div class="card-footer">
											<small class="text-muted">작성날짜</small>
										</div>
									</div>
								</li>
								<li>
									<div class="card">
										<img src="<c:url value='/image/hobbyCtg/1_sport.jpg'/>" class="card-img-top" alt="...">
										<div class="card-body">
											<h5 class="card-title">사진제목</h5>
											<p class="card-text">사진내용(글자수정해놓아야함)</p>
										</div>
										<div class="card-footer">
											<small class="text-muted">작성날짜</small>
										</div>
									</div>
								</li>
							</ul>							
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
					</div>

					<!-- 채팅 클릭시 -->
					<div class="moimchatting">모임채팅</div>
				</div>
			</div>
			<div class="moimjoin">
				<h3 id="sectioninfo">해당모임찜,가입버튼</h3>
				<ul>
					<li><button type="button" class="btn btn-secondary btn-lg">찜하기</button></li>
					<li><button type="button" class="btn btn-primary btn-lg">가입하기</button></li>
				</ul>
			</div>
		</section>

		<!-- -----------footer부분--------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</section>
</body>
</html>