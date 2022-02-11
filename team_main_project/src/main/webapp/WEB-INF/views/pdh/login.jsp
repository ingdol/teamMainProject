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
    <title>Login</title>
</head>

<body>
    <!-- HEADER -->
    <!-- <header id="header"></header> -->
    
    <!-- MAIN -->
    <div id="l-form">
        <form class="form" method="post" onsubmit="return onSubmit()">
            <h1>Sign In</h1>
            <ul>
                <li class="l-li" id="l-email">
                    <input type="email" class="l-input" id="email" placeholder=" ">
                    <label for="" class="l-label" id="email-label">Email</label>
                </li>

                <li class="l-li" id="l-pw">
                    <!-- Warning : Input elements should have autocomplete attributes -->
                    <input type="password" class="l-input" id="pw" autocomplete="on" placeholder=" ">
                    <label for="" class="l-label" id="pw-label">Password</label>
                </li>
                <li class="l-li-Btn">
                    <input type="button" id="l-submit" value="Sign In">
                </li>
                <li class="l-li-Btn">
                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d74df3c90e2abbac5e5a0e4a9dea5408&redirect_uri=http://125.140.227.37:5500/index">
                        <img src="../image/kakao/kakao_login_medium_wide.png" width="100%" height="50hv">
                    </a>
                </li>
            </ul>
        </form>
    </div>

    <!-- FOOTER -->
    <!-- <footer id="footer"></footer> -->

    <!-- JavaScript -->
    <script src="../js/header.js"></script>
    <script src="../js/footer.js"></script>
    <script src="<c:url value="/js/pdh/login.js" />"></script>
    <script src="../js/kakao_login.js"></script>
</body>

</html>