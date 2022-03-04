/**
 * allmoim
 */
 
$(function(){
	$('.moim .card').on('click',function(e){
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
	
	$('.class .card').on('click',function(e){
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
	
	
});