<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>map으로 모임찾기(필터)</title>
		<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/sun/mapsearch.css'/>" rel="stylesheet" type="text/css">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
		<script src="<c:url value='/js/sun/mapsearch.js'/>"></script>		
	</head>
		<body>
		<section id="wrap">
            <h1 id="sectioninfo">모임찾기</h1>
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
			<section id="mapmiddle">
				<h1 id="sectioninfo">중간섹션</h1>
				<div id="filter" class="filter">
					<div class="card bg-dark text-white" id="mapsearch">
						<img src="../image/sun/Rectangle_.png" class="card-img" alt="...">
						<div class="card-img-overlay">
							<h5 class="card-title">지도로 찾기</h5>
						</div>
					</div>					
				<div id="hobby">
					<svg class="n_109">
						<rect id="n_109" rx="50" ry="50" x="0" y="0" width="402"
							height="283">
						</rect>
					</svg>
					<div id="Text">
						<span>관심사 찾기</span>
					</div>
				</div>
				<div id="memmax">
					<svg class="n_115" viewBox="0 0 402 283">
						<path id="n_115"
							d="M 66.55628967285156 0 L 335.4437255859375 0 C 372.2017211914062 0 402 22.38576126098633 402 50 L 402 233 C 402 260.6142272949219 372.2017211914062 283 335.4437255859375 283 L 66.55628967285156 283 C 29.79826545715332 283 0 260.6142272949219 0 233 L 0 50 C 0 22.38576126098633 29.79826545715332 0 66.55628967285156 0 Z">
						</path>
					</svg>
					<div id="Text_bb">
						<span>인기 모임</span>
					</div>
				</div>
			</div>

			<!-- 필터선택후 나오는화면  -->
			<div id="locationsearch">
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
						Dropdown</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<button class="dropdown-item" type="button">Action</button>
						<button class="dropdown-item" type="button">Another
							action</button>
						<button class="dropdown-item" type="button">Something
							else here</button>
					</div>
				</div>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
						Dropdown</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<button class="dropdown-item" type="button">Action</button>
						<button class="dropdown-item" type="button">Another
							action</button>
						<button class="dropdown-item" type="button">Something
							else here</button>
					</div>
				</div>
				<div id="mapphoto">
					<a href="#"><img id="Rectangle_be"
						src="<c:url value='/images/Rectangle_be.png'/>"></a>
				</div>
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