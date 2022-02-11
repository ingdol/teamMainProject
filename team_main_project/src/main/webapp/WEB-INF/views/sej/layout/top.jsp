<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Daily&Linker</title>
		<link href="<c:url value='/css/sej/common.css?after'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/index.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/menu.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/footer.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/index.js'/>"></script>
	</head>
	<body>
		<header>
			<div id="headerBox">
				<div id="logoBox"><a href="<c:url value='/'/>"><img src="<c:url value='/image/sej/logo.jpg'/>" id="logoImg"></a></div>
			</div>
		</header>
		<nav>
			<div id="mainMenuBox">
				<div id="searchBox">
					<div id="searchIcon"><img src="<c:url value='/image/sej/searchIcon.png'/>" id="searchIconImag"></div>
					<div id="searchInputBox"><input id="searchInput" type="text" placeholder="검색어를 입력해주세요" name="keyword"></div>
					<!-- <input id="searchBtn" type="submit" value="검색"> -->
				</div>
				<div id="MenuBarBox">
					<ul id="menuItem">
						<li><a href="#"><img src="<c:url value='/image/sej/allGather.png'/>" id="menuImg"></a></li>
						<li><a href="#"><img src="<c:url value='/image/sej/lookSpace.png'/>" id="menuImg"></a></li>
						<li><a href="#"><img src="<c:url value='/image/sej/community.png'/>" id="menuImg"></a></li>
						<li><a href="#"><img src="<c:url value='/image/sej/login.png'/>" id="menuImg"></a></li>
					</ul>
				</div>				
			</div>  <!-- mainMenuBox 끝 -->
		</nav>
	</body>
</html>