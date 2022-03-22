/**
 * 
 */

 
  $(document).ready(function(){
	$('#gat_Recommand ').on('click', function(){
		event.preventDefault();
		
		var as;
		
		$.ajax({
			type:"post",
			url:"/gatLike",
			async:false,
			data:{
				 "gatNo":$('#gatNo').val(),
                  "memNick":$('#memNick').val(),
                },
			success:function(result){
					if(result=="0"){
						 console.log(result);
              			  location.reload();
					}
						else if(result=="1"){
 						alert("이미 추천을 하였습니다.");
					}
				
            },
			error:function(data, textStatus){
				alert("로그인을 해주세요.");
			}
		});
	});
	
});