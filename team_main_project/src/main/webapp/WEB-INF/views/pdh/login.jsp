<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/css/pdh/login.css" />">
    <title>Daily&Linker</title>
</head>

<body>
    <!-- MAIN -->
    <div id="l-form">
        <form action="/" class="form" method="post" onsubmit="return onSubmit();">
            <h1>Sign In</h1>
            <ul>
                <li class="l-li" id="l-email">
                    <input type="text" class="l-input" id="email" placeholder=" ">
                    <label for="" class="l-label" id="email-label">Email</label>
                </li>
                <li class="l-li" id="l-pw">
                    <!-- Warning : Input elements should have autocomplete attributes -->
                    <input type="password" class="l-input" id="pw" autocomplete="on" placeholder=" ">
                    <label for="" class="l-label" id="pw-label">Password</label>
                </li>
                <li class="l-li-Chk">
                    <input type="checkbox" id="id-save">
                    <label for="id-save">아이디 저장</label>
                </li>
                <li class="l-li-Btn">          
                	<button id="l-submit"><i class="fa fa-key"></i>&nbsp;Sign In</button>
                </li>
                <li class="l-li-Btn">
                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d74df3c90e2abbac5e5a0e4a9dea5408&redirect_uri=http://125.140.227.37:5500/index">
                        <img src="<c:url value="/image/kakao/kakao_login_medium_wide.png" />" width="100%" height="50hv">
                    </a>
                </li>
                <li class="l-li-Btn">
                	<button id="l-signup"><i class="far fa-paper-plane"></i>&nbsp;회원가입</button>
                </li>
            </ul>
        </form>
    </div>
    <!-- JavaScript -->

    <script src="https://kit.fontawesome.com/a68ab22d16.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/js/pdh/login.js" />"></script>
    <script src="../js/kakao_login.js"></script>
</body>

</html>