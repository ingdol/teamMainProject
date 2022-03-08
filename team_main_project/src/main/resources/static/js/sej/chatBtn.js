/**
 * chatBtn.js
 */
 $(function(){
	 $(".menu-btn").on('click',function(){
	  $(this).parents(".box").find(".menu-round-box").toggleClass('open');
	});
});
