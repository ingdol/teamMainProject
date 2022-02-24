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
    // ajax
    // $('#btnSave').on('submit', function(){
    //     event.preventDefault();
    //     $.ajax({
    //         type: "post",
    //         url: "WriteGatherSchedule",
    //         data:{"memNick": $('#memNick').val(),
    //             "gatNo": $('#gatNo').val(),
    //             "gatScheTitle": $('#gatScheTitle').val(),
    //               "gatScheDate": $('#gatScheDate').val(),
    //             "gatScheTime": $('#gatScheTime').val(),
    //             "gatScheMax": $('#gatScheMax').val(),
    //             "scheduleAddress": $('#scheduleAddress').val(),
    //             "gatScheSpace": $('#gatScheSpace').val(),
    //             "scheduleSpace": $('#scheduleSpace').val(),
    //             "gatScheInfo": $('#gatScheInfo').val()
    //               },
    //         dataType: 'text',
    //         success:function (result) {
    //             alert("일정 등록 완료!");
    //         },
    //         error:function(data, textStatus){
    //             alert("카테고리 이름 return 검색 실패");
    //         }
    //     })
    // });
});
