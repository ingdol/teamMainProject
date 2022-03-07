<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소모임 만들기 페이지</title>
		  <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SCreate.css" />">
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
		  <script src="<c:url value='/js/ldh/screate.js'/>"></script>
		  <script src="<c:url value='/js/ldh/Swrite.js'/>"></script>
	</head>
	<body>
		<div id="mainWrap">
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
			<section>
			<div id="wrap2">
			<br><br><br>
			<h2>소모임 만들기</h2><br><br><br>
			
				
			
			<form id="SCreateForm" name="SCreateForm" method="post"  action="/screate" enctype="multipart/form-data">
			
			<c:if test="${not empty sessionScope.sid }">
			<input type="hidden" id="memNick" name="memNick" value="${sessionScope.snick}"><br>
			</c:if>
			
<br><h3>소모임을 열 지역을 선택해주세요.</h3><br>
			<div class="select">
			 <select name="gatArea1" id="gatArea1" onchange="categoryChange(this)">
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
			<select name="gatArea2" id="state">
              <option>군/구 선택</option>
            </select>
			</div>
<!-- 			<input type="hidden" id="gatArea" name="gatArea" oninput="_onSubmit()"> -->
			<br><br>
			<h3>소모임의 카테고리를 선택해주세요.</h3><br>
			<div class="toggle2">

				<input type="radio" id="toggle2-1" name="hobbyNo" value="1">
    			<label for="toggle2-1" ><img src="<c:url value='/images/1.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
  		  		<input type="radio" id="toggle2-2" name="hobbyNo" value="2">
  			  	<label for="toggle2-2"><img src="<c:url value='/images/2.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle2-3" name="hobbyNo" value="3">
  			  	<label for="toggle2-3"><img src="<c:url value='/images/3.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle2-4" name="hobbyNo" value="4">
  			  	<label for="toggle2-4"><img src="<c:url value='/images/4.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label><br>
				<input type="radio" id="toggle2-5" name="hobbyNo" value="5">
  			  	<label for="toggle2-5"><img src="<c:url value='/images/5.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle2-6" name="hobbyNo" value="6">
  			  	<label for="toggle2-6"><img src="<c:url value='/images/6.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle2-7" name="hobbyNo" value="7">
  			  	<label for="toggle2-7"><img src="<c:url value='/images/7.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle2-8" name="hobbyNo" value="8">
  			  	<label for="toggle2-8"><img src="<c:url value='/images/8.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				<input type="radio" id="toggle2-9" name="hobbyNo" value="9">
  			  	<label for="toggle2-9"><img src="<c:url value='/images/9.jpg'/>" width="100px" height="100px" style=" border-radius: 10px;"></label>
				
			
			</div>
			<br><br>
			
			<h3>생성할 소모임의 제목을 입력해주세요.</h3><br>
			<input type="text" id="gatName" name="gatName" 
				style="width:500px; height:40px; text-align:center; background: #FFFFFF; border: 1px solid rgba(0, 133, 255, 0.25);
							box-sizing: border-box; box-shadow: 0px 4px 4px rgba(0, 133, 255, 0.25); border-radius: 10px;" placeholder="소모임 제목을 입력해주세요" 
				onfocus="this.placeholder=''" onblur="this.placeholder='소모임 제목을 입력해주세요'">
			<br><br>
			<textarea id="gatDetInfo" name="gatDetInfo" rows="15" cols="66" placeholder="소모임에 대한 설명을 입력해주세요" 
			onfocus="this.placeholder=''" onblur="this.placeholder='소모임에 대한 설명을 입력해주세요'"  style="background: #FFFFFF; border: 1px solid rgba(0, 0, 0, 0.25);
			box-sizing: border-box; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); border-radius: 10px; padding:10px;"></textarea>
			
			<br><br>
			<h4>소모임을 대표하는 사진을 넣어주세요.</h4>
			<div class="filebox">
			<input class="upload-name" value="첨부파일">
			<label for="file">사진 찾기</label>
			<input type="file" id="file" name="uploadFile1"><br><br>
			</div>
			<h4>소모임의 배너 사진을 넣어주세요.</h4>
			<div class="filebox2">
			<input class="upload-name2" value="첨부파일">
			<label for="file2">사진 찾기</label>
			<input type="file" id="file2" name="uploadFile2">
			
			<br><br>
			<input type="submit" value="소모임 만들기" class="subbox2" >
			</div>
			</form>
			
			
			</div>
			 </section>
		 <!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    
		   </div>
	</body>
</html>