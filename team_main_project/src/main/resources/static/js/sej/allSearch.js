/**
 * memberSearch.js
 	상품 검색
 */
 
 $(document).ready(function(){
	$('#memSearchFrm').on('submit', function(){
		event.preventDefault();
		
		var formData = $(this).serialize();
		// serialize() : 폼에 입력한 값을 쿼리 스트링 방식의 데이터로 변환
		//type=prdName&keyword=노트북
		
		$.ajax({
			type:"post",
			url:"gatherSearch",
			data:formData,  
			success:function(result){   // 컨트롤러에서 반환한 prdList를 result가 받음				
				$('#searchResultbox').html(result);			
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});	
});










