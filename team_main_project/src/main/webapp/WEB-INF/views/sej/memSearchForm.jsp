<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/allSearch.js'/>"></script>
	</head>
	<body>
		<div id="mainWrap">			
		
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
				<h1 id="mgText">회원 정보 검색</h1>
						<div id="pos">
            			<a href="<c:url value='/memList/listAllMember'/>"><button class = "btn_in">전체 회원 조회</button></a>
            			<hr id="mgHr"> </div>
				<form id="memSearchFrm">
					<input id="searchInput" type="text" name="keyword">
					<input id="searchBtn" type="submit" value="검색">
				</form>
				<div id="searchResultbox"></div>
		
		
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
	</body>
</html>