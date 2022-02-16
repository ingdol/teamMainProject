/**
 * mapsearch
 */
 
$(function(){
	$('#filter div').on('click',function(){
		console.log("a");
	});
	
	$('.dropdown').on('click',function(){
		console.log("b");
	});
	
	/*메뉴 누르면 게시판 보이도록*/
	$(".mapmenu").on('click',function(){
		console.log("a");
		$('.hobby').hide();
		$('.map').show();
	});
	
	$(".hobbymenu").on('click',function(){
		console.log("a");
		$('.map').hide();
		$('.hobby').show();
	});	
});