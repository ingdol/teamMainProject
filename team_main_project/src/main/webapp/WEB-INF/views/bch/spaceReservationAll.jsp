<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>공간 대여 전체</title>
    </head>
    <link type="text/css" rel="stylesheet" href="css/bch/datepicker.min.css"> <!-- 라이브러리 -->
    <link type="text/css" rel="stylesheet" href="css/bch/spaceReservationAll.css"> <!-- 달력 설정 css -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bch/datepicker.min.js"></script> <!-- 라이브러리 -->
    <script src="js/bch/datepicker.ko.js"></script> <!-- 한글 -->
    <script src="js/bch/datepickerUse.js"></script> <!-- 달력 설정 js -->
    <body>
        <div>
            <span id="entrance">입실 하실 날</span><span>퇴실 하실 날</span>
            <div class="double">
                <input id="datepicker1" type="text"> -
                <input id="datepicker2" type="text">
            </div>
            <span>
                <select name="location">
                    <option value="">지역을 선택해 주세요.</option>
                    <option value="서울">서울 특별시</option>
                    <option value="인천">인천 광역시</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청남도">충청남도</option>
                    <option value="대전">대전 광역시</option>
                    <option value="충청북도">충청북도</option>
                    <option value="전라북도">전라북도</option>
                    <option value="경상북도">경상북도</option>
                    <option value="대구">대구 광역시</option>
                    <option value="울산">울산 광역시</option>
                    <option value="전라남도">전라남도</option>
                    <option value="광주">광주 광역시</option>
                    <option value="경상남도">경상남도</option>
                    <option value="부산">부산 광역시</option>
                    <option value="제주">제주 특별자치도</option>
                </select>
            </span>
            <span>시간</span>
            <span>카테고리</span>
            <span>최대 인원</span>
        </div>
    </body>
</html>
