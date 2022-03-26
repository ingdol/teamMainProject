<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>클래스 일정 신청</title>
        <script src="/js/jquery-3.6.0.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="/css/bch/classSchedule.css">
        <script src="/js/bch/classSchedule.js"></script>
        <script>
            document.addEventListener('keydown', function(event) {
                // if (event.keyCode === 13) {
                //     event.preventDefault();
                // };
            }, true);
            $(document).ready(function(){
                $('#classScheDate').val(sessionStorage.getItem("classScheDate"));
                $('#classScheTime').val(sessionStorage.getItem("classScheTime"));
                setTimeout(sessionStorage.clear(), 1000);

                $('#toggleBtn').on('click', function(){
                    if($('#findAddress').css("display") == "none") {
                        $('#findAddress').show();
                        $('#findScheduleSpace').hide();
                        $('#scheduleSpace').val("");
                        $('#toggleBtn').val("장소를 대여하겠습니다.")
                        $('#classScheSpace').val("N")
                        $('#spaceNo').val(null);
                        $('#btnSave1').show();
                        $('#btnSave2').hide();
                    }
                    else if($('#findAddress').css("display") != "none") {
                        $('#findAddress').hide();
                        $('#scheduleAddress').val("");
                        $('#findScheduleSpace').show();
                        $('#toggleBtn').val("장소 대여하지 않겠습니다.")
                        $('#classScheSpace').val("Y")
                        $('#btnSave2').show();
                        $('#btnSave1').hide();
                    }
                });
            });
            function Reservation() {

            }
            function setDate(){
                $('#spaceReserDate').val($('#classScheDate').val());
                var classScheDate = $('#classScheDate').val();
                sessionStorage.setItem("classScheDate", classScheDate);
            }
            function setTime(){
                $('#spaceReserStartTime').val($('#classScheTime').val());
                var classScheTime = $('#classScheTime').val();
                sessionStorage.setItem("classScheTime", classScheTime);
            }
            function checkPerson() {
                if ($('#classScheMax').val() <= 0 && $('#classScheMax').val() != "") {
                    $("#classScheMax").val("");
                    alert("1명 이하는 입력 하실 수 없습니다.")
                }
            }
        </script>
    </head>
    <body>
        <div id ="mainWrap">
            <!-- TOP  -->
            <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />

                <div class="wrap" id="wrap">

                    <%request.setCharacterEncoding("UTF-8");%>
                    <%
//                          String memNick = request.getParameter("memNick");
//                          int gatNo = Integer.parseInt(request.getParameter("gatNo"));
//                          int classNo = Integer.parseInt(request.getParameter("classNo"));
                        String spaceNo = request.getParameter("spaceNo");
                        int c_spaceNo = 0;
                        String SpaceNo = "";
                        if(spaceNo == null) {
                            c_spaceNo = 0;
                        }
                        else {
                            c_spaceNo = Integer.parseInt(request.getParameter("spaceNo"));
                        }
                        // spaceArea 태그
                        String spaceArea = request.getParameter("spaceArea");
                        if(spaceArea == null) {
                            spaceArea = "";
                        }
                        else {
                            spaceArea = request.getParameter("spaceArea");
                        }
                        // 주소에서 받아옴
                        String classNo = request.getParameter("classNo");
                        String date = request.getParameter("date");
                        String time = request.getParameter("time");
                        String time2 = request.getParameter("time2");
                        String spacePrice = request.getParameter("spacePrice");
                        String spaceTitle = request.getParameter("spaceTitle");
                    %>

                    <div name="form" id="form">
                        <input type="hidden" value="${mem.memNick}" id="memNick" name="memNick">
                        <input type="hidden" value="<%=classNo%>" id="classNo" name="classNo">
                        <input type="hidden" value="<%=c_spaceNo%>" id="spaceNo" name="spaceNo">
                        <input type="hidden" value="<%=date%>" id="date" name="date">
                        <input type="hidden" value="<%=time%>" id="time" name="time">
                        <input type="hidden" value="<%=time2%>" id="time2" name="time2">
                        <input type="hidden" value="<%=spacePrice%>" id="spacePrice" name="spacePrice">
                        <input type="hidden" value="<%=spaceTitle%>" id="spaceTitle" name="spaceTitle">
                        <div>
                            <input type="text"  name="classScheTitle" id="classScheTitle" placeholder="제목을 입력해 주세요">
                        </div>

                        <div>
                            <input type="date" id="classScheDate" name="classScheDate" placeholder="날짜 선택" onchange="setDate()">
                            <input type="time" id="classScheTime" name="classScheTime" placeholder="시간 선택" onchange="setTime()">
                            <input type="hidden" id="spaceReserDate" name="spaceReserDate" placeholder="날짜 선택">
                            <input type="hidden" id="spaceReserStartTime" name="spaceReserStartTime" placeholder="시간 선택">
                            <input type="number" placeholder="최대 인원 입력" id="classScheMax" name="classScheMax" min="1" onkeyup="checkPerson()">
                            <input type="button" value="장소 대여하지 않겠습니다." id="toggleBtn" class="btn btn-primary">
                        </div>

                        <div id="findAddress" style="display: none;">
                            <span>
                                <input type="text" id="scheduleAddress" name="scheduleAddress" placeholder="주소를 검색해 주세요." readonly>
                                <input type="button" value="주소 검색" id="zipcodeButton" class="btn btn-primary">
                            </span>
                        </div>

                        <input type="hidden" value="Y" id="classScheSpace" name="classScheSpace"> <!-- Y,N값 중 하나 들어감 -->

                        <div id="findScheduleSpace">
                            <span>
                                <input type="text" id="scheduleSpace" name="scheduleSpace" value="<%=spaceArea%>" placeholder="장소를 검색해 주세요." readonly>
                                <a href="/ClassScheSpaceReservationAll?classNo=<%=classNo%>"><input type="button" value="장소 검색" id="findSpace" class="btn btn-primary" onclick="loadSpaceReser()"></a>
                            </span>
                        </div>

                        <div>
                            <textarea rows="20" name="classScheInfo" id="classScheInfo" placeholder="내용을 입력해 주세요" style="resize: none"></textarea>
                        </div>
<%--                            <button type="button" class="btn btn-primary" id="btnSave1" onclick="javascript: form.action='/WriteGatherScheduleWithoutSpaceReser/<%=gatNo%>'" style="display: none;">일정 등록(공간 없음)</button>--%>
<%--                            <button type="button" class="btn btn-primary" id="btnSave2" onclick="javascript: form.action='/WriteGatherSchedule/<%=gatNo%>'">일정 등록(공간 있음)</button>--%>
                        <button type="button" class="btn btn-primary" id="btnSave1" style="display: none;">일정 등록(공간 없음)</button>
                        <button type="button" class="btn btn-primary" id="btnSave2" >일정 등록(공간 있음)</button>
                    </div>
                </div>

            <!-- BOTTOM  -->
            <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
        </div>
    </body>
</html>
