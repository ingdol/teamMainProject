$(document).ready(function(){
    console.log($('#spaceNoForCtgName').val());
    // $.ajax({
    //     type: "post",
    //     url: "SpaceReservationAll",
    //     data:{"spaceNoForCtgName": $('#spaceNoForCtgName').val()
    //           },
    //     dataType: 'json',
    //     success:function (result) {
    //         alert("카테고리 이름 성공");
    //         alert(result);
    //     },
    //     error:function(data, textStatus){
    //         alert("카테고리 이름 return 검색 실패");
    //     }
    // })
    $('#findPlaceBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"findConstraint",
            data:{"location":$('#location').val(),
                "category":$('#category').val(),
                "maxPerson":$('#maxPerson').val()},
            dataType:'json',
            async: false,
            success:function(result){
                if(result != ""){
                    var space = result;
                    console.log(space);
                    $('#gallerylist').empty();
                    $('#gallerylist').append('<span class="gallerylistBox" id="gallerylistBox">');
                        for(var i = 0; i < Object.keys(space).length; i++){
                            $('#gallerylistBox').append('<a href="' + '/detailViewSpace/' + space[i].spaceNo + '"'  + '>' +
                                '<div class="card">' +
                                '<div class="card-header">' +
                                '<div class="card-header-is_closed">' +
                                '<div class="card-header-text">');
                            $.ajax({
                                type:"post",
                                url:"constraintCtg", // @RestController로 요청
                                dataType: 'json',
                                async: false,
                                success:function(result_name){
                                    var spaceCtgName = result_name;
                                    for(var j = 0; j < 1; j++) {
                                        $('#gallerylistBox').append(spaceCtgName[j].spaceCtgName + '</div>'); // card-header-text 닫힘
                                    }
                                },
                                error:function(data, textStatus){
                                    alert("카테고리 이름 추출 실패");
                                }
                            }); // 카테고리 이름 뽑는 ajax 끝
                            $('#gallerylistBox').append('<div class="card-header-number"></div>' +
                                                        '</div>' + // card-header-is_closed 닫힘
                                                        '</div>' + // card-header 닫힘
                                                        '<div class="card-body">' +
                                                        '<div class="card-body-header">' +
                                                        '<h1>' + space[i].spaceTitle + '</h1>' +
                                                        '<p class="card-body-hashtag">' + space[i].spaceArea + '</p>' +
                                                        '<p class="card-body-nickname">' + '최대' + space[i].spacePerMax + '인' + '</p>' +
                                                        '</div>' + // card-body-header 닫힘
                                                        '<p class="card-body-description">' +
                                                        space[i].spacePrice1 + '<span>' + '/비수기' + '</span>' + '<br>' +
                                                        space[i].spacePrice2 + '<span>' + '/성수기' + '</span>' + '</p>' +
                                                        '<div class="card-body-footer">' +
                                                        '<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">' +
                                                        '<i class="icon icon-view_count"></i>' +
                                                        '<i class="icon icon-comments_count"></i>' +
                                                        '<i class="reg_date"></i>' +
                                                        '</div>' +
                                                        '</div>' +
                                                        '</div>' +
                                                        '</a>');
                        }
                    $('#gallerylist').append('</span>');
                }
            },
            error:function(data, textStatus){
                alert("조건 검색 실패");
            }
        });
    });
});