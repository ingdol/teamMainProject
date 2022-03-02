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
});