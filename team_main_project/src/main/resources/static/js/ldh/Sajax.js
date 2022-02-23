/**
 * 
 */
 
// 
//  $(document).ready(function(){
//	$('#SBoardForm').on('submit', function(){
//		event.preventDefault();
//		
//		$.ajax({
//			type:"ldh/Somoimboard/",
//			url:"sboard2",
//			data:{"memNick": $('#memNick').val(),
//					  "gatNo":  $('#gatNo').val(),
//					  "gatDetInfo": $('#gatDetInfo').val(),
//					  "gatInfo":$('#gatInfo').val(),
//					  "gatDetNo":$('#gatDetNo').val()},  /* 컨트롤러에서 받을 때 : id, pw로 받음*/
//			dataType:'text',
//			success:function(result){
//					location.href="/ldh/Somoimboard/"+$gatDetNo;
//			},
//			error:function(data, textStatus){
//				alert("전송 실패");
//			}
//		});
//	});	
//});