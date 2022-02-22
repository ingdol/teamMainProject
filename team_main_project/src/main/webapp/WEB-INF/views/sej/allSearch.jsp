<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/allSearch.js'/>"></script>
	</head>
	<body>
		<div id="mainWrap">			
		
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		
			<section>
				<div id="searchResultbox"></div>
			</section>
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
	</body>
</html>