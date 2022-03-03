<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="<c:url value='/css/sej/chatting.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/chatting.js'/>"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>
		<div id="mainWrap">			
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
				<div id="container" class="container">
				<c:forEach items="${gatV}" var="gatV">
						
					<h1>${gatV.gatName}의 채팅방</h1>
					<input type="hidden" id="sessionId" value="">
					<input type="hidden" id="roomNumber" value="${gatV.gatNo}">
					
					<div id="chating" class="chating">
					</div>
					
					<c:if test="${not empty sessionScope.sid}"> <!-- 로그인했을때 --> 
						<div id="yourName" class="yourInputBox">
							<input type="text" name="userName" id="userName" value="${mem.memNick}" class="chattingInput">
							<button onclick="chatName()" id="startBtn" class="chattingBtn">채팅 시작</button>
						</div>
					</c:if>
					<div id="yourMsg" class="yourInputBox">
						<input id="chatting" name="chatting" placeholder="보내실 메시지를 입력하세요." class="chattingInput">
						<button onclick="send()" id="sendBtn" class="chattingBtn">보내기</button>
					</div>
			</c:forEach>
				</div>
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
	</body>
</html>