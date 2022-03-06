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
		var classNo = hidden.innerText;
		console.log(classNo);
			
		window.location.href='/sun/detailclass/'+classNo;
		
		/* 한번누르면 current 지워주기*/		
		oncard.classList.remove("current");
	});
		
});