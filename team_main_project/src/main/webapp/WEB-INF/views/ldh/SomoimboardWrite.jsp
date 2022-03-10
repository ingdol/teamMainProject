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
 		  <script src="<c:url value='/js/ckeditor/ckeditor.js'/>"></script>
 		  <script src="<c:url value='/js/ckeditor/ko.js'/>"></script>
		  <link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
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
		<div id="wrap">
				
			<form id="SBoardForm" name="SBoardForm" method="post"  action="/sboard" enctype="multipart/form-data">
				<table border="0" align='left'>
				<tr><td><img src="<c:url value='/image/ldh/write.png'/>" width="40px" height="40px"><span><b>글쓰기</b></span></td></tr>
				</table><br><br><br>
				<hr width="890px" color="#b3cbff">
				
				<table border="0" align='center'>
				
				<tr height="60px"><td align='left' colspan="3" class="toggle1">
				<input type="radio" id="toggle-1" name="gatDetCategory" value=0 checked="checked">      			
				<label for="toggle-1" >일상</label>&nbsp; &nbsp;
				<input type="radio" id="toggle-2" name="gatDetCategory" value=1>      			
				<label for="toggle-2" >리뷰</label> 
				</td>
				</tr>
				
				<c:if test="${not empty sessionScope.sid}">
				<tr><td colspan="3"><input type="hidden" id="memNick" name="memNick" value="${sessionScope.snick}"></td></tr>
				<tr><td colspan="3">
				<input type="hidden" id="gatNo" name="gatNo" value="${gath.gatNo}"></td></tr>
				</c:if>
							
				
				<tr><td colspan="3"><input type="text" id="gatDetTitle" name="gatDetTitle" 
				style="width:870px; height:40px; padding-left: 10px;" placeholder="제목을 입력해주세요" 
				onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력해주세요'">
				</td></tr>
				
<!-- 				<input type="text" id="gatDetInfo" name="gatDetInfo" style="text-align: top; width:510px; height:537px"> -->
				<tr><td colspan="3"><br><textarea id="gatDetInfo" name="gatDetInfo" 
				 style="padding-left: 10px; padding-top: 10px;" placeholder="내용을 입력해주세요" onfocus="this.placeholder=''" 
				onblur="this.placeholder='내용을 입력해주세요'" ></textarea>
				<script>
				 ClassicEditor
		            .create( document.querySelector( '#gatDetInfo' ), {
		                language: {ui: 'ko', content: 'ko'} //언어설정
		            })
		            .catch( error => {
		                console.error( error );
		            } );
				</script>
				
				</td></tr>
				<tr><td colspan="3" align="left" class="filebox"><br>

			<input class="upload-name" value="첨부파일">
			<label for="file">사진 찾기</label>
			<input type="file" id="file" name="uploadFile">
			
		</td></tr>
				<tr><td colspan="3" align="right">
				<input type="submit" value="등록" class="subbox"></td></tr>
				</table>
			</form>
			<br>
			<hr width="890px" color="#b3cbff">
		</div>
		</section>
		<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    </div>
	</body>
</html>