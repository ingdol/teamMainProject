/**
 * slideShow.js
 */

$(function(){
	// 이동한 이미지의 index 값 저장 (현재 위치)
	var movedIndex = 0;
	
	//슬라이드 패널을 움직이는 함수
	function moveSlide(index){
		movedIndex = index;
		
		//슬라이드 이동
		var moveLeft = -(index * 1280); // 왼쪽으로 이동 거리
		$('#slidePanel').animate({'left':moveLeft}, 'slow');
	}
	
	// prev 버튼 클릭하면 앞(왼쪽)으로 이동
	$('#prevButton').on('click', function(){
		if(movedIndex != 0)
			movedIndex = movedIndex - 1;
		
		moveSlide(movedIndex); 
	});
	
	
	// next 버튼 클릭하면 뒤(오른쪽)으로 이동
	$('#nextButton').on('click', function(){
		if(movedIndex != 4)
			movedIndex = movedIndex + 1;
		
		moveSlide(movedIndex); 
	});
	
	/*// 초기 슬라이더 위치 랜덤하게 지정
	var rNum = Math.floor(Math.random() * 5);
	moveSlide(rNum); 
	*/
	// 각 컨트롤 버튼에 대해 	
	$('.controlButton').each(function(index){
		$(this).hover(
			function() {
				$(this).attr('src', 'image/controlButton2.png');
			},
			function() {
				$(this).attr('src', 'image/controlButton1.png');
			}
		);
		
		//
		$(this).on('click', function(){
			moveSlide(index);
		});
		
	});/*each 끝*/
	
});

