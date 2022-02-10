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
		<link href="<c:url value='/css/sej/bestMenuBox.css?after'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/product.css?after'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sej/footer.css?after'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/sej/subMenu.js'/>"></script>
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
				<ul id="menuItem">
					<li></li>
					<li><a href="#"><img src="<c:url value='/image/sej/allGather.png'/>" id="allGather"></a></li>
					<li><a href="#"><img src="<c:url value='/image/sej/lookSpace.png'/>" id="lookSpace"></a></li>
					<li><a href="#"><img src="<c:url value='/image/sej/community.png'/>" id="community"></a></li>
					<li><a href="#"><img src="<c:url value='/image/sej/login.png'/>" id="login"></a></li>
				</ul>				
			</div>  <!-- mainMenuBox 끝 -->
		</nav>
	</body>
</html>