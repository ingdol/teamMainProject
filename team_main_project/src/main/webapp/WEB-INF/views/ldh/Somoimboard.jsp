<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소모임 게시판</title>
	</head>
	<body>
		<div id ="wrap">
			
			<form method="post" action = "<c:url value='/ldh/Somoimboard/{gatDetNo}'/>">
			${글 제목}
			
			</form>
		</div>
	</body>
</html>