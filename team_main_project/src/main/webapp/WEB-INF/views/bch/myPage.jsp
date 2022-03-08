<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>My Page</title>
        <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/css/sun/suncommon.css'/>" rel="stylesheet" type="text/css">
        <link href="<c:url value='/css/sun/detailgat.css'/>" rel="stylesheet" type="text/css">
        <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
        <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/js/sun/detailgat.js'/>"></script>
		<script src="<c:url value='/js/bch/myPage.js'/>"></script>
    </head>
    <body>
    <div id ="mainWrap">
        <!-- TOP  -->
        <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
        <!-- TOP  -->
        <div id="Wrap">
            <span>
                <p>예약 목록</p>
						<div class="board_list_wrap">
							<div class="board_list">
								<div class="top">
									<div class="title">공간 이름</div>
                                    <div class="title">날짜</div>
									<div class="title">시작 시간</div>
									<div class="title">끝 시간</div>
									<div class="title">가격</div>
									<div class="title">취소</div>
									<div class="title">리뷰 작성</div>
								</div>
								<jsp:useBean id="now" class="java.util.Date"/>
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="nowDate"/>
								<c:forEach items="${ReservationList}" var="List">
									<input type="hidden" value="${List.spaceReserNo}" id="spaceReserNo" name="spaceReserNo">
									<div class="top">
										<div class="title">${List.spaceTitle}</div>
										<div class="title" id="comTitle">
											${List.spaceReserDate}
										</div>
										<div class="title" id="comId">${List.spaceReserStartTime}</div>
										<div class="title" id="comDate">${List.spaceReserEndTime}</div>
										<div class="title" id="comCount">${List.spacePay}</div>
										<c:choose>
											<c:when test="${List.spaceReserDate > nowDate}">
												<input type="button" value="예약 취소" id="ReservationCancel" class="ReservationCancel">
											</c:when>
											<c:otherwise>
												<input type="button" value="예약 취소" id="FakeReservationCancel" class="FakeReservationCancel">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${List.spaceReserDate < nowDate}">
												<a href="/WriteSpaceReview/${List.spaceReserNo}"><div class="title" id="comCount">리뷰 작성</div></a>
											</c:when>
											<c:otherwise>
												<a><div class="title" id="comCount">리뷰 작성</div></a>
											</c:otherwise>
										</c:choose>
									</div>
                                </c:forEach>
							</div>
						</div>
            </span>
<%--            <span>--%>
<%--                <p>예약 목록(공간 주인만)</p>--%>
<%--						<div class="board_list_wrap">--%>
<%--							<div class="board_list">--%>
<%--								<div class="top">--%>
<%--									<div class="title">공간 이름</div>--%>
<%--                                    <div class="title">날짜</div>--%>
<%--									<div class="title">시작 시간</div>--%>
<%--									<div class="title">끝 시간</div>--%>
<%--									<div class="title">가격</div>--%>
<%--									<div class="title">취소</div>--%>
<%--								</div>--%>
<%--								<c:forEach items="${gatherCommu}" var="com">--%>
<%--									<div class="top">--%>
<%--										<div class="num">${com.gatDetNo}</div>--%>
<%--										<div class="title" id="comTitle">--%>
<%--											<a href="<c:url value='/ldh/Somoimboard/${com.gatNo}/${com.gatDetNo}'/>">${com.gatDetTitle}/댓글수${com.gatDetComNum}</a>--%>
<%--										</div>--%>
<%--										<div class="writer" id="comId">${com.memNick}</div>--%>
<%--										<div class="date" id="comDate"><fmt:formatDate value="${com.gatDetDate}" pattern="YY/MM/dd"/></div>--%>
<%--										<div class="count" id="comCount">${com.gatDetView}</div>--%>
<%--									</div>--%>
<%--                                </c:forEach>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--                <p>공간 목록(공간 주인만)</p>--%>
<%--						<div class="board_list_wrap">--%>
<%--							<div class="board_list">--%>
<%--								<div class="top">--%>
<%--									<div class="num">번호</div>--%>
<%--									<div class="title">제목</div>--%>
<%--									<div class="writer">글쓴이</div>--%>
<%--									<div class="date">작성일</div>--%>
<%--									<div class="count">조회</div>--%>
<%--								</div>--%>
<%--								<c:forEach items="${gatherCommu}" var="com">--%>
<%--									<div class="top">--%>
<%--										<div class="num">${com.gatDetNo}</div>--%>
<%--										<div class="title" id="comTitle">--%>
<%--											<a href="<c:url value='/ldh/Somoimboard/${com.gatNo}/${com.gatDetNo}'/>">${com.gatDetTitle}/댓글수${com.gatDetComNum}</a>--%>
<%--										</div>--%>
<%--										<div class="writer" id="comId">${com.memNick}</div>--%>
<%--										<div class="date" id="comDate"><fmt:formatDate value="${com.gatDetDate}" pattern="YY/MM/dd"/></div>--%>
<%--										<div class="count" id="comCount">${com.gatDetView}</div>--%>
<%--									</div>--%>
<%--                                </c:forEach>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--            </span>--%>
        </div>
        <!-- BOTTOM  -->
        <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
        <!-- BOTTOM  -->
    </div>
    </body>
</html>