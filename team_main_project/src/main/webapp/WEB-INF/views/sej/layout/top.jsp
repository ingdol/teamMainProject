<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Daily&Linker</title>
		<link href="<c:url value='/css/sej/main/index.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/main/common.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/main/menu.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/main/footer.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/chatBtn.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<script async src="<c:url value='/js/sej/main/index.js'/>"></script>
		<script src="<c:url value='/js/sej/allSearch.js'/>"></script>
		<header>
		<!-- 커밋테스트 -->
			<div id="headerBox">
			<c:if test="${not empty sessionScope.sid}" >
				<div id="logoBox"><a href="<c:url value='/'/>"><img src="<c:url value='/img/sej/logo.jpg'/>" id="logoImg"></a></div>
			</c:if>
			<c:if test="${empty sessionScope.sid}" >
				<div id="logoBox"><a href="<c:url value='/'/>"><img src="<c:url value='/img/sej/logo.jpg'/>" id="logoImg"></a></div>
			</c:if>
			</div>
		</header>
		<nav>
			<div id="mainMenuBox">
				<div id="searchBox">
				<form id="memSearchFrm">
					<div id="searchIcon"><button id="searchBtn" type="submit" <%-- onclick="location.href='<c:url value="/searchTest"/>'" --%> >
														 <img src="<c:url value='/img/sej/searchIcon.png'/>"  id="searchBtnImg"></button></div>
					<div id="searchInputBox"><input id="searchInput" type="text" placeholder="검색어를 입력해주세요" name="keyword"></div>
					<!-- <input id="searchBtn" type="submit" value="검색"> -->
				</form>
				</div>
				<div id="MenuBarBox">
					<ul id="menuItem">

						<li><a href="<c:url value='/sun/mapsearch'/>"><img src="<c:url value='/img/sej/allGather.png'/>" id="menuImg1"></a></li>
						<li><a href="<c:url value='/SpaceReservationAll'/>"><img src="<c:url value='/img/sej/lookSpace.png'/>" id="menuImg2"></a></li>
						<li><a href="<c:url value='/sun/commumain/1'/>"><img src="<c:url value='/img/sej/community.png'/>" id="menuImg3"></a></li>
						<c:if test="${empty sessionScope.sid}" >
							<%-- <li><a href="#"><img src="<c:url value='/images/sej/mypage.png'/>" id="menuImg5"></a></li> --%>
							<%-- <li><a href="<c:url value='/login'/>"><img src="<c:url value='/images/sej/login.png'/>" id="menuImg4"></a></li> --%>
							<li><a href="<c:url value='/login'/>"><img src="<c:url value='/img/sej/login.png'/>" id="menuImg4"></a></li>
						</c:if>

						<c:if test="${not empty sessionScope.sid}">
							<li><label class="menu" for="menu"><img src="<c:url value='/img/sej/mypage.png'/>" id="menuImg5"></label></li>
							<input id="menu" type="checkbox">
                	            <nav id="main_nav">
				    		         <ul>
				    		          	<li><a href="<c:url value='/mypage'/>">마이페이지</a></li>
				    		          	<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
				    		          </ul>
				    		     </nav>
						</c:if>
					
					
						<%-- <li><a href="#"><img src="<c:url value='/image/sej/gather3.png'/>" id="menuImg1"><br id="menuBr">전체모임</a></li>
						<li><a href="#"><img src="<c:url value='/image/sej/space3.png'/>" id="menuImg2"><br id="menuBr">공간구경</a></li>
						<li><a href="#"><img src="<c:url value='/image/sej/commu3.png'/>" id="menuImg3"><br id="menuBr">커뮤니티</a></li>
						<li><a href="#"><img src="<c:url value='/image/sej/login3.png'/>" id="menuImg4"><br id="menuBr">로그인</a></li>
					 --%>
					</ul>
				</div>				
			</div>  <!-- mainMenuBox 끝 -->
			
		</nav>
		<label class="chatB" for="chatB" id="chatButton" onClick="javascript:muenuButton();"><img src="<c:url value='/img/sej/chatBtn.png'/>" id="chatBtnImg"></label>
			<input id="chatB" type="checkbox">
                	            <nav id="chatB_nav" class="chatB_nav">
				    		         	<div id="chatListBox"></div>
				    		     </nav>
<%-- 		<div id="chatBtnBox" class="box box1">
		  <div class="menu">
		     <div class="menu-round-box">
		     	<div id="menu-round-box-div">
		     		<div id="chatListBox"></div>
		       </div>
		      </div>
		     </div>
		      <a class="menu-btn"  onClick="javascript:muenuButton();"><img src="<c:url value='/img/sej/chatBtn.png'/>" id="chatBtnImg"></a>
		  </div> --%>
				</body>
</html>