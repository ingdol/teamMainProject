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
      <script src="/js/bch/scheNotice.js"></script>
  </head>
  <body>
      <div id ="mainWrap">
          <!-- TOP  -->
          <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />

          <section>
              <div class ="wrap">

                      <table border = "0" align="center" >
                          <c:if test="${gath.gatBanPhoto!=''}">
                              <tr><td colspan="4"><img src="<c:url value='/images/ldh/${gath.gatBanPhoto}'/>" ></td></tr>
                          </c:if>
                          <c:if test="${gath.gatBanPhoto==''}">
                              <tr><td colspan="4"><img src="<c:url value='/images/ldh/exdefault.png'/>" ></td></tr>
                          </c:if>
                          <tr><td colspan="4" class="boardtitle" align="left">
                              <span style="color:blue">[일정 공지]</span> ${gatherSchedule.gatScheTitle}<br></td>
                          </tr>
                      </table>
                  <br>
                  <table border = "0" align="center" class="detail1">
                      <tr><td align="left" colspan="2"><h3>${gatherSchedule.memNick}</h3><br>
                          작성일자 : <fmt:formatDate value="${gatherSchedule.gatScheWriteDate}" pattern="YY/MM/dd"/><br>조회수 : ${gatherSchedule.gatScheView}회</td><td></td>
                      </tr>
                  </table>
                  <br>
                  <table border = "0" align="center" >
                      <tr>
                          <td colspan="4"  class="boardDetail" align="left">
                            <p>${gatherSchedule.gatScheInfo}</p>
                              <br>
                              <p>장소 : ${gatherSchedule.gatScheLocation}</p>
                              <c:set var="spaceT" value="${gatherSchedule.gatScheTime}"></c:set>
                              <c:set var="keywordArr" value="${fn:split(spaceT,' ')[1]}"></c:set>
                              <p>날짜 : ${gatherSchedule.gatScheDate} ${keywordArr} ${gatherSchedule.gatScheTime}</p>
                              <p>최대 인원 : ${gatherSchedule.gatScheMax}</p>
<%--                              <p style="margin-top: 10px; margin-bottom: 10px; font-weight: bold;">지도</p>--%>
                              <input type="hidden" name="address" id="address" value="${gatherSchedule.gatScheLocation}">
                          </td>
                      </tr>
                  </table>
                  <div id="map" style="width: 1000px; height: 50%; margin-top: 10px;"></div>
                  <input type="button" value="일정 참가" id="joinGatherBtn">
                  <input type="hidden" id="ajaxMemNick" value="코딩이">
                  <fmt:parseNumber value="${gatherSchedule.gatScheNo}" type="number" var="gatScheNo" />
                  <fmt:parseNumber value="${gatherSchedule.gatNo}" type="number" var="gatNo" />
                  <input type="hidden" id="ajaxGatScheNo" value="${gatScheNo}">
                  <input type="hidden" id="ajaxGatNo" value="${gatNo}">
              </div>
          </section>
          <section>
              <div class ="wrap">
                  <ol class="comList">
                      <c:forEach items="${comList }" var="comList">
                          <table class="comment" align="center" border="0" width="1000px">
                              <tr><td align="left"><b>${comList.memNick}</b>님</td><td align="right"></td></tr>
                              <tr><td colspan="2" align="left">${comList.gatDetComInfo}</td></tr>
                          </table>
                      </c:forEach>
                  </ol>
              </div>
          </section>

          <!-- BOTTOM  -->
          <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
      </div>
  </body>
</html>
