$(document).ready(function(){
    $('#joinGatherBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"/JoinGatherPlan",
            data:{"ajaxMemNick":$('#ajaxMemNick').val(),
                  "ajaxClassScheNo":$('#ajaxClassScheNo').val(),
                  "ajaxClassNo":$('#ajaxClasstNo').val()
                },
            success:function(result){
                alert(result);
                location.reload();

            },
            error:function(data, textStatus, result){
                // alert("일정 참가 실패");
                console.log(data);
                console.log(result);
                console.log(textStatus);
            }
        });
    });
    $('#FakejoinGatherBtn').on('click', function(){
        alert("로그인이 필요합니다.");
        location.href="/login";
    });
    $('#deleteGatherBtn').on('click', function(){
        if(confirm("정말 삭제하시겠습니까?") == true) {
            event.preventDefault();

            $.ajax({
                type:"post",
                url:"/DeleteClassSchedule",
                data:{"ajaxClassScheNo":$('#ajaxClassScheNo').val()
                },
                success:function(result){
                    alert("삭제 완료");
                    // location.replace("/sun/detailgat/" + result.gatNo); // 변경 필요
                },
                error:function(data, textStatus, result){
                    alert("삭제 실패");
                    console.log(data);
                    console.log(result);
                    console.log(textStatus);
                }
            });
        }
        else {
            return;
        }
    });
});