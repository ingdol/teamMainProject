$(document).ready(function(){
    $('#joinGatherBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"JoinGatherPlan",
            data:{"ajaxMemNick":$('#ajaxMemNick').val(),
                  "ajaxGatScheNo":$('#ajaxGatScheNo').val(),
                  "ajaxGatNo":$('#ajaxGatNo').val()
                },
            dataType:'json',
            success:function(result){
                alert("일정 참가 완료");
            },
            error:function(data, textStatus, result){
                alert("일정 참가 실패");
                console.log(data);
                alert(result);
                console.log(textStatus);
            }
        });
    });
});