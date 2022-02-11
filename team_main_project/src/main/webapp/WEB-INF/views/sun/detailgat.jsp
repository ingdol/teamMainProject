<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임상세화면</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
		<style type="text/css">		
		
		/* -------------- 모임소개 --------- */	
		/* 
			.moiminfobox {
			    background-color: gray;			
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    height: 300px;
			}
			.moiminfobox .ul1{
				margin: 0;
				padding: 0;
				display: flex;
				align-items: center;
    			justify-content: center;
    			height: 100%;
			}
			.moiminfobox .li1{
				list-style: none;
			    box-sizing: border-box;
			    flex-shrink: 0;
			    display: flex;
			    justify-content: center;
			    align-items: center; 
			    height:100%;
			    width:20%;
			}
			
			.moiminfobox .li1 img{
				width:90%;
				height: 90%;
				object-fit: cover; 
			} */
		
		
		/* -------------- 모임메뉴 --------- */	
			.moimmenubox ul{
				margin: 0;
				padding: 0;
				display: flex;
				align-items: center;
    			justify-content: space-around;
			}
			
			.moimmenubox li {
				list-style: none;
			    box-sizing: border-box;
			    flex-shrink: 0;
			    display: flex;
			    justify-content: center;
			    align-items: center; 
			    width:20%;
			}
			
			.moimmenubox .btn{
				width:100%;
			}
			
			/* 모임가입섹션 */
			.moimjoin ul{
				margin: 0;
				padding: 0;
				display: flex;
				align-items: center;
    			justify-content: space-around;
			}
			
			.moimjoin li{
				list-style: none;
				box-sizing: border-box;
				display: flex;
				justify-content: center;
				align-items: center; 
				width:20%;
			}
			
			.moimjoin li button{
				width:100%;
			}
	</style>
	</head>
	<body>
		<section id="wrap">
			<h1 id="sectioninfo">상세모임</h1>
			
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
			<section id="detailgatmiddle">
                <h1 id="sectioninfo">중간섹션</h1>
                <div id="detailbox">
                	<section>
                		<h3 id="sectioninfo">모임소개</h3>
                		<div class="moiminfobox">
	                		<table border="1">
	                			<tr><td rowspan="2"><div id="detailimgbox"><img src="../image/LOGO.png"></div></td><td>소모임이름</td></tr>
	                			<tr><td><a href="#"><img src="#" alt="등급">모임개설자닉네임</a><button>1:1문의</button></td></tr>
	                		</table>
	                		<!-- 위에꺼 ul로 하려고했을때  -->
	                		<!-- <ul class="ul1">
	                			<li class="li1"><img src="../image/LOGO.png"></li>
	                			<li class="li1">
	                				<ul class="ul2">
	                					<li class="li2">소모임이름</li>
	                					<li class="li2"><a href="#"><img src="#" alt="등급">모임개설자닉네임</a>&nbsp;&nbsp;&nbsp;<button>1:1문의</button></li>
	                				</ul>
	                				2번쨰
	                			</li>
	                		</ul> -->
	                		
                		</div>
                	</section>
                	<section>
                		<h3 id="sectioninfo">모임메뉴</h3>
                		<div class="moimmenubox">
                			<ul>
                				<li><button type="button" class="btn btn-outline-primary">정보</button></li>
                				<li><button type="button" class="btn btn-outline-primary">모임게시판</button></li>
                				<li><button type="button" class="btn btn-outline-primary">사진첩</button></li>
                				<li><button type="button" class="btn btn-outline-primary">채팅</button></li>
                			</ul>
                		</div>
                	</section>
                	<section>
                		<h3 id="sectioninfo">모임메뉴별상세화면</h3>
                		
                		<!-- 정보 클릭시 -->
                		<div class="moiminfodetail">
                			<h4>!모임정보</h4>
                		</div>
                		
                		<!-- 모임게시판 클릭시 -->
                		<div class="moimcommu">모임게시판</div>
                		
                		<!-- 모임사진첩 클릭시 -->
                		<div class="moimphoto">
                			<h4>!모임사진첩</h4>
                		</div>
                		
                		<!-- 채팅 클릭시 -->
                		<div class="moimchatting">모임채팅</div>
                	</section>
                	<section>
                		<h3 id="sectioninfo">해당모임찜,가입버튼</h3>
                		<div class="moimjoin">
                			<ul>
                				<li><button type="button" class="btn btn-secondary btn-lg">찜하기</button></li>
                				<li><button type="button" class="btn btn-primary btn-lg">가입하기</button></li>
                			</ul>
                		</div>
                	</section>
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