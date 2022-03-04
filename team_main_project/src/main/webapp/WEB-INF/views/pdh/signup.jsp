<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/css/pdh/signup.css" />">
    <title>Daily&Linker</title>
</head>

<body>
    <!-- MAIN -->
    <div id="l-form">
        <form class="form" method="post">
            <h1>Sign Up</h1>
            <ul>
                <li class="l-li" id="l-email">
                    <input type="text" class="l-input-email" id="email" placeholder=" ">
                    <label for="" class="l-label" id="email-label">이메일</label>
                    <button class="l-auth-Btn" id="auth-btn">메일 인증</button>
                </li>
                <li class="l-li" id="l-auth">
                	<input type="number" class="l-input-email" id="auth" placeholder=" ">
                	<label for="" class="l-label" id="auth-label">인증번호</label>
                	<button class="l-auth-Btn" id="auth-check-btn">확인</button>
                </li>
                <li class="l-li" id="l-pw">
                    <!-- Warning : Input elements should have autocomplete attributes -->
                    <input type="password" class="l-input" id="pw" autocomplete="on" placeholder=" ">
                    <label for="" class="l-label" id="pw-label">비밀번호</label>
                </li>
                <li class="l-li" id="l-name">
                    <input type="text" class="l-input" id="name" placeholder=" ">
                    <label for="" class="l-label" id="name-label">이름</label>
                </li>
		        <li class="l-li-title-birth">
                    <div class="l-title" id="title-birth">생년월일</div>
                </li>
                <li class="l-li" id="l-birth">
                	<input type="number" class="l-input-year" id="year" placeholder=" " min="1">
                    <label for="" class="l-label-year" id="year-label">년</label>
                    <input type="number" class="l-input-day" id="day" placeholder=" " min="1" max="31">
                    <label for="" class="l-label-day" id="day-label">일</label>
                	<div class="dropdown">
                		<input type="text" class="textBox" placeholder="월" readonly>
                		<div class="option">
                			<div id="month-1"><ion-icon name="calendar-outline"></ion-icon>1월</div>
                			<div id="month-2"><ion-icon name="calendar-outline"></ion-icon>2월</div>
                			<div id="month-3"><ion-icon name="calendar-outline"></ion-icon>3월</div>
                			<div id="month-4"><ion-icon name="calendar-outline"></ion-icon>4월</div>
                			<div id="month-5"><ion-icon name="calendar-outline"></ion-icon>5월</div>
                			<div id="month-6"><ion-icon name="calendar-outline"></ion-icon>6월</div>
                			<div id="month-7"><ion-icon name="calendar-outline"></ion-icon>7월</div>
                			<div id="month-8"><ion-icon name="calendar-outline"></ion-icon>8월</div>
                			<div id="month-9"><ion-icon name="calendar-outline"></ion-icon>9월</div>
                			<div id="month-10"><ion-icon name="calendar-outline"></ion-icon>10월</div>
                			<div id="month-11"><ion-icon name="calendar-outline"></ion-icon>11월</div>
                			<div id="month-12"><ion-icon name="calendar-outline"></ion-icon>12월</div>
                		</div>
                	</div>
                </li>
                <li class="l-li" id="l-nick">
                    <input type="text" class="l-input" id="nick" placeholder=" ">
                    <label for="" class="l-label" id="nick-label">닉네임</label>
                </li>
                <li class="l-li" id="l-number">
                    <input type="tel" class="l-input" id="number" placeholder=" " maxlength="13">
                    <label for="" class="l-label" id="number-label">휴대전화</label>
                </li>
                <li class="l-li-title">
                    <div class="l-title" id="title-hobby">관심분야</div>
                </li>
                <li class="l-li-check" id="l-check">
                    <input type="checkbox" id="label-art" class="l-check" value="art"><label for="label-art">예술 및 연극</label>
                    <input type="checkbox" id="label-sport" class="l-check" value="sport"><label for="label-sport" >스포츠</label>
                    <input type="checkbox" id="label-cook" class="l-check" value="cook"><label for="label-cook">요리</label>
                    <input type="checkbox" id="label-beauty" class="l-check" value="beauty"><label for="label-beauty">뷰티</label>
                    <br>
                    <input type="checkbox" id="label-business" class="l-check" value="business"><label for="label-business">비즈니스</label>
                    <input type="checkbox" id="label-health" class="l-check" value="health"><label for="label-health">건강 및 피트니스</label>
                    <input type="checkbox" id="label-invest" class="l-check" value="invest"><label for="label-invest">투자</label>
                    <input type="checkbox" id="label-game" class="l-check" value="game"><label for="label-game">게임</label>
                    <br>
                    <input type="checkbox" id="label-cartoon" class="l-check" value="cartoon"><label for="label-cartoon">만화 및 애니메이션</label>
                    <input type="checkbox" id="label-music" class="l-check" value="music"><label for="label-music">음악</label>
                    <input type="checkbox" id="label-movie" class="l-check" value="movie"><label for="label-movie">영화</label>
                    <input type="checkbox" id="label-picture" class="l-check" value="picture"><label for="label-picture">사진</label>
                    <br>
                    <input type="checkbox" id="label-travel" class="l-check" value="travel"><label for="label-travel">여행</label>
                    <input type="checkbox" id="label-mobile" class="l-check" value="mobile"><label for="label-mobile">모바일</label>
                    <input type="checkbox" id="label-news" class="l-check" value="news"><label for="label-news">뉴스</label>
                    <input type="checkbox" id="label-politics" class="l-check" value="politics"><label for="label-politics">정치</label>
                </li>
                <li class="l-li" id="l-address">
                    <input type="text" class="l-input-address" id="postcode" placeholder=" ">
                    <label for="" class="l-label" id="postcode-label" >우편번호</label>
                    <!-- <input type="button" class="l-address-Btn" value="우편번호 찾기" > -->
                     <button class="l-address-Btn" id="address-btn">우편번호 찾기</button>
                </li>
                <li class="l-li" id="l-address">
                    <input type="text" class="l-input-disabled" id="address" placeholder=" ">
                    <label for="" class="l-label" id="address-label">주소</label>
                </li>
                <li class="l-li" id="l-detail-address">
                    <input type="text" class="l-input" id="detailAddress" placeholder=" ">
                	<label for="" class="l-label" id="detailAddress-label">상세주소</label>
                </li>
                <li class="l-li-Btn">
	                <button id="l-submit">
	                	<i class="far fa-paper-plane"></i> Sign Up
	                </button>
                </li>
            </ul>
        </form>
    </div>

    <!-- JavaScript -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://kit.fontawesome.com/a68ab22d16.js" crossorigin="anonymous"></script>
    <script type="module" src="<c:url value="/js/pdh/signup.js" />"></script>
    <script src="../js/kakao_login.js"></script>
</body>

</html>