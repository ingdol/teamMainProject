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
			<tr><td colspan="4" class="boardtitle" align="left">${gat.gatDetTitle}<br></td></tr>
			<tr><td class="nick">${gat.memNick}</td><td colspan="2"></td>
							<td><img src="<c:url value='/image/ldh/star2.png'/>" width="20px" height="20px"> 
							${gat.gatDetLike}</td></tr>
			<tr><td class="detail1" align="left" colspan="2">작성일자 : ${gat.gatDetDate}<br>조회수 : ${gat.gatDetView}회</td><td></td>
			<td><img src="<c:url value='/image/ldh/comment.png'/>" width="20px" height="20px">  
			${gat.gatDetComNum}</td></tr>

			
			<tr><td colspan="4"  class="boardDetail" align="left">
			${gat.gatDetInfo }
			</td></tr>

			<tr><td align="center" colspan="4"><img src="<c:url value='/image/ldh/star1.png'/>" width="40px" height="40px"> 추천!
			<img src="<c:url value='/image/ldh/siren.png'/>" width="40px" height="40px"> 신고</td></tr>
			
			
			<tr><td colspan="4" align="left">댓글 ${gat.gatDetComNum}</td></tr>
			 </table>
			 
<%-- 				<c:forEach items="${comList }" var="com">  --%>
<%-- 			    <c:if test= "${com.plNo == '1'}">  --%>
				<table class="comment" align="center" border="0" width="500px">
					<tr><td align="left">님</td><td align="right"><img src="<c:url value='/image/ldh/siren.png'/>" width="40px" height="40px"> 신고</td></tr>
					<tr><td colspan="2"></td></tr>
				</table>
			
<%--  				</c:if> --%>
<%-- 				</c:forEach> --%>
				
			
		</div>
	</body>
</html>