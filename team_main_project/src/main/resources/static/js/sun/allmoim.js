/**
 * allmoim
 */
 
$(function(){
	/* select별로 모임,클래스나타내기 */
	/*$('#hobbyselect').on('change',function(){
		const selectedValue = document.getElementById('hobbyselect').value;
		console.log(selectedValue);
		if($('#hobbyselect option:selected').val()!='10' && $('#hobbyselect option:selected').val()!='--')
			window.location.href='/sun/allmoim/'+selectedValue;
		else if($('#hobbyselect option:selected').val()=='10'){
			window.location.href='/sun/allmoim/all';			
		}
	});
	*/
	
	/* 개설일순 */
	/*$('#hot').on('change',function(){
		console.log($('#hot option:selected').val());
	/*if($('#hot option:selected').val()=='datemax'){
		location.href='/sun/allmoim/'+$('#hobbyselect option:selected').val()+'/datemax';
	}*/
	
	/*});*/
	
	/*$('.btn').on('click',function(){
		window.location.href='/sun/allmoimdetail';
	});*/
	
	
	$('#moimcard').on('click',function(e){
				
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
	
	$('#classcard').on('click',function(e){
				
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