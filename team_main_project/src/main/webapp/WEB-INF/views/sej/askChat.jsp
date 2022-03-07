<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="<c:url value='/css/sej/chatting.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="<c:url value='/js/sej/askChat.js'/>"></script>
	</head>
	<body>
	<div id="mainWrap">		
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
				<div id="container" class="container">
					<h1>1:1 문의</h1>
					<input type="hidden" id="sessionId" value="">
					<input type="hidden" id="roomNumber" value="${chat.gatNo}0${chat.chatNo}">
					
					<div id="chating" class="chating">
					</div>
					<div class="chatBox">
						<div class="chatMenuBox">
							<ul>
								<li class="chat3"><button type="button" class="btn btn-outline-primary">모임장소</button></li>
								<li class="chat2"><button type="button" class="btn btn-outline-primary">모임시간</button></li>
								<li class="chat1"><button type="button" class="btn btn-outline-primary">모임소개</button></li>								
							</ul>
						</div>
						<div class="chatWelcome">
							<input type="hidden" id="chatWelcome" value="${chat.chatWelcome}">
						</div>
						<div class="chatInfo">
							<input type="hidden" id="chatInfo" value="${chat.chatInfo}">
						</div>
						<div class="chatTime">
							<input type="hidden" id="chatTime" value="${chat.chatTime}">
						</div>
						<div class="chatArea">
							<input type="hidden" id="chatArea" value="${chat.chatArea}">
						</div>
					</div>
					<c:if test="${not empty sessionScope.sid}"> <!-- 로그인했을때 --> 
						<div id="yourName" class="yourInputBox">
							<input type="hidden" type="text" name="userName" id="userName" value="${mem.memNick}" class="chattingInput">
							<button onclick="chatName()" id="startBtn" class="chattingBtn">채팅으로 문의하기</button>
						</div>
					</c:if>
					<div id="yourMsg" class="yourInputBox">
						<input id="chatting" name="chatting" placeholder="보내실 메시지를 입력하세요." class="chattingInput">
						<button onclick="send()" id="sendBtn" class="chattingBtn">보내기</button>
					</div>
				</div>
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
	</div>
	</body>
</html>