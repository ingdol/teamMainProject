<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 등록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		  <script src="<c:url value='/js/ldh/Swrite.js'/>"></script>
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
	</head>
	<body>
		<div id="wrap">
			<form id="SBoardForm" name="SBoardForm" method="post"  action="/sboard">
				당신의 닉네임은?: <input type="text" id="memNick" name="memNick" ><br>
				당신의 소모임은?: <input type="text" id="gatNo" name="gatNo" ><br>			
				<input type="text" id="gatDetTitle" name="gatDetTitle" style="width:510px; height:31px">
				<br><br>
				
				<input type="text" id="gatDetInfo" name="gatDetInfo" style="text-align: top; width:510px; height:537px">
				<br><br>
				<input type="submit" value="등록" class="subbox">
			</form>
		</div>
	</body>
</html>