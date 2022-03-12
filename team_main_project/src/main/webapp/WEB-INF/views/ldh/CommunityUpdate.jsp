<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 수정</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		  <script src="<c:url value='/js/ldh/Swrite.js'/>"></script>
 		  <script src="<c:url value='/js/ckeditor/ckeditor.js'/>"></script>
 		  <script src="<c:url value='/js/ckeditor/ko.js'/>"></script>
		  <link rel="stylesheet" href="<c:url value="/css/ldh/CWrite.css" />">
		  <style>
		  		.ck.ck-editor{
		  			max-width: 890px;
		  		}
		  		.ck-editor__editable{
		  			min-height: 300px;
		  		}
		  </style>
	</head>
	<body>
		
		
<div id="mainWrap">
	    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   <br>
			<section>
		<div id="wrap4">
			<form id="CommuBoardForm" name="CommuBoardForm" method="post"  action="/communityupdate" enctype="multipart/form-data">
				<input type="hidden" id="commuNo" name="commuNo" value="${com.commuNo}">
					<table border="0" align='left'>
				<tr><td><img src="<c:url value='/image/ldh/write.png'/>" width="40px" height="40px"><span><b>글쓰기</b></span></td></tr>
				</table><br><br><br>
				
				<hr width="890px" color="#ffb173">
				
				
				<table border="0" align='center'>
				
				<c:if test="${com.commuCtgNo == '1' }">
				<tr height="60px"><td align='left' colspan="3" class="toggle2" >
				<input type="radio" id="toggle4-1" name="commuCtgNo" checked="checked" value='1'>      			
				<label for="toggle4-1" >일상</label>&nbsp;&nbsp;
				<input type="radio" id="toggle4-2" name="commuCtgNo" value='2'>      			
				<label for="toggle4-2" >홍보</label> </td></tr>
				</c:if>
				<c:if test="${com.commuCtgNo == '2' }">
				<tr height="60px"><td align='left' colspan="3" class="toggle2" >
				<input type="radio" id="toggle4-1" name="commuCtgNo"  value='1'>      			
				<label for="toggle4-1" >일상</label>&nbsp;&nbsp;
				<input type="radio" id="toggle4-2" name="commuCtgNo" value='2' checked="checked">      			
				<label for="toggle4-2" >홍보</label> </td></tr>
				</c:if>
							
				
				<tr><td colspan="3"><input type="text" id="commuTitle" name="commuTitle" value="${com.commuTitle}"
				style="width:870px; height:40px; padding-left: 10px;" placeholder="제목을 입력해주세요" 
				onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력해주세요'">
				</td></tr>
				
<!-- 				<input type="text" id="commuInfo" name="commuInfo" style="text-align: top; width:510px; height:537px"> -->
				<tr><td colspan="3"><br><textarea id="commuInfo" name="commuInfo" 
				 style="padding-left: 10px; padding-top: 10px;" placeholder="내용을 입력해주세요" onfocus="this.placeholder=''" 
				onblur="this.placeholder='내용을 입력해주세요'" >${com.commuInfo }</textarea>
				<script>
				 ClassicEditor
		            .create( document.querySelector( '#commuInfo' ), {
		                language: {ui: 'ko', content: 'ko'} //언어설정
		            })
		            .catch( error => {
		                console.error( error );
		            } );
				</script>
				
				</td></tr>

				<tr><td colspan="3" align="right"><br>
				<input type="submit" value="수정" class="subbox4"></td></tr>
				</table>
			</form>
		</div>
		</section>
		<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    </div>
	</body>
</html>
