/**
 *
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
		/*location.href='/sun/detailgat/'+gatNo+'/commulist';*/
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
		$('.moimcommu').hide();
		$('.moimphoto').hide();
		$('.moiminfodetail').show();
		/*location.href='/chat';*/
	});
	// $(".gatherschedule").on('click',function(){
	// 	location.href='/GatherSchedule?';
	// });
	$("#fakeBtn").on('click',function(){
		alert("로그인이 필요합니다.");
		window.location.replace('/login');
	});
	$("#fakeBtn2").on('click',function(){
		alert("모임에 가입이 필요합니다.");
		event.preventDefault();
	});
	$("#fakeBtn3").on('click',function(){
		alert("클래스에 가입이 필요합니다.");
		event.preventDefault();
	});

	$('#join').on('click', function () {
		$.ajax({
			type:"post",
			url:"/SignInGather",
			data:{"memNick":$('#memNick').val(),
				"gatNo":$('#gatNo').val()
			},
			success:function(result){
				if(result == 1) {
					alert("모임에 가입되었습니다.");
					location.reload();
				}
				else if(result == 3) {
					alert("해당 모임에 이미 가입하셨습니다.");
					location.reload();
				}
				else {
					alert("모임 5개 모두 가입하셨습니다.");
					location.reload();
				}
			},
			error:function(data, textStatus, result){
				alert("모임 가입 실패");
				console.log(data);
				console.log(result);
				console.log(textStatus);
			}
		});
	});
	$("#joinFake").on('click',function(){
		alert("로그인이 필요합니다.");
		window.location.replace('/login');
	});
});