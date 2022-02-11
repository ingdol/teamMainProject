<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전체커뮤니티 메인화면</title>
		<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	</head>
		<body>
		<section id="wrap">
            <h1 id="sectioninfo">전체커뮤니티 메인화면</h1>
            <!-- -----------------header,nav메뉴 부분---------------- -->
            <div class="container">
                <header class="headerbox">
                    <div id="logo" class="logo">
                        <img id="Rectangle" src="<c:url value='/images/Rectangle.png'/>">							
                    </div>
                </header>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <form class="form-inline my-2 my-lg-0">
                      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                      </ul>
                    </div>
                </nav>
            </div>
            
            <!-- -----------------middle부분---------------- -->
			<section id="commumiddle">
                <h1 id="sectioninfo">중간섹션/커뮤니티전체</h1>
                <div class="board-wrap">
                	
                </div>
			</section>

            <!-- -----------footer부분--------- -->
			<section id="footer">	
                <h1 id="sectioninfo">footer</h1>
                <div></div>
			</section>
		</section>
	</body>
</html>