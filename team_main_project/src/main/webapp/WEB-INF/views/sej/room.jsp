<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="<c:url value='/css/sej/room.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/room.js'/>"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h1>채팅방</h1>
			<div id="roomContainer" class="roomContainer">
				<table id="roomList" class="roomList"></table>
			</div>
			<div>
				<table class="inputTable">
					<tr>
						<th>방 제목</th>
						<th><input type="text" name="roomName" id="roomName"></th>
						<th><button id="createRoom">방 만들기</button></th>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>