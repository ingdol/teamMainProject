/**
 * mapsearch
 .moiminfodetail,.moimcommu,.moimphoto,.moimchatting
 */
 
$(function(){
	
	/*메뉴 누르면 게시판 보이도록*/
	$(".moim1").on('click',function(){
		console.log("a");
		$('.moimcommu').hide();
		$('.moimphoto').hide();
		$('.moimchatting').hide();
		$('.moiminfodetail').show();
	});
	
	$(".moim2").on('click',function(){
		/*모임 내 게시판*/
		console.log("a");
		$('.moiminfodetail').hide();
		$('.moimphoto').hide();
		$('.moimchatting').hide();
		location.href='/sun/detailgat/'+gatNo+'/commulist';
		$('.moimcommu').show();
	});
	
	$(".moim3").on('click',function(){
		console.log("a");
		$('.moiminfodetail').hide();
		$('.moimcommu').hide();
		$('.moimchatting').hide();
		$('.moimphoto').show();
	});
	
	$(".moim4").on('click',function(){
		console.log("a");
		$('.moiminfodetail').hide();
		$('.moimcommu').hide();
		$('.moimphoto').hide();
		$('.moimchatting').show();
	});
});