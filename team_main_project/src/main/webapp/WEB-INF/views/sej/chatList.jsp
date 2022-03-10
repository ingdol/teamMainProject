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
				         <li><a href="<c:url value='/chatbotForm'/>"><p id="chatListName">Daily&Linker</p>
				         			<br><p>1:1 문의하기</p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
				         <c:if test="${not empty sessionScope.sid}">
					         <li><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo1}'/>" ><p id="chatListName">${gatV1.gatName}</p>
					         		<br><p>채팅하기</p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo2}'/>" ><p id="chatListName">${gatV2.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo3}'/>" ><p id="chatListName">${gatV3.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo4}'/>" ><p id="chatListName">${gatV4.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
					         <li><a href="<c:url value='/chat/${sessionScope.sid}/${mem.gatJoinNo5}'/>" ><p id="chatListName">${gatV5.gatName}</p>
					         		<br><p>채팅하기 </p><img src="<c:url value='/img/sej/chatIn.png'/>"  id="chatInImg"></a></li>
				         </c:if>
				       </ul>
		     		<!-- </div> -->
	</body>
</html>