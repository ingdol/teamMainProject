<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${cr.classRevTitle}</title>
		<link rel="stylesheet" href="<c:url value="/css/ldh/CRdetail.css" />">
<link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/ldh/Sdate.js'/>"></script>
<script src="<c:url value='/js/ldh/Sajax.js'/>"></script>
<script>
	function commentCheck() {
    var form = document.CommentForm1;
    if(form.gatDetComInfo.value.length==0) {
        alert("댓글 내용을 입력하세요");
        return form.gatDetComInfo.focus();
    }
    form.submit();
}
	function SUpdate(){
		
		location.href="/ldh/SomoimboardUpdate/${gatNo}/${gatDetNo}";
	}
	function Star(){
		
		location.href="/SomoimboardLike/${gatNo}/${gatDetNo}/${sessionScope.snick}";
	}
	function SDelete(){
		
		if(confirm("게시글을 삭제하시겠습니까?") == true){
		location.href="/SomoimboardDelete/${gatNo}/${gatDetNo}";
		}
		else{
			return;
		}
		}
</script>
	</head>
	<body>
	
	<div id="mainWrap">
        <!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
			
			<section>
		<div id ="wrap">
		
			

			<table border = "0" align="left" >
			
			<tr><td colspan="4"><span style="text-align:left;"><h3><a href="#">클래스</a> > <a href="#">${crd.classTitle}</a> > <a href="#">리뷰게시판</a></h3><br></span></td></tr>
			</table>
			<hr width="890px" color="#ff8080">
			
			<table border = "0" align="center" >
			<tr><td colspan="4" class="reviewtitle" align="left">
			${cr.classRevTitle}<br></td></tr>
			</table>
			<hr width="890px" color="#ff8080">
			<br>
			<table border = "0" align="center" class="detail1">
			<tr><td align="left" colspan="4"><h3>${cr.memNick}</h3><br>
			작성일자 : <fmt:formatDate value="${cr.classRevDate}" pattern="yyyy-MM-dd HH:mm"/></td><td></td>
</tr>
			</table>
			<br>
			<table border = "0" align="center" >
			<tr><td colspan="4"  class="boardDetail" align="left">
			
			<c:if test="${cr.classRevPhoto != ''}">
			<img src="<c:url value='/images/${cr.classRevPhoto}'/>" ><br>
			</c:if>
			${cr.classRevInfo }
			</td></tr>
			

			<tr><td align="center" colspan="4">&nbsp;</td></tr>

<%-- 			<c:if test="${not empty sessionScope.sid }"> --%>
<%-- 				<c:if test="${sessionScope.snick == cr.memNick}"> --%>
<!-- 					<tr><td align="right" colspan="4"><button class="Supdate" onclick="SUpdate()">수정</button>&nbsp;<button class="Sdelete" onclick="SDelete()">삭제</button></td></tr> -->
<%-- 				</c:if> --%>
<%-- 			</c:if> --%>
			
<%-- 			<c:if test="${not empty sessionScope.sid }"> --%>
<!-- 			<tr><td align="center" colspan="4"><br> -->
<%-- 			<input type="hidden" id="memNick" value="${sessionScope.snick}"> --%>
<%-- 			<input type="hidden" id="gatNo" value="${cr.gatNo}"> --%>
<%-- 			<input type="hidden" id="gatDetNo" value="${cr.gatDetNo}"> --%>
<%-- 			<button id="star" class="star"><img src="<c:url value='/image/ldh/star3.png'/>" width="40px" height="40px"></button>${cr.gatDetLike} 추천! --%>
<%-- 			<img src="<c:url value='/image/ldh/siren.png'/>" width="40px" height="40px"> 신고</td></tr> --%>
<%-- 			</c:if> --%>
			
			 </table>
			 </div>
			</section>
			 <section>
			 <div class ="wrap">
			 
			

			
			</div>
			<br>
		
		 </section>
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    
		   </div>
	</body>
</html>