<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		index 입니다.
		수정 테스트 입니다.
		<form method="post" action="/sun/mapsearch">
		<input type="submit" value="전송">
		</form>
		파일 올림
		sej로 수정
		
		<hr>
		<br>
		<br>
		ldh 링크수정<br>
		<a href="<c:url value='/ldh/SomoimboardWrite/코딩이'/>">글쓰기 링크</a>
		<a href="<c:url value='/ldh/Somoimboard/1'/>">글 조회</a>
		<a href="<c:url value='/ldh/SomoimCreate'/>">소모임 만들기 링크</a>
	</body>
</html>