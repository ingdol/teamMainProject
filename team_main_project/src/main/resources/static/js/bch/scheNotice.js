$(document).ready(function(){
    $('#joinGatherBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"JoinGather",
            data:{"ajaxMemNick":$('#ajaxMemNick').val(),
                "ajaxGatScheNo":$('#ajaxGatScheNo').val(),
                "ajaxGatNo":$('#ajaxGatNo').val()},
            dataType:'int',
            success:function(result){
                alert("일정 참가 완료");
            },
            error:function(data, textStatus){
                alert("일정 참가 실패");
                console.log(data);
                console.log(textStatus);
            }
        });
    });
});