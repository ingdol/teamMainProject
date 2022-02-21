<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>공간 대여 전체</title>
    </head>
    <link type="text/css" rel="stylesheet" href="css/bch/datepicker.min.css"> <!-- 라이브러리 -->
    <link type="text/css" rel="stylesheet" href="css/bch/spaceReservationAll.css">
    <link type="text/css" rel="stylesheet" href="css/bch/gallery.css">
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="js/bch/datepicker.min.js"></script> <!-- 달력 js -->
    <script src="js/bch/datepicker.ko.js"></script> <!-- 달력 한글 js -->
    <script src="js/bch/datepickerUse.js"></script> <!-- 달력 설정 js -->
    <script src="js/bch/spaceSearch.js"></script> <!-- 조건 검색 -->
    <body>
    <!-- TOP  -->
    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
        <div id="FormBox" class="FormBox">
            <form class="findPlace" >
                <span>
                    <input id="datepicker" type="text" readonly placeholder="날짜">
                </span>
                <span>
                <select name="location" id="location" class="location">
                    <option value="">지역을 선택해 주세요.</option>
                    <option value="서울">서울 특별시</option>
                    <option value="인천">인천 광역시</option>
                    <option value="대전">대전 광역시</option>
                    <option value="대구">대구 광역시</option>
                    <option value="광주">광주 광역시</option>
                    <option value="울산">울산 광역시</option>
                    <option value="부산">부산 광역시</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="충청남도">충청남도</option>
                    <option value="충청북도">충청북도</option>
                    <option value="전라북도">전라북도</option>
                    <option value="경상북도">경상북도</option>
                    <option value="전라남도">전라남도</option>
                    <option value="경상남도">경상남도</option>
                    <option value="제주">제주 특별자치도</option>
                </select>
            </span>
                <span>
                <select name="category" id="category" class="category">
                    <option value="">장소의 테마를 선택해 주세요.</option>
                    <option value="1">파티룸</option>
                    <option value="2">회의실</option>
                    <option value="3">펜션</option>
                    <option value="4">골프 연습장</option>
                    <option value="5">야외운동시설</option>
                    <option value="6">실내운동시설</option>
                    <option value="7">문화생활시설</option>
                </select>
                </span>
                <span><input type="number" placeholder="최대 인원" id="maxPerson" class="maxPerson"></span>
<%--                <input type="submit" value="검색" id="findPlaceBtn">--%>
                <button id="findPlaceBtn">검색</button>
            </form>
        </div>
    <hr>
        <div class="spaceListBox" id="spaceListBox">
            <div class="gallerylist" id="gallerylist">
                <span class="gallerylistBox" id="gallerylistBox">
                    <c:forEach items="${spaceList}" var="space">
                        <c:set var="spaceNoForCtgName" value="${space.spaceNo}" />
                        <a href="<c:url value='/detailViewSpace/${space.spaceNo}'/>"> <!-- 클릭 시 링크 설정 -->
                            <div class="card">
                                <!-- 카드 헤더 -->
                                <div class="card-header" >
                                    <div class = "card-header-is_closed" >
                                        <div class = "card-header-text" >
                                            <c:forEach items="${spaceCtgName}" var="spaceCtgName" begin="0" end="0">
                                            ${spaceCtgName.spaceCtgName}
                                            </c:forEach>
                                        </div >
                                        <div class = "card-header-number" ></div >
                                    </div >
                                </div>
                                <!--  카드 바디 -->
                                <div class="card-body">
                                    <!--  카드 바디 헤더 -->
                                    <div class="card-body-header">
                                        <h1>${space.spaceTitle}</h1>
                                        <p class="card-body-hashtag">${space.spaceArea}</p>
                                        <p class ="card-body-nickname">
                                            최대 ${space.spacePerMax}인
                                        </p>
                                    </div>
                                    <p class="card-body-description">
                                    ${space.spacePrice1}<span>/비수기</span><br>${space.spacePrice2}<span>/성수기</span>
                                    <%--${space.spaceInfo}--%>
                                    </p>
                                    <!--  카드 바디 본문 -->
                                    <!--  카드 바디 푸터 -->
                                    <div class="card-body-footer">
                                        <hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
                                        <i class="icon icon-view_count"></i>
                                        <i class="icon icon-comments_count"></i>
                                        <i class="reg_date"></i>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </span>
            </div>
        </div>
        <!-- BOTTOM  -->
        <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
    </body>
</html>




<%--<span class="gallerylistBox" id="gallerylistBox">'--%>
<%--    <a href="' + '/detailViewSpace/' + space[i].spaceNo + '">--%>
<%--        <div class="card">'--%>
<%--                <div class="card-header">'--%>
<%--                    <div class="card-header-is_closed">--%>
<%--                        <div class="card-header-text">spaceCtgName[j].spaceCtgName--%>
<%--                        </div>--%>
<%--                        <div class="card-header-number"></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            <div class="card-body">--%>
<%--                <div class="card-body-header">--%>
<%--                    <h1>space[i].spaceTitle</h1>--%>
<%--                    <p class="card-body-hashtag">space[i].spaceArea</p>--%>
<%--                    <p class="card-body-nickname">최대space[i].spacePerMax인</p>--%>
<%--                </div>--%>
<%--                <p class="card-body-description">space[i].spacePrice1<span>/비수기</span><br>--%>
<%--                space[i].spacePrice2 <span>/성수기</span>--%>
<%--                </p>--%>
<%--                <div class="card-body-footer">--%>
<%--                    <hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">--%>
<%--                    <i class="icon icon-view_count"></i>--%>
<%--                    <i class="icon icon-comments_count"></i>--%>
<%--                    <i class="reg_date"></i>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </a>--%>
<%--</span>--%>