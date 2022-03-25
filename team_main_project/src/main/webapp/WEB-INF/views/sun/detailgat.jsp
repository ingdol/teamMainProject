<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<script src="<c:url value='/js/ldh/glike.js'/>"></script>
	<style type="text/css"></style>
	<script>
	function gat_Recommand(){
		if()
		
		location.href="/gatLike/${gatNo}/${sessionScope.snick}";
	}
	</script>
</head>
<body>
	<section id="mainWrap">
		<h1 id="sectioninfo">상세모임</h1>

		<!-- -----------------header,nav메뉴 부분---------------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		
		
		<!-- -----------------middle부분---------------- -->
		<section id="detailgatmiddle">
			<h1 id="sectioninfo">중간섹션</h1>
			<div class="moiminfobox">
				<h3 id="sectioninfo">모임소개</h3>
				<c:forEach items="${detail}" var="detail">
				<div class="moimpic">
					<img src="<c:url value='/images/${detail.gatPhoto}'/>">
				</div>
				<div class="moimname">
					<div class="titlesize">${detail.gatName}</div>
					<div>
						모임장 : <a href="#">&nbsp;${detail.memNick}</a>
						<c:if test="${empty mem.memNick}">
							<span class="quest"><button type="button"  id="fakeBtn">1:1문의</button></span>
						</c:if>
						<c:if test="${not empty mem.memNick}">
							<a href="<c:url value='/askChat/${sessionScope.sid}/${detail.gatNo}'/>">
							<span class="quest"><button type="button"  id="realBtn">1:1문의</button></span></a>
						</c:if>
						</div>
				</div>		
				</c:forEach>
			</div>
			<div class="moimdetail">
				<div class="moimmenubox">
					<h3 id="sectioninfo">모임메뉴</h3>
					<ul>
					<c:choose>
						<c:when test="${not empty mem.memNick and (mem.gatJoinNo1 == sendGatherNo.gatNo or mem.gatJoinNo2 == sendGatherNo.gatNo or mem.gatJoinNo3 == sendGatherNo.gatNo or mem.gatJoinNo4 == sendGatherNo.gatNo or mem.gatJoinNo5 == sendGatherNo.gatNo)}">
							<li class="moim1"><button type="button" class="btn btn-outline-primary">정보</button></li>
							<li class="moim2"><button type="button" class="btn btn-outline-primary">모임게시판</button></li>
							<li class="moim3"><button type="button" class="btn btn-outline-primary">사진첩</button></li>
							<c:forEach items="${detail}" var="detail">
							<li class="moim4"><a href="<c:url value='/chat/${sessionScope.sid}/${detail.gatNo}'/>"><button type="button" class="btn btn-outline-primary" id="chatBtn">채팅</button></a></li>
							</c:forEach>	
						</c:when>
						<c:otherwise>
							<li class="moim1"><button type="button" class="btn btn-outline-primary">정보</button></li>
						</c:otherwise>
					</c:choose>	
					</ul>
				</div>
				<div class="detailinfo">
					<h3 id="sectioninfo">모임메뉴별상세화면</h3>
					<!-- 정보 클릭시 -->
					<div class="moiminfodetail current">
						<h4 id="sectioninfo">!모임정보</h4>
						<c:forEach items="${detail}" var="detail">
						<div class="photobox"><br><img src="/images/${detail.gatBanPhoto}"><br></div>
						<div class="infobox">
						<br>
								<div class="large">${detail.gatName}</div><br><br>
								<div class="medium">모임 지역</div><hr><div class="mediumText">${detail.gatArea}</div><br><br>
								<div class="medium">모임 개설일</div><hr><div class="mediumText"><fmt:formatDate value="${detail.gatOpen}" pattern="YY/MM/dd"/></div><br><br>
								<div class="medium">모임 소개 </div><hr>
								<div class="mediumText"><p>${detail.gatInfo}</p></div><br>
								<br><br>		
						</div>						
						</c:forEach>
					</div>

					<!-- 모임게시판 클릭시 -->
					<div class="moimcommu">
						<div class="board_list_wrap">
							<div class="board_list">
								<div class="topTitle">
									<div class="num">번호</div>
									<div class="title">제목</div>
									<div class="writer">글쓴이</div>
									<div class="date">작성일</div>
									<div class="count">조회</div>
								</div>
								<c:forEach items="${gatherCommu}" var="com">
									<div class="top">
										<div class="num">${com.gatDetNo}</div>
										<div class="title" id="comTitle">
											<a href="<c:url value='/ldh/Somoimboard/${com.gatNo}/${com.gatDetNo}'/>">${com.gatDetTitle}/댓글수${com.gatDetComNum}</a>
										</div>
										<div class="writer" id="comId">${com.memNick}</div>
										<div class="date" id="comDate"><fmt:formatDate value="${com.gatDetDate}" pattern="YY/MM/dd"/></div>
										<div class="count" id="comCount">${com.gatDetView}</div>
									</div>
								</c:forEach>
								<c:forEach items="${gatherSchedule}" var="gatSche">
									<div class="top">
										<div class="num">${gatSche.gatScheNo}</div>
										<div class="title" id="gatTitle">
											<a href="<c:url value='/ScheduleNotice/${gatSche.gatNo}/${gatSche.gatScheNo}'/>">[일정 공지]${gatSche.gatScheTitle}</a>
										</div>
										<div class="writer" id="gatId">${gatSche.memNick}</div>
										<div class="date" id="gatDate"><fmt:formatDate value="${gatSche.gatScheWriteDate}" pattern="YY/MM/dd"/></div>
										<div class="count" id="gatCount">${gatSche.gatScheView}</div>
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
									<a id="bt_wrap_a" href="<c:url value='/ldh/SomoimboardWrite/${gatNo}/${sessionScope.sid}'/>" class="on"><button type="button" class="btn btn-outline-primary" id="bt_wrap">
									글 작성</button></a>
								</ul>
							</nav>	
					</div>

					<!-- 모임사진첩 클릭시 -->
					<div class="moimphoto">
						<h4 id="sectioninfo">!모임사진첩</h4>
						<div class="card-group">
							<ul>
							<c:forEach items="${gatherCommu}" var="photo" begin="0" end="2">
								<li>
									<div class="card">
										<img src="<c:url value='/images/${photo.gatDetPhoto}'/>" class="card-img-top">
										<div class="card-body">
											<c:forEach items="${gatherCommu}" var="com" begin="0" end="0"><h5 class="card-title"><a href="<c:url value='/ldh/Somoimboard/${com.gatNo}/${com.gatDetNo}'/>">${photo.gatDetTitle}</a></h5></c:forEach>
											<p class="card-text">${photo.gatDetInfo}</p>
										</div>
										<div class="card-footer">
											<small class="text-muted"><fmt:formatDate value="${photo.gatDetDate}" pattern="YY/MM/dd"/></small>
										</div>
									</div>
								</li>
							</c:forEach>
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
<%--					<li><button type="button" class="btn btn-primary gatherschedule">일정잡기</button></li>--%>
					<c:choose>
						<c:when test="${empty mem.memNick}">
							<li><input type="button" class="btn btn-primary gatherschedule" style="width: 100%" value="일정 잡기" id="fakeBtn"></li>
						</c:when>
						<c:when test="${not empty mem.memNick and (mem.gatJoinNo1 == sendGatherNo.gatNo or mem.gatJoinNo2 == sendGatherNo.gatNo or mem.gatJoinNo3 == sendGatherNo.gatNo or mem.gatJoinNo4 == sendGatherNo.gatNo or mem.gatJoinNo5 == sendGatherNo.gatNo)}">
							<li><a href="/GatherSchedule?gatNo=${sendGatherNo.gatNo}"><input type="button" class="btn btn-primary gatherschedule" style="width: 100%" value="일정 잡기" id="realBtn"></a></li>
						</c:when>
						<c:otherwise>
							<li><input type="button" class="btn btn-primary gatherschedule" style="width: 100%" value="일정 잡기" id="fakeBtn2"></li>
						</c:otherwise>
					</c:choose>
					<li><button type="button" id= "gat_Recommand" class="btn btn-secondary zzim">추천👍</button></li>
					<c:if test="${empty mem.memNick}">
						<li><button type="button" class="btn btn-primary join" id="joinFake">가입하기</button></li>
					</c:if>
					<c:if test="${not empty mem.memNick}">
						<li><button type="button" class="btn btn-primary join" id="join">가입하기</button></li>
					</c:if>
					
				</ul>
				<input type="hidden" id="memNick" value="${mem.memNick}">
					<input type="hidden" id="gatNo" value="${sendGatherNo.gatNo}">
			</div>
		</section>

		<!-- -----------footer부분--------- -->
		<jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</section>
</body>
</html>
