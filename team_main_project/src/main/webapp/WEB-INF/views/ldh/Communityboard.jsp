<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소모임 게시판</title>
		<link rel="stylesheet" href="<c:url value="/css/ldh/Cdetail.css" />">
		<link rel="stylesheet" href="<c:url value="/css/ldh/Sdetail.css" />">
<link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/ldh/Sdate.js'/>"></script>
<script src="<c:url value='/js/ldh/Cajax.js'/>"></script>
<script>
	function commentCheck() {
    var form = document.CommentForm1;
    if(form.commuComInfo.value.length==0) {
        alert("댓글 내용을 입력하세요");
        return form.commuComInfo.focus();
    }
    form.submit();
}
	function CUpdate(){
		
		location.href="/ldh/CommunityUpdate/${commuNo}";
	}
	function Star2(){
		
		location.href="/CommunityLike/${commuNo}/${sessionScope.snick}";
	}
function Siren2(){
		
		location.href="/CommunityHate/${commuNo}/${sessionScope.snick}";
	}
	function CDelete(){
		
		if(confirm("게시글을 삭제하시겠습니까?") == true){
		location.href="/CommunityDelete/${commuNo}";
		}
		else{
			return;
		}
		}
	function DeleteCCom(commuComNo){

		if(confirm("댓글을 삭제하시겠습니까?") == true){
		location.href="/CommunityComDelete/${commuNo}/" + commuComNo;
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
		
		   	<c:if test="${com.commuCtgNo == '1'}">
			<table border = "0" align="center" >
			<tr><td colspan="4"><a href="<c:url value="/sun/commumain/1"/>"><img src="<c:url value='/images/Comm.png'/>" width="890px" height="180px"></a></td></tr>
			</table>
			
			<br>
			<hr width="890px" color="#66A3FF">
			<table border = "0" align="center" >
			<tr><td colspan="4" class="boardtitle" align="left"><span style="color:blue">[일상]</span> ${com.commuTitle}<br></td></tr>
			</table>
			<hr width="890px" color="#66A3FF">
			</c:if>
			
			<c:if test="${com.commuCtgNo == '2'}">
			<table border = "0" align="center" >
			<tr><td colspan="4"><a href="<c:url value="/sun/commumain/1"/>"><img src="/images/Comm.png" width="890px" height="180px" ></a></td></tr>
			</table>
			
			<br>
			<hr width="890px" color="#8080ff">
			<table border = "0" align="center" >
			<tr><td colspan="4" class="boardtitle" align="left"><span style="color:purple">[홍보]</span> ${com.commuTitle}<br></td></tr>
			</table>
			<hr width="890px" color="#8080ff">
			</c:if>
			<br>
			<table border = "0" align="center" class="detail1">
			<tr><td align="left" colspan="2"><h3>${com.memNick}</h3><br>
			작성일자 : <fmt:formatDate value="${com.commuDate}" pattern="yyyy-MM-dd HH:mm"/><br>조회수 : ${com.commuView}회</td><td></td>
			<td align="right"><img src="<c:url value='/image/ldh/star2.png'/>" width="22px" height="20px"> 
			${com.commuLike}<br>
			<img src="<c:url value='/image/ldh/comment.png'/>" width="20px" height="20px">  
			${com.commuComNum}</td></tr>
			</table>
			<br>
			<table border = "0" align="center" >
			<tr><td colspan="4"  class="boardDetail" align="left">
			
			<c:if test="${com.commuPhoto != ''}">
			<img src="<c:url value='/images/${com.commuPhoto}'/>" ><br>
			</c:if>
			${com.commuInfo }
			</td></tr>
			

			<tr><td align="center" colspan="4">&nbsp;</td></tr>

			<c:if test="${not empty sessionScope.sid }">
				<c:if test="${sessionScope.snick == com.memNick}">
					<tr><td align="right" colspan="4"><button class="Supdate" onclick="CUpdate()">수정</button>&nbsp;<button class="Sdelete" onclick="CDelete()">삭제</button></td></tr>
				</c:if>
			</c:if>
			
			<c:if test="${not empty sessionScope.sid }">
			<tr><td align="center" colspan="4"><br>
			<input type="hidden" id="memNick" value="${sessionScope.snick}">
			<input type="hidden" id="commuNo" value="${com.commuNo}">
			<button id="star2" class="star2"><img src="<c:url value='/image/ldh/star3.png'/>" width="40px" height="32px"></button>${com.commuLike} 추천!
			<button id="siren2" class="siren2"><img src="<c:url value='/image/ldh/star3.png'/>" width="40px" height="36px"></button>${com.commuHate} 신고</td></tr>
			</c:if>
			
			<tr><td colspan="4" align="left">댓글 ${com.commuComNum}</td></tr>
			 </table>
			 <ol class="comList">
				<c:forEach items="${comcomList }" var="comcomList"> 
				<c:if test="${comcomList.memNick != sessionScope.snick}">
				<table class="comment" align="center" border="0">
					<tr><td align="left"><b>${comcomList.memNick}</b>님</td><td align="right"><fmt:formatDate value="${comcomList.commuComDate}" pattern="yyyy-MM-dd HH:mm"/> <img src="<c:url value='/image/ldh/siren.png'/>" width="25px" height="25px"> 신고</td></tr>
					<tr><td colspan="2"><hr width="850px"></td></tr>
					<tr><td colspan="2" align="left"><br>${comcomList.commuComInfo}</td></tr>
				</table>
				</c:if>
				<c:if test="${comcomList.memNick == sessionScope.snick}">
				<table class="comment" align="center" border="0">
					<tr><td align="left"><b>${comcomList.memNick}</b>님</td><td align="right"><fmt:formatDate value="${comcomList.commuComDate}" pattern="yyyy-MM-dd HH:mm"/> 
					<button id="DeleteCCom" class="DeleteCCom" onClick="DeleteCCom(${comcomList.commuComNo})">삭제</button></td></tr>
					<tr><td colspan="2"><hr width="850px"></td></tr>
					<tr><td colspan="2" align="left"><br>${comcomList.commuComInfo}</td></tr>
				</table>
				</c:if>
				
				</c:forEach>
			</ol>
			<br>
			<c:if test="${com.commuCtgNo == '1'}">			 
			<hr width="890px" color="#66A3FF">
			</c:if>
			<c:if test="${com.commuCtgNo == '2'}">			 
			<hr width="890px" color="#8080ff">
			</c:if>
			
			
			<br>
			<c:if test="${not empty sessionScope.sid }">
			<form id="CommentForm1" name="CommentForm1" method="post"  action="/ComCommentcreate/${com.commuNo}">
				<table border='0' class="commentWrite">
				<tr><td align="left" colspan="2" >${sessionScope.snick}님</td></tr>
				<tr><td align="left" colspan="2" ><hr width="850px"><br></td></tr>
				<tr><td>
				<input type="hidden" id="memNick" name="memNick" value="${sessionScope.snick}">
				<textarea id="commuComInfo" name="commuComInfo" 
				rows="3" cols="108" style="padding-left: 10px; padding-top: 10px;" placeholder="댓글을 입력해주세요" onfocus="this.placeholder=''" 
				onblur="this.placeholder='댓글을 입력해주세요'" ></textarea>
				</td>
				<td><input type="submit" value="댓글"  class="comsubbox" onClick="commentCheck()"></td></tr>
				
				</table>
			</form>
			</c:if>
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
