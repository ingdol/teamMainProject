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
<%-- 		  <script src="<c:url value='/js/ldh/Sajax.js'/>"></script> --%>
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
	</head>
	<body>
		
		<div id="mainWrap">
	    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   <br>
			<section>
		<div class="wrap">
				<h3 align="center">카테고리</h3><br>
			<form id="SBoardForm" name="SBoardForm" method="post"  action="/sboard" enctype="multipart/form-data">
				
				<table border="0" align='center'>
				<tr height="60px"><td align='right'>
				<input type="radio" id="toggle-1" name="gatDetCategory" value=0>      			
				<label for="toggle-1" >일상</label></td><td>&nbsp;&nbsp;</td>
				<td align='left'><input type="radio" id="toggle-2" name="gatDetCategory" value=1>      			
				<label for="toggle-2" >리뷰</label> </td></tr>
				
				<tr><td colspan="3">당신의 닉네임은?: <input type="text" id="memNick" name="memNick" ></td></tr>
				<tr><td colspan="3">
				당신의 소모임은?: <input type="text" id="gatNo" name="gatNo" ></td></tr>			
				
				<tr><td colspan="3"><input type="text" id="gatDetTitle" name="gatDetTitle" 
				style="width:1000px; height:40px; padding-left: 10px;" placeholder="제목을 입력해주세요" 
				onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력해주세요'">
				</td></tr>
				
<!-- 				<input type="text" id="gatDetInfo" name="gatDetInfo" style="text-align: top; width:510px; height:537px"> -->
				<tr><td colspan="3"><textarea id="gatDetInfo" name="gatDetInfo" 
				rows="15" cols="141" style="padding-left: 10px; padding-top: 10px;" placeholder="내용을 입력해주세요" onfocus="this.placeholder=''" 
				onblur="this.placeholder='내용을 입력해주세요'" ></textarea>
				</td></tr>
				<tr><td colspan="3" align="left" class="filebox">

			<input class="upload-name" value="첨부파일">
			<label for="file">사진 찾기</label>
			<input type="file" id="file" name="uploadFile">
			
		</td></tr>
				<tr><td colspan="3" align="right">
				<input type="submit" value="등록" class="subbox"></td></tr>
				</table>
			</form>
		</div>
		</section>
		<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    </div>
	</body>
</html>