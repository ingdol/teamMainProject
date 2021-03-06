$(document).ready(function(){
    $('.ReservationCancel').on('click', function(){
        var item = $(this).siblings('input').val();
        if(confirm("정말 예약을 취소하시겠습니까?")) {
            $.ajax({
                type:"post",
                url:"/CancelSpaceReservation",
                data:{"spaceReserNo": item
                },
                success:function(result){
                    alert("예약이 취소 되었습니다.");
                    location.reload();
                },
                error:function(data, textStatus, result){
                    // alert("일정 참가 실패");
                    console.log(data);
                    console.log(result);
                    console.log(textStatus);
                }
            });
        }
        else{
            event.preventDefault();
        }
    });
    $('.FakeReservationCancel').on('click', function(){
        alert("예약일 이전에만 취소가 가능합니다");
    });
});
