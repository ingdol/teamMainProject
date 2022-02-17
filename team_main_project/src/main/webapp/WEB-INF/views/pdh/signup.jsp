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
    <title>SignUp</title>
</head>

<body>
    <!-- HEADER -->
    <!-- <header id="header"></header> -->
    
    <!-- MAIN -->
    <div id="l-form">
        <form class="form" method="post" onsubmit="return onSubmit();">
            <h1>Sign Up</h1>
            <ul>
                <li class="l-li" id="l-name">
                    <input type="text" class="l-input" id="name" placeholder=" ">
                    <label for="" class="l-label" id="name-label">이름</label>
                </li>

                <li class="l-li" id="l-email">
                    <input type="email" class="l-input" id="email" placeholder=" " onchange="idChecking();">
                    <label for="" class="l-label" id="email-label">Email</label>
                </li>
                <li class="l-li" id="l-pw">
                    <!-- Warning : Input elements should have autocomplete attributes -->
                    <input type="password" class="l-input" id="pw" autocomplete="on" placeholder=" ">
                    <label for="" class="l-label" id="pw-label">Password</label>
                </li>
                <li class="l-li" id="l-nick">
                    <input type="text" class="l-input" id="nick" placeholder=" ">
                    <label for="" class="l-label" id="nick-label">닉네임</label>
                </li>
                <li class="l-li" id="l-number">
                    <input type="tel" class="l-input" id="number" placeholder=" ">
                    <label for="" class="l-label" id="number-label">휴대전화</label>
                </li>
                <li class="l-li-title">
                    <div class="l-title">관심분야</div>
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
                    <input type="text" class="l-input-address1" id="email1" placeholder=" ">
                    <label for="" class="l-label-address" id="email-label">상세주소</label>
                    <input type="text" class="l-input-address" id="email1" placeholder=" ">
                    <label for="" class="l-label" id="email-label">우편번호</label>
                </li>
                <li class="l-li-Btn">
                    <input type="submit" id="l-submit" value="Sign Up" onclick="onSubmit();">
                </li>
            </ul>
        </form>
    </div>

    <!-- FOOTER -->
    <!-- <footer id="footer"></footer> -->

    <!-- JavaScript -->

    <script src="../js/header.js"></script>
    <script src="../js/footer.js"></script>
    <script src="<c:url value="/js/pdh/signup.js" />"></script>
    <script src="../js/kakao_login.js"></script>
</body>

</html>