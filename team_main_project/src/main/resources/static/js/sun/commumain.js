/**
 * 
 */
 
$(function(){
	/*메뉴 누르면 게시판 보이도록*/
	
	$(".category1").on('click',function(){
		console.log("a");
		$('.dailybox').hide();
		$('.reviewbox').hide();
		$('.bestbox').hide();
		$('.writebox').hide();
		$('.allbox').show();
	});
	
	$(".category2").on('click',function(){
		console.log("a");
		$('.allbox').hide();
		$('.reviewbox').hide();
		$('.bestbox').hide();
		$('.writebox').hide();
		$('.dailybox').show();
	});
	
	$(".category3").on('click',function(){
		console.log("a");
		$('.allbox').hide();
		$('.dailybox').hide();
		$('.bestbox').hide();
		$('.writebox').hide();
		$('.reviewbox').show();
	});
	
	$(".category4").on('click',function(){
		console.log("a");
		$('.allbox').hide();
		$('.dailybox').hide();
		$('.reviewbox').hide();
		$('.writebox').hide();
		$('.bestbox').show();
	});
	
	$(".category5").on('click',function(){
		console.log("a");
		/*$('.allbox').hide();
		$('.dailybox').hide();
		$('.reviewbox').hide();
		$('.bestbox').hide();
		$('.writebox').show();*/
		window.location.replace('/ldh/CommunityWrite');
	});
});