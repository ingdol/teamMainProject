/**
 * searchZip.js
   우편번호 검색
 */
 
  $(document).ready(function(){
	
	$('#searchZip').on('click', function(){	
		new daum.Postcode({
			oncomplete:function(data){
				// 팝업 창에서 검색 결과 클릭했을 때 
				var spaceArea = '';
				//법정명과 건물명 : (~동, ~건물) (~동, ~아파트)
				//var dong_building='';
				
				//도로명 주소인 경우
				if(data.userSelectedType == 'R'){
					spaceArea = data.roadAddress + "(" + data.bname + data.buildingName + ")";
				}else { //지번 주소인 경우
					spaceArea = data.jibunAddress;
				}
				
				// 우편번호와 주소1 출력
//				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('spaceArea').value = spaceArea;
				
				// 상세주소 입력하도록 입력되어 있는 값 삭제하고 포커스
//				var memAddress2 = document.getElementById('memAddress2');
//				memAddress2.value = "";
//				memAddress2.focus();
				
			}
		}).open();		
	});		
});	