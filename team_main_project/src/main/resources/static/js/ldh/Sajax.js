/**
 * 
 */

 
  $(document).ready(function(){
	$('#star ').on('click', function(){
		event.preventDefault();
		
		var as;
		
		$.ajax({
			type:"post",
			url:"/SomoimboardLike",
			async:false,
			data:{
				 "gatNo":$('#gatNo').val(),
                  "gatDetNo":$('#gatDetNo').val(),
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
				alert("전송 실패");
			}
		});
	});	
});