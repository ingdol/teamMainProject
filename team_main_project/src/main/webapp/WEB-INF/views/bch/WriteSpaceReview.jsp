<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <title>공간 리뷰 작성</title>
        <script src="/js/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="/css/bch/WriteSpaceReview.css">
        <script src="/js/bch/WriteSpaceReview.js"></script>
    </head>
    <body>
        <div id ="mainWrap">
            <!-- TOP  -->
            <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
            <!-- TOP  -->
            <div id="Wrap">
                <p>${sessionScope.snick}님이 예약하신 '${SpaceInfo.spaceTitle}'의 후기를 작성해 주세요!</p>
                <form enctype="multipart/form-data" method="post" action="/SaveReview">
                    <input type="hidden" value="${sessionScope.snick}" id="memNick" name="memNick">
                    <textarea id="ReviewArea" name="ReviewArea" rows="15"></textarea>
                    <div class="filebox">
                        <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                        <label for="files">파일찾기</label>
                        <input type="file" id="files" name="files" multiple accept="image/*">
                        <input type="submit" id="WriteReview" class="btn-primary" value="리뷰 작성">
                        <input type="hidden" id="spaceNo" name="spaceNo" value="${SpaceInfo.spaceNo}">
                        <input type="hidden" id="spaceReserNo" name="spaceReserNo" value="${SpaceInfo.spaceReserNo}">
                    </div>
                </form>
            </div>
            <!-- BOTTOM  -->
            <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
            <!-- BOTTOM  -->
        </div>
    </body>
</html>