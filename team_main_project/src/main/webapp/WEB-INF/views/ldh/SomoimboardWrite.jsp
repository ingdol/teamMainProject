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
				<table border="0" align='center'>
				
				<tr><td colspan="3">당신의 닉네임은?: <input type="text" id="memNick" name="memNick" ></td></tr>
				<tr><td colspan="3">
				당신의 소모임은?: <input type="text" id="gatNo" name="gatNo" ></td></tr>			
				
				<tr><td colspan="3"><input type="text" id="gatDetTitle" name="gatDetTitle" style="width:510px; height:31px" placeholder="제목을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력해주세요'">
				</td></tr>
				
<!-- 				<input type="text" id="gatDetInfo" name="gatDetInfo" style="text-align: top; width:510px; height:537px"> -->
				<tr><td colspan="3"><textarea id="gatDetInfo" name="gatDetInfo" rows="15" cols="71" placeholder="내용을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='내용을 입력해주세요'"></textarea>
				</td></tr>
				<tr><td colspan="2"></td><td>
				<input type="submit" value="등록" class="subbox"></td></tr>
				</table>
			</form>
		</div>
	</body>
</html>