<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>일정 공지</title>
      <link rel="stylesheet" href="<c:url value="/css/ldh/Sdetail.css" />">
      <link rel="stylesheet" href="<c:url value="/css/ldh/SWrite.css" />">
      <link rel="stylesheet" href="<c:url value="/css/bch/scheNotice.css" />">
      <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
      <script src="/js/jquery-3.6.0.min.js"></script>
      <script type="text/javascript"
              src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qrv2ksj8tt&submodules=geocoder">
      </script> <!-- 네이버 지도 api -->
      <script src="/js/bch/MapForDetailView.js"></script>
      <script src="/js/bch/ClassNotice.js"></script>
  </head>
  <body>
      <div id ="mainWrap">
          <!-- TOP  -->
          <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />

          <section>
              <div class ="wrap">
                      <table border = "0" align="center"id="headerTitle" >
                          <c:if test="${gath.gatBanPhoto!=''}">
                              <tr><td colspan="4"><img src="<c:url value='/images/${gath.gatBanPhoto}'/>" ></td></tr>
                          </c:if>
                          <c:if test="${gath.gatBanPhoto==''}">
                              <tr><td colspan="4"><img src="<c:url value='/images/exdefault.png'/>" ></td></tr>
                          </c:if>
                          <tr><td colspan="4" class="boardtitle" align="left">
                              <span style="color:blue">[일정 공지]</span> ${classSchedule.classScheTitle}<br></td>
                          </tr>
                      </table>
                  <br>
                  <table border = "0" align="center" class="detail1">
                      <tr><td align="left" colspan="2"><h3>${classSchedule.memNick}</h3><br>
                          작성일자 : <fmt:formatDate value="${classSchedule.classScheWriteDate}" pattern="YY/MM/dd"/><br>조회수 : ${classSchedule.classScheView}회</td><td></td>
                      </tr>
                  </table>
                  <br>
                  <table border = "0" align="center" >
                      <tr>
                          <td colspan="4"  class="boardDetail" align="left">
                              <div style="white-space:pre;">${classSchedule.classScheInfo}</div>
                              <br>
                              <p>장소 : ${classSchedule.classScheLocation}</p>
                              <c:set var="spaceT" value="${classSchedule.classScheTime}"></c:set>
                              <c:set var="keywordArr" value="${fn:split(spaceT,' ')[1]}"></c:set>
                              <p>날짜 : ${classSchedule.classScheDate} ${keywordArr} ${classSchedule.classScheTime}</p>
                              <p>최대 인원 : ${classSchedule.classScheMax}</p>
<%--                              <p style="margin-top: 10px; margin-bottom: 10px; font-weight: bold;">지도</p>--%>
                              <input type="hidden" name="address" id="address" value="${classSchedule.classScheLocation}">
                          </td>
                      </tr>
                  </table>
                  <div id="map" style="width: 890px; height: 50%; margin-top: 20px; margin-bottom: 20px;"></div>
              </div>
          </section>
          <section>
              <div class ="wrap">
                  <ol class="comList">
                      <table class="comment" align="center" border="0" width="1000px">
                          <tr><td align="left"><b style="font-size: large;">현재 신청 인원</b></td><td align="right"></td></tr>
                          <c:forEach items="${ClassJoinPerson}" var="ClassJoinPerson">
                              <tr><td align="left"><b>"${ClassJoinPerson.memNick}"</b> 님</td><td align="right"></td></tr>
                          </c:forEach>
                      </table>
                  </ol>
              </div>
              <c:if test="${empty sessionScope.snick}">
                  <input type="button" value="일정 참가" id="FakejoinGatherBtn">
              </c:if>
              <input type="hidden" id="ajaxMemNick" value="${sessionScope.snick}">
              <input type="hidden" id="ajaxClassScheNo" value="${classSchedule.classScheNo}">
              <input type="hidden" id="ajaxClassNo" value="${classSchedule.classNo}">
              <c:if test="${not empty sessionScope.snick}">
                  <input type="button" value="일정 참가" id="joinGatherBtn">
              </c:if>
              <c:if test="${sessionScope.snick eq classSchedule.memNick}">
                  <input type="button" value="삭 제" id="deleteGatherBtn">
              </c:if>
          </section>

          <!-- BOTTOM  -->
          <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
      </div>
  </body>
</html>
