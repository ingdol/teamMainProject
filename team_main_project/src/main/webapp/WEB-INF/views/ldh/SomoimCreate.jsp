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
	</head>
	<body>
		<div id="mainWrap">
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
			<section>
			<h2>소모임 만들기</h2><br><br>
			
			<form id="SCreateForm" name="SCreateForm" method="post"  action="/screate">
			
			<div class="toggle">
				<input type="radio" id="toggle-1" name="onoffline" value=0>
    			<label for="toggle-1" >&nbsp;&nbsp;온라인&nbsp;&nbsp;</label>
  		  		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  		  		<input type="radio" id="toggle-2" name="onoffline" value=1>
  			  	<label for="toggle-2">&nbsp;오프라인&nbsp;</label>
			</div>
			<br><br><br>
			
			<h3>카테고리를 선택해주세요.</h3><br>
			<div class="toggle2">

				<input type="checkbox" id="toggle2-1" name="hobbyNo" value=1>
    			<label for="toggle2-1" ><img src="<c:url value='/image/hobbyCtg/1_sport2.png'/>" width="100px" height="100px"></label>
  		  		<input type="checkbox" id="toggle2-2" name="hobbyNo" value=2>
  			  	<label for="toggle2-2"><img src="<c:url value='/image/hobbyCtg/2_outdoor2.png'/>" width="100px" height="100px"></label>
				<input type="checkbox" id="toggle2-3" name="hobbyNo" value=3>
  			  	<label for="toggle2-3"><img src="<c:url value='/image/hobbyCtg/3_study2.png'/>" width="100px" height="100px"></label>
				<input type="checkbox" id="toggle2-4" name="hobbyNo" value=4>
  			  	<label for="toggle2-4"><img src="<c:url value='/image/hobbyCtg/4_travel2.png'/>" width="100px" height="100px"></label><br>
				<input type="checkbox" id="toggle2-5" name="hobbyNo" value=5>
  			  	<label for="toggle2-5"><img src="<c:url value='/image/hobbyCtg/5_cook2.png'/>" width="100px" height="100px"></label>
				<input type="checkbox" id="toggle2-6" name="hobbyNo" value=6>
  			  	<label for="toggle2-6"><img src="<c:url value='/image/hobbyCtg/6_animal2.png'/>" width="100px" height="100px"></label>
				<input type="checkbox" id="toggle2-7" name="hobbyNo" value=7>
  			  	<label for="toggle2-7"><img src="<c:url value='/image/hobbyCtg/7_picture2.png'/>" width="100px" height="100px"></label>
				<input type="checkbox" id="toggle2-8" name="hobbyNo" value=8>
  			  	<label for="toggle2-8"><img src="<c:url value='/image/hobbyCtg/8_help2.png'/>" width="100px" height="100px"></label>
				<input type="checkbox" id="toggle2-9" name="hobbyNo" value=9>
  			  	<label for="toggle2-9"><img src="<c:url value='/image/hobbyCtg/9_art2.png'/>" width="100px" height="100px"></label>
				
			
			</div>
			<br><br>
			
			<h3>생성할 소모임의 제목을 입력해주세요.</h3>
			<div class="s-title">
			<input type="text" id="gatName" name="gatName" 
				style="width:1000px; height:40px" placeholder="소모임 제목을 입력해주세요" 
				onfocus="this.placeholder=''" onblur="this.placeholder='소모임 제목을 입력해주세요'">
			</div>
			
			
			</form>
			
			
			 </section>
		 <!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    
		   </div>
	</body>
</html>