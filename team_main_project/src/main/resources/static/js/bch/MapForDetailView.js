$(document).ready(function (){
    var Addr_val = $('#address').val();

    // 도로명 주소를 좌표 값으로 변환(API)
    naver.maps.Service.geocode({
        query: Addr_val
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }

        var result = response.v2, // 검색 결과의 컨테이너
            items = result.addresses; // 검색 결과의 배열

        // 리턴 받은 좌표 값을 변수에 저장
        let x = parseFloat(items[0].x);
        let y = parseFloat(items[0].y);

        // 지도 생성
        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(y, x), // 지도를 열 좌표
            zoom: 16,
            zoomControl: true, //줌 컨트롤의 표시 여부
            zoomControlOptions: { //줌 컨트롤의 옵션
                position: naver.maps.Position.TOP_RIGHT
            }
        });

        // 지도에 해당 좌표 마커(아이콘 설정)
        var markerOptions = {
            position: new naver.maps.LatLng(y, x), //마커찍을 좌표
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
});