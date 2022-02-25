<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>챗봇</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/chatbot.js'/>"></script>		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/sej/chatbot.css'/>">
	</head>
	<body>			
		<div id="mainWrap">
		
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
		<div id="chatSize">
			<!-- Header -->
			<div id="chatHeader">
				<span>개설자 1:1 채팅</span>
				<button id="btnClose">X</button>
			</div>
		
		<!-- 채팅 내용 출력 -->
			
			<!-- 응답 메시지 출력  -->
		<div id="chatAllBox">
			<div id="chatBox"></div><br>
			
			<div id="chatInputBox">
				<!-- 질문 메시지 입력 폼 -->
				<form id="chatForm">
					<input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">	
					
					<input type="submit" id="btnSubmit" value="전송" >		
				</form>	
				<div id="recordBox">
						<!-- 음성 녹음 -->
							<button id="record"><img src="<c:url value='/images/sej/Microphone.png'/>" id="recordImg"></button> 
							<button id="stop"><img src="<c:url value='/images/sej/BlockMicrophone.png'/>" id="stopImg"></button>
							<div id="sound-clips"></div>
				</div>	
			</div><br>
		</div>
			
			
			<div>
				<audio preload="auto" controls></audio>
			</div>			
			</div>
			
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
	</body>
</html>