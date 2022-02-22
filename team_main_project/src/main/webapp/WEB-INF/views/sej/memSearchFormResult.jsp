<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
			</head>
	<body>
			<br>
			<table id="memListTable" border="1">
			<c:choose>
				<c:when test="${empty gatSearchList}">
					<tr align="center"><td colspan="6">찾는 회원이 없습니다.</td></tr>
				</c:when>
			  <c:otherwise>
				   <c:forEach items="${gatSearchList}" var="gat">
				   	<tr>
							   		   <td>${gat.gatName}</td>
							   	</tr>
				   </c:forEach>
			   </c:otherwise>				
			</c:choose>
		</table>		
	</body>
</html>