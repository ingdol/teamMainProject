<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소모임 게시판</title>
		<link rel="stylesheet" href="<c:url value="/css/ldh/Sdetail.css" />">
	</head>
	<body>
		<div class ="wrap">
			<div class="boardtitle">
			${gat.gatDetTitle}
			</div>
			<br><br>
			<div class="nick"> ${gat.memNick}</div><br>
			<div class="date">작성일자 : ${gat.gatDetDate}<br>
			조회수 : ${gat.gatDetView}
			</div>
			<br>
			<br>
			<div class="boardDetail">
			${gat.gatDetInfo }
			</div>
			
		</div>
	</body>
</html>