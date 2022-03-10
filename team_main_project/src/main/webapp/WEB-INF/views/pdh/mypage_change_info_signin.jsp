<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/css/pdh/mypage_change_info_signin.css" />">
    <title>Daily&Linker</title>
</head>

<body>
    <!-- MAIN -->
    <div id="l-form">
        <form class="form" method="post" onsubmit="return onSubmit();">
            <h1>Sign In</h1>
            <ul>
                <li class="l-li" id="l-email">
                    <input type="text" class="l-input-disabled" id="email" placeholder=" " value="${sid}" readonly="readonly">
                    <label for="" class="l-label-disabled" id="email-label">Email</label>
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
            </ul>
        </form>
    </div>
    <!-- JavaScript -->

    <script src="https://kit.fontawesome.com/a68ab22d16.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/js/pdh/mypage_change_info_signin.js" />"></script>
</body>

</html>