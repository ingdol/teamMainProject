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
    $('#btnSave1').on('click', function(){
        event.preventDefault();
        $.ajax({
            type: "post",
            url: "/WriteGatherScheduleWithoutSpaceReser",
            data:{"memNick": $('#memNick').val(),
                "gatNo": $('#gatNo').val(),
                "gatScheTitle": $('#gatScheTitle').val(),
                  "gatScheDate": $('#gatScheDate').val(),
                "gatScheTime": $('#gatScheTime').val(),
                "gatScheMax": $('#gatScheMax').val(),
                "scheduleAddress": $('#scheduleAddress').val(),
                "scheduleSpace": $('#scheduleSpace').val(),
                "gatScheSpace": $('#gatScheSpace').val(),
                "gatScheInfo": $('#gatScheInfo').val()
                  },
            success:function (result) {
                alert("일정 등록 완료!");
                window.location.replace('/sun/detailgat/'+$('#gatNo').val());
            },
            error:function(data, textStatus){
                alert("일정 등록 실패!");
            }
        })
    });
    $('#btnSave2').on('click', function(){
        event.preventDefault();
        $.ajax({
            type: "post",
            url: "/WriteGatherSchedule",
            data:{"memNick": $('#memNick').val(),
                "gatNo": $('#gatNo').val(),
                "gatScheTitle": $('#gatScheTitle').val(),
                "gatScheDate": $('#gatScheDate').val(),
                "gatScheTime": $('#gatScheTime').val(),
                "gatScheMax": $('#gatScheMax').val(),
                "scheduleAddress": $('#scheduleAddress').val(),
                "scheduleSpace": $('#scheduleSpace').val(),
                "gatScheSpace": $('#gatScheSpace').val(),
                "gatScheInfo": $('#gatScheInfo').val(),
                "spaceNo": $('#spaceNo').val(),
                "date": $('#date').val(),
                "time": $('#time').val(),
                "time2": $('#time2').val(),
                "spacePrice": $('#spacePrice').val(),
                "spaceTitle": $('#spaceTitle').val()
            },
            success:function (result) {
                alert("일정 등록 & 공간 예약 완료!");
                window.location.replace('/sun/detailgat/'+$('#gatNo').val());
            },
            error:function(data, textStatus){
                alert("일정 등록 실패!");
            }
        })
    });
});
