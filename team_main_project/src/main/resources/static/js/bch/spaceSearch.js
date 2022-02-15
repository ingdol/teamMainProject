$(document).ready(function(){
    $('#findPlaceBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"findConstraint",
            data:{"location":$('#location').val(),
                "category":$('#category').val(),
                "maxPerson":$('#maxPerson').val()},
            dataType:'text',
            success:function(result){
                if(result != ""){
                    $('#gallerylistBox').empty();
                    $('#gallerylistBox').append('<table>');
                        for(var i=0; i <result.length; i++){
                            $('#resultTable').append('<tr><td>' + result[i].spaceTitle + '</td><td>');
                                // result[i].prdName + '</td><td>' +
                                // result[i].prdPrice+ '</td><td>' +
                                // result[i].prdCompany + '</td><td>' +
                                // result[i].prdStock + '</td><td>');
                        }
                    $('#gallerylistBox').append('</table>');
                }
            },
            error:function(data, textStatus){
                alert("전송 실패");
            }
        });
    });
});