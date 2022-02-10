<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
   </head>
   <body>
      <footer>
         <div id="footerBox">
            <div id="footerTextBox">
               <label id="tel">02-123-4567<br></label>
               <label id="footerText"><br>평일 09:00 ~ 19:00  토 09:00 ~ 17:00  일요일,공휴일 휴무<br><br>
               <br> 회사명 Onvery   대표 강다영   주소 서울특별시 강남구 역삼동 701, 1층<br>
                     사업자번호 678-12-34567 [사업자정보확인]   통신판매번호 제 2020-서울-1222 호<br>
                     대표전화 123-456-7890   팩스 123-456-7890   개인정보보호책임자 신은지   이메일 onveryshop@naver.com<br></label>
               
            </div>
            <div id="bottomMenuBox1">
               <ul id="bottomMenuItem1">
                  <li><a href="#">홈</a></li>
                  <li><a href="#">이용약관</a></li>
                  <li><a href="#">개인정보처리방침</a></li>
                  <li><a href="#">쇼핑몰 이용안내</a></li>
				  <li><a href="<c:url value='/mgLoginForm'/>">관리자 로그인</a></li>
               </ul>
            </div>
            <div id="bottomMenuBox2">
               <ul id="bottomMenuItem2">
                  <li><a href="#">공지사항</a></li>
                  <li><a href="#">상품문의</a></li>
                  <li><a href="#">상품후기</a></li>
                  <li><a href="#">FAQ</a></li>
               </ul>
            </div>
            <div id="moveToTopBox"><img src="<c:url value='/image/moveToTop.png'/>" id="moveToTop"></div>
         </div>
      </footer>
   </body>
</html>