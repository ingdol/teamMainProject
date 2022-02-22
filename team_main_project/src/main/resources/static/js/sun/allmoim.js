/**
 * allmoim
 */
 
$(function(){
	
	$('.btn').on('click',function(e){
		window.location.href='/sun/allmoimdetail';
	});
	
	$('.card').on('click',function(e){
				
		console.log(e.target.parentNode.classList);	
		
		e.target.parentNode.classList.add("current");
		var oncard = document.querySelector('.current');
		var hidden = oncard.querySelector('.hidden');
		var gatNo = hidden.innerText;
		console.log(gatNo);
				
		window.location.href='/sun/detailgat/'+gatNo;

		/* 한번누르면 current 지워주기*/		
		oncard.classList.remove("current");
	});
	
});