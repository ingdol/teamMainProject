<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공간대여 개설 페이지</title>
		  <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SCreate.css" />">
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
		  <script src="<c:url value='/js/ldh/screate.js'/>"></script>
		  <script src="<c:url value='/js/ldh/Swrite.js'/>"></script>
		  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
		  <script src="<c:url value='/js/searchZip.js'/>"></script>	
	</head>
	<body>
		<div id="mainWrap">
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
			<section>
			<div id="wrap2">
			<br><br><br>
			<h2>공간 개설</h2><br>
			
				
			<form id="SpaceCreateForm" name="SpaceCreateForm" method="post"  action="/spacecreate" enctype="multipart/form-data">
			
			<c:if test="${not empty sessionScope.sid }">
			<input type="hidden" id="memNick" name="memNick" value="${sessionScope.snick}"><br>
			</c:if>
			
<br><h3>${sessionScope.snick}님이 게시할 공간의 주소를 선택해주세요.</h3><br>
			<div class="select">
<!-- 			 	<input type="text" id="zipcode" name="zipcode"   size="5" >  -->
				<input type="text"  id="memAddress1" class="memAddress1"  name="memAddress1" size="70" readonly>
				<input type="button" id="searchZip" class = "searchZip" name="searchZip" value="우편번호찾기" readonly><br>
				 
<!-- 				<input type="text" id="memAddress2"  name="memAddress2" size="70" placeholder="상세 주소 입력"> -->
			</div>
<!-- 			<input type="hidden" id="gatArea" name="gatArea" oninput="_onSubmit()"> -->
			<br><br>
			<div class="toggle2">

				
			</div>
			<br><br>
			
			<h3>당신의 공간을 소개해보세요!</h3><br>
			<input type="text" id="spaceTitle" name="spaceTitle" 
				style="width:500px; height:40px; text-align:center; background: #FFFFFF; border: 1px solid rgba(173, 0, 255, 0.25);
							box-sizing: border-box; box-shadow: 0px 4px 4px rgba(173, 0, 255, 0.25); border-radius: 10px;" placeholder="소개글의 제목을 입력해주세요." 
				onfocus="this.placeholder=''" onblur="this.placeholder='소개글의 제목을 입력해주세요.'">
			<br><br>
			<textarea id="spaceInfo" name="spaceInfo" rows="15" cols="66" placeholder="공간에 대한 설명을 입력해주세요" 
			onfocus="this.placeholder=''" onblur="this.placeholder='공간에 대한 설명을 입력해주세요'"  style="background: #FFFFFF; border: 1px solid rgba(0, 0, 0, 0.25);
			box-sizing: border-box; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); border-radius: 10px; padding:10px;"></textarea>
			
			<br><br>
			<h4>당신의 공간을 대표하는 사진을 넣어주세요..</h4>
			<div class="filebox3">
			<input class="upload-name" value="첨부파일">
			<label for="file">사진 찾기</label>
			<input type="file" id="file" name="uploadFile1"><br><br>
			</div>
			<h4>공간의 사진을 여러개 넣어주세요.</h4>
			<div class="filebox4">
			<input class="upload-name2" value="첨부파일">
			<label for="file2">사진 찾기</label>
			<input type="file" id="file2" name="uploadFile2">
			
			<br><br><br>
			<input type="submit" value="공간 개설하기" class="subbox3" >
			</div>
			</form>
			
			
			</div>
			 </section>
		 <!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    
		   </div>
	</body>
</html>