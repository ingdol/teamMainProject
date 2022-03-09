/**
 * chatBtn.js
 */
 $(function(){
	$(window).on('scroll', function() {
		// 스크롤되는 문서의 top이 #headerBox 이상이면 메인 메뉴 고정되고 그림자 표시
		if($(document).scrollTop() >= $('#headerBox').height()){
			$('#mainMenuBox').addClass('mainMenuFixed mainMenuShadow');
		}else {
			$('#mainMenuBox').removeClass('mainMenuFixed mainMenuShadow');
		}
	});
	
	 $(".menu-btn").on('click',function(){
	  $(this).parents(".box").find(".menu-round-box").toggleClass('open');
	});
});
