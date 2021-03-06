<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>공간 상세 조회 - ${space.spaceTitle}</title>
    </head>
    <link type="text/css" rel="stylesheet" href="/css/bch/detailViewSpace.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qrv2ksj8tt&submodules=geocoder"></script> <!-- 네이버 지도 api -->
    <script src="/js/bch/MapForDetailView.js"></script>
    <script src="/js/bch/CheckReservationTimeForGatherDetail.js"></script>
    <script src="/js/bch/slideShow.js"></script>
    <script>
        $(document).ready(function(){
            $('#move_section1').on('click', function(){
                document.getElementById('section1').scrollIntoView({behavior: "smooth", block: "center"})
            });
            $('#move_section2').on('click', function(){
                document.getElementById('section2').scrollIntoView({behavior: "smooth", block: "center"})
            });
            $('#move_section3').on('click', function(){
                document.getElementById('section3').scrollIntoView({behavior: "smooth", block: "center"})
            });
            $('#move_section4').on('click', function(){
                document.getElementById('section4').scrollIntoView({behavior: "smooth", block: "center"})
            });
            $('#move_section5').on('click', function(){
                document.getElementById('section5').scrollIntoView({behavior: "smooth", block: "center"})
            });
        });

        function sendForm() {
            document.getElementById('hiddenForm').submit();
        }

    </script>
    <body>
    <%request.setCharacterEncoding("UTF-8");%>
    <%
        String gatNo = request.getParameter("gatNo");
    %>
    <div id ="mainWrap">
        <!-- TOP  -->
        <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
        <div id="detailWrap" class="detailWrap">
            <div>
                <h1 id="spaceTitle">${space.spaceTitle}</h1>
                <h3 id="spaceInfo">${space.spaceInfo}</h3>
            </div>
            <div>
                <div id="slideShow" class="slideShow">
                    <div id="prevNextButtonBox">
                        <img src="<c:url value='/images/leftButton.png'/>" id="prevButton">
                        <img src="<c:url value='/images/rightButton.png'/>" id="nextButton">
                    </div>
                    <div id="slideShowBox">
                        <div id="slidePanel">
                            <c:set var="spacePhoto2" value="${space.spacePhoto2}"></c:set>
                            <c:set var="spacePhotoArr" value="${fn:split(spacePhoto2,' ')}"></c:set>
                            <c:forEach items="${spacePhotoArr}" var="spaceInfo">
                                <img src="<c:url value='/images/${spaceInfo}'/>" class="slideImage" />
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div>
                    <h2 id="spaceInfo2">${space.spaceInfo}</h2>
                </div>
            </div>

            <div class="reservation" id="reservation">
                <form type="hidden" id="hiddenForm">
                    <input type="hidden" id="no" value="${space.spaceNo}">
                    <input type="date" class="setDateTime" id="date" value="">
                    <input type="time" class="setDateTime" id="time" value="">
                    <input type="time" class="setDateTime" id="time2" value="">
                    <a id="ReservationATAG" href="/GatherSchedule?spaceNo=${space.spaceNo}&spaceTitle=${space.spaceTitle}&gatNo=<%=gatNo%>&memNick=${mem.memNick}&spaceArea=${space.spaceArea}&date=date&time=time&time2=time2"><input type="button" value="예약하기" id="ReservationBtn"></a>
                    <input type="hidden" id="spacePrice" value="${space.spacePrice1}">
                    <input type="hidden" id="gatNo" value="<%=gatNo%>">
                    <input type="hidden" id="memNick" value="${mem.memNick}">
                    <input type="hidden" id="spaceNo" value="${space.spaceNo}">
                    <input type="hidden" id="spaceArea" value="${space.spaceArea}">
                    <input type="hidden" id="spaceTitle2" value="${space.spaceTitle}">
                </form>
            </div>

            <div id="navigation" class="navigation">
                <ul class="navigation_list">
                    <li id="move_section1" class="moveSection">공간 소개</li>
                    <li id="move_section2" class="moveSection">안내</li>
                    <li id="move_section3" class="moveSection">유의 사항</li>
                    <li id="move_section4" class="moveSection">지도</li>
                    <li id="move_section5" class="moveSection">이용 후기</li>
                </ul>
<%--                <hr size="2px" width="100%" align="left" color="#5da5f8">--%>

            </div>
            <div class="container">
                <div id="section1" class="content">
                    <h3 class="h-intro">공간 소개</h3>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                    <p>${space.spaceInfo}</p>
                    <ul>
                        <!-- DB 추가해서 작업하면 됨. -->
                        <li>영업시간<span>0~24시</span></li>
                        <li>휴무일&nbsp;&nbsp;&nbsp;<span>연중 무휴</span></li>
                    </ul>
                </div>
                <div id="section2" class="content">
                    <h3 class="h-intro">안내</h3>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                    <c:set var="spaceT" value="${space.spaceInfo}"></c:set>
                    <c:set var="keywordArr" value="${fn:split(spaceT,'.')}"></c:set>
                    <c:forEach items="${keywordArr}" var="spaceInfo">
                        <ul>
                            <li><span>※</span> ${spaceInfo}</li>
                        </ul>
                    </c:forEach>
                </div>
                <div id="section3" class="content">
                    <h3 class="h-intro">유의 사항</h3>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                </div>
                <div id="section4" class="content">
                    <h3 class="h-intro">지도</h3>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                    <div id="SpaceMapInfo">
                        <div id="SpaceTitleInMap">${space.spaceTitle}</div>
                        <span id="addressValue">${space.spaceArea}</span>
                        <input type="hidden" name="address" id="address" value="${space.spaceArea}">
                    </div>
                    <div id="map" style="width: 100%; height: 50%;"></div>
                </div>
                <div id="section5" class="content">
                    <h3 class="h-intro">이용 후기</h3>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                    <c:forEach items="${spaceReviewTest}" var="spaceReview">
                        <div class="revMemNick" id="revMemNick">${spaceReview.memNick}</div>
                        <div class="revInfo" id="revInfo" style="white-space:pre;" >${spaceReview.spaceRevTitle}</div>
                        <c:set var="spaceRevPhoto" value="${spaceReview.spaceRevPhoto}"></c:set>
                        <c:set var="spaceRevPhotoArr" value="${fn:split(spaceRevPhoto,' ')}"></c:set>
                        <c:forEach items="${spaceRevPhotoArr}" var="spaceRevPictures">
                            <span id="ReviewImg"><img src="<c:url value='/images/${spaceRevPictures}'/>"/></span>
                        </c:forEach>
                        <p id="revDate"><fmt:formatDate value="${spaceReview.spaceRevDate}" pattern="yyyy-MM-dd HH:ss"/></p>
                        <hr color="#d9d8d8" style="margin-bottom: 10px; margin-top: 10px;">
                    </c:forEach>
                </div>
            </div>
        </div>
    <!-- BOTTOM  -->
    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
    </div>
    </body>
</html>
