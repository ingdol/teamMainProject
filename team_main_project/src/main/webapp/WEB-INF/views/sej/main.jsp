<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="<c:url value='/css/sej/product.css?after'/>" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div id="wrap">			
		
			<!-- TOP  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/top.jsp" flush='true' />
		   
			<section>
				<article id="content1"> <!-- 탭메뉴 -->
			        <div class="fixed01">
			        <div id="beneBox"><a href="index.html"><img src="image/bene.png" id="beneImg"></a></div>
					<div id="bestMenuBox1">		
								
						<div id="productBox">
							
							<div class="productBest">
								<div><a href="<c:url value = '/prdDetail'/>"><img src="image/item/best1.jpg">
									<label id="prdName">크리스마스 풍선<br>연말 파티 용품</label>
									<hr id="pbHr"><label id="prdPrice">9,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/best2.jpg">
									<label id="prdName">DIY 구름 풍선가랜드<br>핑크민트크리스마스 세트</label>
									<hr id="pbHr"><label id="prdPrice">9,900원</label>
								</a></div>
								<div><a href="#"><img src="image/item/best3.jpg">
									<label id="prdName">DIY 구름 풍선가랜드<br>메리크리스마스 세트</label>
									<hr id="pbHr"><label id="prdPrice">9,900원</label></a>
								</div>
							</div>
						</div>
					</div>	
					<div id="bestMenuBox2">
						<div id="productBox">
							<div class="productBasic">
								<div><a href="#"><img src="image/item/bagic1.jpg">
									<label id="prdNameS">DIY 럭셔리크리스마스 세트<br>24,000원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic2.jpg">
									<label id="prdNameS">2022 새해 가랜드 풍선세트<br>16,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic3.jpg">
									<label id="prdNameS">은박풍선세트 메리크리스마스<br>7,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic4.jpg">
									<label id="prdNameS">크리스마스 가랜드 레터스노우맨<br>5,000원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic5.jpg">
									<label id="prdNameS">2022 새해 가랜드 메탈홀릭<br>16,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic6.jpg">
									<label id="prdNameS">DIY 프로즌크리스마스 세트<br>14,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic7.jpg">
									<label id="prdNameS">크리스마스 스탠딩 트리 은박풍선<br>13,000원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic8.jpg">
									<label id="prdNameS">2022 새해 가랜드 하트레드은박<br>16,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic9.jpg">
									<label id="prdNameS">크리스마스 레드지팡이 은박풍선<br>8,000원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic10.jpg">
									<label id="prdNameS">레터링풍선 22인치 크리스마스<br>32,000원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic11.jpg">
									<label id="prdNameS">2022 새해 가랜드 블루비앙카<br>16,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic12.jpg">
									<label id="prdNameS">LED산타전구가랜드 10P<br>8,000원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic13.jpg">
									<label id="prdNameS">컨페티풍선세트 골드크리스마스<br>6,000원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic14.jpg">
									<label id="prdNameS">2022 새해 가랜드 플로리다<br>16,900원</label>
									</a></div>
								<div><a href="#"><img src="image/item/bagic15.jpg">
									<label id="prdNameS">크리스마스 토퍼 위드산타모자<br>4,000원</label>
									</a></div>
							</div>
						</div>

					</div>
					</div>
				</article>
				
				<article id="content2"> <!-- 베스트 상품 -->
					
				</article>
			</section>
			
			<!-- BOTTOM  -->
		    <jsp:include page="/WEB-INF/views/sej/layout/bottom.jsp" flush='true' />
			
		</div>
	</body>
</html>

