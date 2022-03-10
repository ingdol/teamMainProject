<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="<c:url value='/css/sej/chatBtn.css'/>" rel="stylesheet" type="text/css">
	</head>
	<body>
					<!-- <div class="chatFirst"> -->
		     			<ul>
		     			<c:if test="${empty sessionScope.sid}" >
		     			<li class="welcomeCht"><a href="<c:url value='/chatbotForm'/>"><p id="chatListName">Daily&Linker 안내</p>
				         			<br><p>모임일정과 공간대여를 한번에 가능한</p><br><p>'Daily&Linker' 입니다.</p>
				         			<br><p>로그인 후 모임&클래스에서 채팅으로 소통하세요!</p>
				         			<br><p>궁금한 점은 아래 챗봇 채팅을 이용해주세요.</p></a></li>
				         
				         </c:if>
				         <li id="ChtLi"><a href="<c:url value='/chatbotForm'/>"><p id="chatListName">Daily&Linker</p>
				         			<br><p>1:1 문의하기</p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
				         
				         <c:if test="${not empty sessionScope.sid}">
					         <li id="ChtLi"><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo1}'/>" ><p id="chatListName">${gatV1.gatName}</p>
					         		<br><p>채팅하기</p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li id="ChtLi"><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo2}'/>" ><p id="chatListName">${gatV2.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li id="ChtLi"><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo3}'/>" ><p id="chatListName">${gatV3.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li id="ChtLi"><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo4}'/>" ><p id="chatListName">${gatV4.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li id="ChtLi"><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo5}'/>" ><p id="chatListName">${gatV5.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
				         </c:if>
				       </ul>
		     		<!-- </div> -->
	</body>
</html>