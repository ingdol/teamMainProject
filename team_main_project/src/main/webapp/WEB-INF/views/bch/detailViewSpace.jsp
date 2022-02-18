<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>공간 상세 조회 - ${space.spaceTitle}</title>
    </head>
    <link type="text/css" rel="stylesheet" href="/css/bch/detailViewSpace.css">
    <script src="/js/jquery-3.6.0.min.js"></script>
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
    </script>
    <body>
    <!-- TOP  -->
    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
        <div id="detailWrap" class="detailWrap">
            <div>
                <h1>${space.spaceTitle}</h1>
                <h3>${space.spaceInfo}</h3>
            </div>
            <div>
                <div id="spacePicture" class="spacePicture">
                    <img src="/image/bch/IMG_4587.JPG">
                </div>
                <div>
                    <h2>${space.spaceInfo}</h2>
                </div>
            </div>
            <div id="navigation" class="navigation">
                <ul class="navigation_list">
                    <li id="move_section1">공간 소개</li>
                    <li id="move_section2">안내</li>
                    <li id="move_section3">유의 사항</li>
                    <li id="move_section4">지도</li>
                    <li id="move_section5">이용 후기</li>
                </ul>
                <hr size="2px" width="100%" align="left" color="#5da5f8">
            </div>
            <div class="container">
                <div id="section1" class="content">
                    <h4 class="h-intro">공간 소개</h4>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                    <p>${space.spaceInfo}</p>
                    <ul>
                        <li>영업시간<span>0~24시</span></li>
                        <li>휴무일<span>연중 무휴</span></li>
                    </ul>
                </div>
                <div id="section2" class="content">
                    <h4 class="h-intro">안내</h4>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                </div>
                <div id="section3" class="content">
                    <h4 class="h-intro">유의 사항</h4>
                    <hr size="5px" width="100%" align="left" color="#5da5f8"style="margin-bottom: 10px">
                </div>
                <div id="section4" class="content">
                    <h4 class="h-intro">지도</h4>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                </div>
                <div id="section5" class="content">
                    <h4 class="h-intro">이용 후기</h4>
                    <hr size="5px" width="100%" align="left" color="#5da5f8" style="margin-bottom: 10px">
                </div>
            </div>
        </div>
<%--        <div class="reservation" id="reservation">--%>
<%--        </div>--%>
    <!-- BOTTOM  -->
    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
    </body>
</html>
