/**
 * 
 */

 
  $(document).ready(function(){
	$('#star2 ').on('click', function(){
		event.preventDefault();
		
		var as;
		
		$.ajax({
			type:"post",
			url:"/CommunityLike",
			async:false,
			data:{
                  "commuNo":$('#commuNo').val(),
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

$(document).ready(function(){
	$('#siren2').on('click', function(){
		event.preventDefault();
		
		var asd;
		
		$.ajax({
			type:"post",
			url:"/CommunityHate",
			async:false,
			data:{
                  "commuNo":$('#commuNo').val(),
                  "memNick":$('#memNick').val(),
                },
			success:function(result){
					if(result=="0"){
						 console.log(result);
              			  location.reload();
					}
						else if(result=="1"){
 						alert("이미 신고를 하셨습니다.");
					}
				
            },
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});		
	});