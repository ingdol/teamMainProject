$(document).ready(function(){
    $('#joinGatherBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"/JoinGatherPlan",
            data:{"ajaxMemNick":$('#ajaxMemNick').val(),
                  "ajaxGatScheNo":$('#ajaxGatScheNo').val(),
                  "ajaxGatNo":$('#ajaxGatNo').val()
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
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"/JoinGatherPlan",
            data:{"ajaxGatScheNo":$('#ajaxGatScheNo').val()
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
});