/**
 * allmoim
 */
 
$(function(){	
	
	$('#moimcard .card').on('click',function(e){
		e.preventDefault();
		console.log(e.target.classList);
		if(e.target.classList == "card")
			e.target.classList.add("current");
		else
			return;				
		var oncard= document.querySelector('.current');
		var hidden = oncard.querySelector('.hidden');
		var gatNo = hidden.innerText;
		console.log(gatNo);			
		window.location.href='/sun/detailgat/'+gatNo;
		oncard.classList.remove("current");
	});
	
	$('#classcard .card').on('click',function(e){
		e.preventDefault();
		console.log(e.target.classList);
		if(e.target.classList == "card")
			e.target.classList.add("current");
		else
			return;				
		var oncard= document.querySelector('.current');
		var hidden = oncard.querySelector('.hidden');
		var classNo = hidden.innerText;
		console.log(classNo);			
		window.location.href='/sun/detailclass/'+classNo;
		oncard.classList.remove("current");
	});
	
	/* 모임더보기 눌렀을때 해당 hobbyNo에 속하는 모임들 전부 나오도록 */
	$('.moimplus').on('click',function(e){
		e.preventDefault();
		console.log("모임더보기클릭!");
		var moim = document.querySelector('.moim');
		var hobby = moim.querySelector('.spannone').innerHTML;
		console.log(hobby);
		location.href='/sun/allmoimdetail2/'+hobby;		
	});
	
	/* 클래스더보기 눌렀을때 해당 hobbyNo에 속하는 클래스들 전부 나오도록 */
	$('.classplus').on('click',function(e){
		e.preventDefault();
		console.log("클래스더보기클릭!");
		var clas = document.querySelector('.clas');
		var hobby = clas.querySelector('.spannone').innerHTML;
		console.log(hobby);
		location.href='/sun/allclassdetail/'+hobby;
	});
		
	
	
	$('#findPlaceBtn').on('click', function(e){
		e.preventDefault();
		
		var gatArea = $('#gatArea').val();
		var hobbyNo = $('#category').val();
		console.log(gatArea+hobbyNo);
		
		
		$.ajax({
			type:"post",
			url:"/sun/allmoim/filter",
			data:{"gatArea": gatArea,
					  "hobbyNo": hobbyNo},  /* 컨트롤러에서 받을 때*/
			
			dataType:'text',
			success:function(result){
				if(result !=''){	
				$('#allmoimclass').empty();
				console.log(result);
				$('#allmoimclass').append(result);
				}
				
				else {
                    $('#allmoimclass').empty();
                    $('#allmoimclass').css({"margin-left" : "0 !important"});
                    $('#allmoimclass').append('<span id="notFound" style="margin: 0 !important;">');
                  	$('#allmoimclass').append('<p style="font-weight: bold; color:#474646 ;font-size: 64px; padding: 20px; margin: 20px;">검색 결과가 없습니다.</p>');
                    $('#allmoimclass').append('</span>');                   
                }
				
			},
			error:function(data, textStatus){
				alert("전송 실패");
			},
			complete:function(data, textStatus){
				alert("작업을 완료했습니다");
			}
		});		
	});			
});