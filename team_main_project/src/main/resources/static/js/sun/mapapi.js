/**
 * 
 */

$(document).ready(function (){ 
    var allmaps = document.querySelectorAll('#maps');
    console.log(allmaps.length);
    
    for(var i=0; i<allmaps.length; i++){
    	console.log(allmaps[i].value);	
	}
    
	// 도로명 주소를 좌표 값으로 변환(API)	
	for(var i=0; i<allmaps.length; i++){
			
	    naver.maps.Service.geocode({
	        query: allmaps[i].value
	    }, function(status, response) {
	        if (status !== naver.maps.Service.Status.OK) {
	            return alert('Something wrong!');
	        }
	
	        var result = response.v2, // 검색 결과의 컨테이너
	            items = result.addresses; // 검색 결과의 배열
	
	        // 리턴 받은 좌표 값을 변수에 저장
	        let x = new Array();
	        let y = new Array();
	        
	        x[i] = parseFloat(items[0].x);
	       	y[i] = parseFloat(items[0].y);
	
	        // 지도 생성
	        var map = new naver.maps.Map('map', {
	            center: new naver.maps.LatLng(y[i], x[i]), // 지도를 열 좌표
	            zoom: 10
	        });
	
	        // 지도에 해당 좌표 마커(아이콘 설정)
	        var markerOptions = {
	            /*position: new naver.maps.LatLng(y, x), //마커찍을 좌표*/
	            position: new naver.maps.LatLng(y[i], x[i]),
	            map: map,
	            icon: {
	                url: 'resources/img/marker.png', //아이콘 경로
	                size: new naver.maps.Size(22, 36), //아이콘 크기
	                origin: new naver.maps.Point(0, 0),
	                anchor: new naver.maps.Point(11, 35)
	            }
	        };
	        // 맵 옵션
	        var mapOptions = {
	            scaleControl: false,
	            logoControl: false,
	            mapDataControl: false,
	            zoomControl: true
	        }
	
	        // 마커 생성
	        var marker = new naver.maps.Marker(markerOptions);
	
	    });	   
	   }
});