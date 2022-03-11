<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>공간 예약 내역</title>
        <link rel="stylesheet" href="<c:url value="/css/pdh/mypage.css" />">
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
                    <li class="portal-item" onclick="location.href = '/ReservationList'">예약 내역</li>
                    <li class="portal-item" id="mkclub">모임 개설</li>
                </ul>
            </div>
            <div class="subscription-list">
                <h3>예약 내역</h3>
            </div>
            <div class="subscription">
                <div class="club">
                    <ul class="club-list">
                        <strong id="title">공간 제목</strong>
                        <strong id="reserDate">예약일</strong>
                        <strong id="startTime">시작 시간</strong>
                        <strong id="endTime">종료 시간</strong>
                        <strong id="Pay">가격</strong>
                        <strong id="ReserCancel">예약 취소</strong>
                        <strong id="Review">리뷰 작성</strong>
                        <jsp:useBean id="now" class="java.util.Date"/>
                        <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="nowDate"/>
                        <c:forEach items="${ReservationList}" var="List">
                            <li class="club-item">
                                <input type="hidden" value="${List.spaceReserNo}" id="spaceReserNo" name="spaceReserNo">
                                <span class="list-Reser" id="list-Title"><a href="detailViewSpace/${List.spaceNo}">${List.spaceTitle}</a></span>
                                <span class="list-Reser" id="list-Date">${List.spaceReserDate}</span>
                                <span id="listStart" class="list-Reser">${List.spaceReserStartTime}</span>
                                <span id="listEnd" class="list-Reser">${List.spaceReserEndTime}</span>
                                <span class="list-Reser" id="listPay">${List.spacePay}</span>
                                <c:choose>
                                    <c:when test="${List.spaceReserDate > nowDate}">
                                        <span class="list-Reser" id="listCancel"><input type="button" value="예약 취소" id="ReservationCancel" class="ReservationCancel"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="list-Reser" id="listCancel"><input type="button" value="예약 취소" id="FakeReservationCancel" class="ReservationCancel"></span>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${List.spaceReserDate < nowDate}">
                                        <span class="list-Reser" id="list-Review"><a href="/WriteSpaceReview/${List.spaceReserNo}">리뷰 작성</a></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="list-Reser" id="list-Review"><a>리뷰 작성 불가</a></span>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/js/bch/mypage.js" />"></script>
    </body>
</html>