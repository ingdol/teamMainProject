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
	
	$('.hotmenu').on('click',function(){
		console.log("hotmenu 클릭");		
		location.href="/sun/allmoimdetail/1";
	});
	
	/* 페이지넘기는거 - restcontroller사용? */
	/*페이지번호 받아서, begin*페이지번호 이헌식으로해서 받기?  */
});