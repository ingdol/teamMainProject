/**
 *  index.js
 */

$(function(){
	// 윈도우 스크롤 시 메인 메뉴 고정
	$(window).on('scroll', function() {
		// 스크롤되는 문서의 top이 #headerBox 이상이면 메인 메뉴 고정되고 그림자 표시
		if($(document).scrollTop() >= $('#headerBox').height()){
			$('#mainMenuBox').addClass('mainMenuFixed mainMenuShadow');
		}else {
			$('#mainMenuBox').removeClass('mainMenuFixed mainMenuShadow');
		}
	});
	
/*	//chat 버튼 클릭시 
	$(".menu-btn").on('click',function(){
	  $(this).parents(".box").find(".menu-round-box").toggleClass('open');
			$.ajax({    		
				type:"post",	
				url: "chatBtn", //통신할 url		
				success: function(result) {
					$('#chatListBox').html(result);		
				},
				error: function(e, textStatus) {
					alert("에러가 발생했습니다 : " + textStatus);
				}
			});
	});*/
	
	//스크롤시 bottom에 chat 버튼 고정
	$('#chatButton').addClass('bottomFixed');
	$(window).on('scroll', function() {
			$('#chatButton').addClass('bottomFixed');
	});
	
	//스크롤시 bottom에 chat 버튼 고정
	$('#chatB_nav').addClass('bottomFixed');
	$(window).on('scroll', function() {
			$('#chatB_nav').addClass('bottomFixed');
	});
	
	//스크롤시 bottom에 chat 버튼 고정
/*	$('#chatBtnBox').addClass('bottomFixed');
	$(window).on('scroll', function() {
			$('#chatBtnBox').addClass('bottomFixed');
	});*/
	
	//moveToTop 위치 클릭 시 top으로 이동
	$('#moveToTop').on('click', function(){
		$('html, body').animate({scrollTop:0},500);
	});
	
});


 $(document).ready(function(){ 
	
	
});


/*$(function(){
	// 윈도우 스크롤 시 메인 메뉴 고정
	$(window).on('scroll', function() {
		// 스크롤되는 문서의 top이 #headerBox 이상이면 메인 메뉴 고정되고 그림자 표시
		if($(document).scrollTop() >= $('#headerBox').height()){
			$('#mainMenuBox').addClass('mainMenuFixed mainMenuShadow');
		}else {
			$('#mainMenuBox').removeClass('mainMenuFixed mainMenuShadow');
		}
	});
	
	
	// moveToTop 이미지 클릭 시 top으로 이동
	$('#moveToTop').on('click', function(){
		$('html, body').animate({scrollTop:0}, 500);
	});
	
});*/

function muenuButton(){
	
	/*  $(".menu-btn").parents(".box").find(".menu-round-box").toggleClass('open');
	*/		$.ajax({    		
				type:"post",	
				url: "/chatWindow", //통신할 url		
				success: function(result) {					
					$('#chatListBox').html(result);		
				},
				error: function(e, textStatus) {
					alert("에러가 발생했습니다 : " + textStatus);
				}
			});

}
