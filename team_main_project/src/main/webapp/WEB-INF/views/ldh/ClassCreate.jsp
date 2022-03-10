<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>클래스 개설 페이지</title>
		  <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		  <link rel="stylesheet" href="<c:url value="/css/ldh/ClassCreate.css" />">
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
		  <script src="<c:url value='/js/ldh/screate.js'/>"></script>
		  <script src="<c:url value='/js/ldh/Swrite.js'/>"></script>
		   <script src="<c:url value='/js/ldh/ClassCheck.js'/>"></script>
		  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
		  <script src="<c:url value='/js/searchZip.js'/>"></script>	
	</head>
	<body>
		<div id="mainWrap">
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
			<section>
			<div id="wrap4">
			<br><br><br>
			<h2>클래스 개설</h2><br>
			
				
			<form id="ClassCreateForm" name="ClassCreateForm" method="post" onsubmit="return validate2();"  action="/classcreate" enctype="multipart/form-data">
			
			<c:if test="${not empty sessionScope.sid }">
			<input type="hidden" id="memNick" name="memNick" value="${sessionScope.snick}"><br>
			
			</c:if>
			<div class="select">
			 <select name="classArea1" id="classArea1" onchange="categoryChange(this)">
              	<option value="">시/도 선택</option>
             	 <option value="강원">강원</option>
              <option value="경기">경기</option>
             	 <option value="경남">경남</option>
             	 <option value="경북">경북</option>
              <option value="광주">광주</option>
              <option value="대구">대구</option>
           	   <option value="대전">대전</option>
              <option value="부산">부산</option>
              <option value="서울">서울</option>
              <option value="울산">울산</option>
              <option value="인천">인천</option>
              <option value="전남">전남</option>
              <option value="전북">전북</option>
              <option value="제주">제주</option>
              <option value="충남">충남</option>
              <option value="충북">충북</option>
            </select>
			<select name="classArea2" id="state">
              <option>군/구 선택</option>
            </select>
			
			</div>
<br><h3>${sessionScope.snick}님이 게시할 클래스의 주소를 선택해주세요.</h3><br>
			
			<div class="toggle3">

				<input type="radio" id="toggle3-1" name="hobbyNo" value="1">
    			<label for="toggle3-1" ><img src="<c:url value='/images/1.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
  		  		<input type="radio" id="toggle3-2" name="hobbyNo" value="2">
  			  	<label for="toggle3-2"><img src="<c:url value='/images/2.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle3-3" name="hobbyNo" value="3">
  			  	<label for="toggle3-3"><img src="<c:url value='/images/3.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle3-4" name="hobbyNo" value="4">
  			  	<label for="toggle3-4"><img src="<c:url value='/images/4.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label><br>
				<input type="radio" id="toggle3-5" name="hobbyNo" value="5">
  			  	<label for="toggle3-5"><img src="<c:url value='/images/5.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle3-6" name="hobbyNo" value="6">
  			  	<label for="toggle3-6"><img src="<c:url value='/images/6.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle3-7" name="hobbyNo" value="7">
  			  	<label for="toggle3-7"><img src="<c:url value='/images/7.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle3-8" name="hobbyNo" value="8">
  			  	<label for="toggle3-8"><img src="<c:url value='/images/8.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle3-9" name="hobbyNo" value="9">
  			  	<label for="toggle3-9"><img src="<c:url value='/images/9.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				
			
			</div>

			<br><br>
			
			<h3>당신의 클래스를 소개해보세요!!!</h3><br>
			<input type="text" id="classTitle" name="classTitle" 
				style="width:500px; height:40px; text-align:center; background: #FFFFFF; border: 1px solid rgba(255, 0, 0, 0.25);
							box-sizing: border-box; box-shadow: 0px 4px 4px rgba(255, 0, 0, 0.5); border-radius: 10px;" placeholder="소개글의 제목을 입력해주세요." 
				onfocus="this.placeholder=''" onblur="this.placeholder='소개글의 제목을 입력해주세요.'">
			<br><br>
			<textarea id="classInfo" name="classInfo" rows="15" cols="66" placeholder="클래스에 대한 설명을 입력해주세요" 
			onfocus="this.placeholder=''" onblur="this.placeholder='클래스에 대한 설명을 입력해주세요'"  style="background: #FFFFFF; border: 1px solid rgba(0, 0, 0, 0.25);
			box-sizing: border-box; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); border-radius: 10px; padding:10px;"></textarea>
			
			<br><br>

<!-- 			<input type="time" id="spaceOpen" name="spaceOpen"> -->
			
			<br><br>
			<h4>당신의 클래스를 대표하는 사진을 넣어주세요.</h4>
			<div class="filebox5">
			<input class="upload-name" value="첨부파일">
			<label for="file5">사진 찾기</label>
			<input type="file" id="file5" name="uploadFile5"><br><br>

			<br><br><br>
			<input type="submit" value="클래스 개설하기" class="subbox3" >
			</div>
			</form>
			
			
			</div>
			 </section>
		 <!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    
		   </div>
	</body>
</html>