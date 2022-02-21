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
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
	
	<!-- TOP  -->
	<div id="mainWrap">
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
			<section>
			
		<div class ="wrap">
			<table border = "0" align="center" >
			<tr><td colspan="4"><img src="<c:url value='/image/ldh/ex${gat.gatNo}.png'/> "></td></tr>
			<tr><td colspan="4" class="boardtitle" align="left">${gat.gatDetTitle}<br></td></tr>
			</table>
			<br>
			<table border = "0" align="center" class="detail1">
			<tr><td align="left" colspan="2"><h3>${gat.memNick}</h3><br>
			작성일자 : ${gat.gatDetDate}<br>조회수 : ${gat.gatDetView}회</td><td></td>
			<td align="right"><img src="<c:url value='/image/ldh/star2.png'/>" width="20px" height="20px"> 
			${gat.gatDetLike}<br>
			<img src="<c:url value='/image/ldh/comment.png'/>" width="20px" height="20px">  
			${gat.gatDetComNum}</td></tr>
			</table>
			<br>
			<table border = "0" align="center" >
			<tr><td colspan="4"  class="boardDetail" align="left">
			${gat.gatDetInfo }
			</td></tr>

			<tr><td align="center" colspan="4"><br><img src="<c:url value='/image/ldh/star1.png'/>" width="40px" height="40px"> 추천!
			<img src="<c:url value='/image/ldh/siren.png'/>" width="40px" height="40px"> 신고</td></tr>
			
			
			<tr><td colspan="4" align="left">댓글 ${gat.gatDetComNum}</td></tr>
			 </table>
			 </div>
			</section>
			 <section>
			 <div class ="wrap">
			 
			
			<ol class="comList">
				<c:forEach items="${comList }" var="comList"> 

				<table class="comment" align="center" border="0" width="1000px">
					<tr><td align="left"><b>${comList.memNick}</b>님</td><td align="right"><img src="<c:url value='/image/ldh/siren.png'/>" width="40px" height="40px"> 신고</td></tr>
					<tr><td colspan="2" align="left">${comList.gatDetComInfo}</td></tr>
				</table>
			
				</c:forEach>
			</ol>
			
		</div>
		 </section>
		 <!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    
		   </div>
	</body>
</html>