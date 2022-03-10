/**
 * 
 */

$(document).ready(function() {

	var allmaps = document.querySelectorAll('#maps,#maps2');
	var markers = new Array();
	var infos = new Array();

	// 리턴 받은 좌표 값을 변수에 저장
	var a = new Array();
	var b = new Array();
	var c = new Array();
	var num = new Array(); //모임,클래스 넘버내용
	var title = new Array(); //모임,클래스제목내용
	var jump = new Array();
	
	// 지도 생성
	var map = new naver.maps.Map('map', {
		center: new naver.maps.LatLng(37.552758094502494, 126.98732600494576), // 지도를 열 좌표
		zoom: 8
	});

	start();

	function start() {
		for (var i = 0; i < allmaps.length; i++) {
			title[i] = allmaps[i].previousElementSibling.innerHTML;
			num[i] = allmaps[i].previousElementSibling.previousElementSibling.innerHTML;

			if (allmaps[i].parentNode.classList.contains("moim")) {
				jump[i] = "/sun/detailgat/" + num[i];
			} else {
				jump[i] = "/sun/detailclass/" + num[i];
			}
			console.log(jump[i]);
			coordinate(i);
		}

	}



	function coordinate(i) {
		naver.maps.Service.geocode({
			query: allmaps[i].innerHTML //각 모임,클래스의 지역(이름)
		}, function(status, response) {
			if (status !== naver.maps.Service.Status.OK) {
				return alert('Something wrong!');
			}
			var result = response.v2, // 검색 결과의 컨테이너
				items = result.addresses; // 검색 결과의 배열

			a[i] = parseFloat(items[0].x);
			b[i] = parseFloat(items[0].y);
			c[i] = items[0].roadAddress;

			console.log(a[i] + "," + b[i] + "," + c[i]);
			mark(i);
		});
	}

	function mark(i) {
		console.log(a[i] + ",," + b[i]);

		var marker = new naver.maps.Marker({
			map: map,
			title: c[i], // 지역구 이름 
			position: new naver.maps.LatLng(b[i], a[i]), // 지역구의 위도 경도 넣기 
			icon: {
				url: 'resources/img/marker.png',
				size: new naver.maps.Size(32, 32),
				anchor: new naver.maps.Point(16, 32)
			}
		});

		/* 정보창 */
		var info = new naver.maps.InfoWindow({
			content: '<a href=' + jump[i] + '><div style="width:200px;text-align:center;padding:10px;"><b>' + title[i] + '</b></div></a>'
		}); // 클릭했을 때 띄워줄 정보 HTML 작성

		markers.push(marker); // 생성한 마커를 배열에 담는다.
		infos.push(info); // 생성한 정보창을 배열에 담는다.	


		function getClickHandler(seq) {
			return function(e) {  // 마커를 클릭하는 부분
				var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
					info = infos[seq]; // 클릭한 마커의 시퀀스로 찾는다

				if (info.getMap()) {
					info.close();
				} else {
					info.open(map, marker); // 표출
				}
			}
		}

		for (var i = 0, ii = markers.length; i < ii; i++) {
			naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
		}
	}
});