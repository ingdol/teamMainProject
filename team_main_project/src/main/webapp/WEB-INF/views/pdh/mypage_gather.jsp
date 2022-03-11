<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/css/pdh/mypage.css" />">
    <title>Daily&Linker</title>
</head>
<body>
    <div id ="mainWrap">
    <!-- TOP  -->
    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
	    <div class="container">
	        <div class="member-info">
	            <ul class="user-info-container">
	                <li class="user-info">닉네임 : ${snick}</li>
	                <li class="user-info">포인트 : ${spoint}</li>
	            </ul>
	            <span><a class="change-info" href="<c:url value='/change-info-signin'/>">정보 수정</a></span>
	        </div>
	        <div class="menu-container">
	            <ul class="portal-list">
	                <li class="portal-item" onclick="location.href = '/mypage-gather'">내 게시글</li>
	                <li class="portal-item" onclick="location.href = '/mypage'">가입한 모임</li>
	                <li class="portal-item" id="Reservation">예약 내역</li>
	                <li class="portal-item" id="mkclub" onclick="location.href = '/ldh/SomoimCreate/${sid}'">모임 개설</li>
	            </ul>
	        </div>
	        <div class="subscription-list">
	            <h3>작성한 게시글</h3>
	        </div>
	        <div class="subscription">
	            <div class="club">
	                <ul class="club-list">
	                <c:forEach items="${nickCheck}" var="nickCheck">
	                	<li class="club-item"><a class="gat-href" href="<c:url value='/ldh/Communityboard/${nickCheck.commuNo}'/>">
	                		${nickCheck.commuTitle}/댓글수${nickCheck.commuComNum}
	               		</a></li>
	                </c:forEach>
	                </ul>
	            </div>
	        </div>
	    </div>
  	<!-- BOTTOM  -->
    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
    </div>
     <script src="<c:url value="/js/pdh/mypage.js" />"></script>
</body>
</html>
