<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소모임 게시판</title>
		<link rel="stylesheet" href="<c:url value="/css/ldh/Sdetail.css" />">
<link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
	</head>
	<body>
		<div id ="wrap">
			<table border = "0" align="center">
			<tr><td colspan="3" class="boardtitle" align="left">${gat.gatDetTitle}<br></td></tr>
			<tr><td class="nick">${gat.memNick}</td><td></td>
							<td><img src="<c:url value='/image/ldh/star2.png'/>" width="20px" height="20px"> 
							${gat.gatDetLike}</td></tr>
			<tr><td class="detail1" align="left">작성일자 : ${gat.gatDetDate}<br>조회수 : ${gat.gatDetView}회</td><td></td>
			<td><img src="<c:url value='/image/ldh/comment.png'/>" width="20px" height="20px">  
			${gat.gatDetComNum}</td></tr>

			
			<tr><td colspan="3"  class="boardDetail" align="left">
			${gat.gatDetInfo }
			</td></tr>
			<tr><td colspan="3"><img src="<c:url value='/image/ldh/star1.png'/>" width="40px" height="40px">
			</td></tr>
			</table>
		</div>
	</body>
</html>