<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>소모임 일정 신청</title>
        <script src="/js/jquery-3.6.0.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="/css/bch/gatherSchedule.css">
        <script src="/js/bch/gatherSchedule.js"></script>
        <script>
            $(document).ready(function(){

                $('#toggleBtn').on('click', function(){
                    if($('#findAddress').css("display") == "none") {
                        $('#findAddress').show();
                        $('#findScheduleSpace').hide();
                        $('#toggleBtn').val("장소 대여하지 않음")
                        $('#spaceReserYN').val("N")
                    }
                    else if($('#findAddress').css("display") != "none") {
                        $('#findAddress').hide();
                        $('#findScheduleSpace').show();
                        $('#toggleBtn').val("장소 대여")
                        $('#spaceReserYN').val("Y")
                    }
                });
            });
        </script>
    </head>
    <body>
        <div id ="mainWrap">
            <!-- TOP  -->
            <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />

                <div class="wrap" id="wrap">

                    <form name="form" id="form">
                        <div>
                            <input type="text"  name="title" id="title" placeholder="제목을 입력해 주세요">
                        </div>

                        <div>
                            <input type="date" id="selectDate" placeholder="날짜 선택">
                            <input type="time" id="selectTime" placeholder="날짜 선택">
                            <input type="number" placeholder="최대 인원 입력" id="personMax" min="1">
                            <input type="button" value="장소 대여" id="toggleBtn" class="btn btn-primary">
                        </div>

                        <div id="findAddress" style="display: none;">
                            <span><input type="text" id="scheduleAddress" readonly>
                                <input type="button" value="주소 검색" id="zipcodeButton" class="btn btn-primary">
                            </span>
                        </div>

                        <input type="hidden" value="Y" id="spaceReserYN">

                        <div id="findScheduleSpace">
                            <span><input type="text" id="scheduleSpace" readonly>
                                <input type="button" value="장소 검색" id="findSpace" class="btn btn-primary" >
                            </span>
                        </div>

                        <div>
                            <textarea rows="20" name="content" id="content" placeholder="내용을 입력해 주세요" style="resize: none"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" id="btnSave">일정 등록</button>
                    </form>
                </div>

            <!-- BOTTOM  -->
            <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
        </div>
    </body>
</html>
