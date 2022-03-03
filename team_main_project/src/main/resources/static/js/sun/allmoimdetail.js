/**
 * allmoimdetail
 */
 
$(function(){
	$('.moimcard').on('click',function(e){
				
		console.log(e.target.classList);	
		if(e.target.classList != "card")
			e.target.parentNode.classList.add("current");
		else
			e.target.classList.add("current");
			
		var oncard = document.querySelector('.current');
		var hidden = oncard.querySelector('.hidden');
		var gatNo = hidden.innerText;
		console.log(gatNo);
			
		window.location.href='/sun/detailgat/'+gatNo;
		
		/* 한번누르면 current 지워주기*/		
		oncard.classList.remove("current");
	});
		
});