$(document).ready(function(){
    document.getElementById("zipcodeButton").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                // document.getElementById("memZipcode").value = data.zonecode; // 주소 넣기 data.address
                document.getElementById("scheduleAddress").value = data.address;
            }
        }).open();
    });
    // 지도 끝
});
