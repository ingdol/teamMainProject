<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${gat.gatDetTitle}</title>
		<link rel="stylesheet" href="<c:url value="/css/ldh/Sdetail.css" />">
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
		<div class ="wrap">
		
		   	<c:if test="${gat.gatDetCategory == 0}">
			<table border = "0" align="center" >
			<c:if test="${gath.gatBanPhoto!=''}">
			<tr><td colspan="4"><a href="<c:url value="/sun/detailgat/${gath.gatNo}"/>"><img src="<c:url value='/images/${gath.gatBanPhoto}'/>" ></a></td></tr>
			</c:if>
			<c:if test="${gath.gatBanPhoto==''}">
			<tr><td colspan="4"><a href="<c:url value="/sun/detailgat/${gath.gatNo}"/>"><img src="<c:url value='/images/exdefault.png'/>" ></a></td></tr>
			</c:if>
			<tr><td colspan="4" class="boardtitle" align="left">

			<span style="color:blue">[일상]</span> ${gat.gatDetTitle}<br></td></tr>
			</table>
			</c:if>
			
			<c:if test="${gat.gatDetCategory == 1}">
			<table border = "0" align="center" >
			<c:if test="${gath.gatBanPhoto!=''}">
			<tr><td colspan="4"><a href="<c:url value="/sun/detailgat/${gath.gatNo}"/>"><img src="<c:url value='/images/${gath.gatBanPhoto}'/>" ></a></td></tr>
			</c:if>
			<c:if test="${gath.gatBanPhoto==''}">
			<tr><td colspan="4"><a href="<c:url value="/sun/detailgat/${gath.gatNo}"/>"><img src="<c:url value='/images/exdefault.png'/>" ></a></td></tr>
			</c:if>
			<tr><td colspan="4" class="boardtitle2" align="left">

			<span style="color:red">[리뷰]</span> ${gat.gatDetTitle}<br></td></tr>
			</table>
			</c:if>
			<br>
			<table border = "0" align="center" class="detail1">
			<tr><td align="left" colspan="2"><h3>${gat.memNick}</h3><br>
			작성일자 : <fmt:formatDate value="${gat.gatDetDate}" pattern="yyyy-MM-dd HH:mm"/><br>조회수 : ${gat.gatDetView}회</td><td></td>
			<td align="right"><img src="<c:url value='/image/ldh/star2.png'/>" width="20px" height="20px"> 
			${gat.gatDetLike}<br>
			<img src="<c:url value='/image/ldh/comment.png'/>" width="20px" height="20px">  
			${gat.gatDetComNum}</td></tr>
			</table>
			<br>
			<table border = "0" align="center" >
			<tr><td colspan="4"  class="boardDetail" align="left">
			
			<c:if test="${gat.gatDetPhoto != ''}">
			<img src="<c:url value='/images/${gat.gatDetPhoto}'/>" ><br>
			</c:if>
			${gat.gatDetInfo }
			</td></tr>
			

			<tr><td align="center" colspan="4">&nbsp;</td></tr>

			<c:if test="${not empty sessionScope.sid }">
				<c:if test="${sessionScope.snick == gat.memNick}">
					<tr><td align="right" colspan="4"><button class="Supdate" onclick="SUpdate()">수정</button>&nbsp;<button class="Sdelete" onclick="SDelete()">삭제</button></td></tr>
				</c:if>
			</c:if>
			
			<c:if test="${not empty sessionScope.sid }">
			<tr><td align="center" colspan="4"><br>
			<input type="hidden" id="memNick" value="${sessionScope.snick}">
			<input type="hidden" id="gatNo" value="${gat.gatNo}">
			<input type="hidden" id="gatDetNo" value="${gat.gatDetNo}">
			<button id="star" class="star"><img src="<c:url value='/image/ldh/star3.png'/>" width="40px" height="40px"></button>${gat.gatDetLike} 추천!
			<img src="<c:url value='/image/ldh/siren.png'/>" width="40px" height="40px"> 신고</td></tr>
			</c:if>
			
			<tr><td colspan="4" align="left">댓글 ${gat.gatDetComNum}</td></tr>
			 </table>
			 </div>
			</section>
			 <section>
			 <div class ="wrap">
			 
			
			<ol class="comList">
				<c:forEach items="${comList }" var="comList"> 

				<table class="comment" align="center" border="0" width="1000px">
					<tr><td align="left"><b>${comList.memNick}</b>님</td><td align="right"><fmt:formatDate value="${comList.gatDetComDate}" pattern="yyyy-MM-dd HH:mm"/> <img src="<c:url value='/image/ldh/siren.png'/>" width="40px" height="40px"> 신고</td></tr>
					<tr><td colspan="2" align="left">${comList.gatDetComInfo}</td></tr>
				</table>
			
				</c:forEach>
			</ol>
			</div>
			<br>
			<c:if test="${not empty sessionScope.sid }">
			<form id="CommentForm1" name="CommentForm1" method="post"  action="/Commentcreate/${gat.gatNo }/${gat.gatDetNo}">
				<table border='0'>
				<tr><td>${sessionScope.snick}님</td><td>
				<input type="hidden" id="memNick" name="memNick" value="${sessionScope.snick}">
				<textarea id="gatDetComInfo" name="gatDetComInfo" 
				rows="3" cols="120" style="padding-left: 10px; padding-top: 10px;" placeholder="댓글을 입력해주세요" onfocus="this.placeholder=''" 
				onblur="this.placeholder='댓글을 입력해주세요'" ></textarea>
				</td>
				<td><input type="submit" value="댓글"  class="comsubbox" onClick="commentCheck()"></td></tr>
				
				</table>
			</form>
			</c:if>
		
		 </section>
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
		    
		   </div>
	</body>
</html>