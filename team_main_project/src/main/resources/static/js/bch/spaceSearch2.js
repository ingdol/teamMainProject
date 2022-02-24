$(document).ready(function(){
    $('#findPlaceBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"findConstraint",
            data:{"gatArea1":$('#gatArea1').val(),
                "state":$('#state').val(),
                "category":$('#category').val(),
                "maxPerson":$('#maxPerson').val()},
            dataType:'json',
            async: false,
            success:function(result){
                if(result != ""){
                    var space = result;
                    // alert(Object.keys(space).length);
                    console.log(space);
                    $('#gallerylist').empty();

                    for(var i = 0; i < Object.keys(space).length; i++){
                    $('#gallerylist').append('<span class="gallerylistBox" id="gallerylistBox">');
                    alert(space[i].spaceNo);
                            $('#gallerylistBox').append('<a id="card-link" href="' + '/detailViewSpace/' + space[i].spaceNo + '"'  + '>');
                                $('#card-link').append('<div class="card">');
                                $('.card').append('<div class="card-header">');
                                $('.card-header').append('<div class="card-header-is_closed">');
                                $('.card-header-is_closed').append('<div class="card-header-text">');
                            $.ajax({
                                type:"post",
                                url:"constraintCtg", // @RestController로 요청
                                dataType: 'json',
                                async: false,
                                success:function(result_name){
                                    var spaceCtgName = result_name;
                                    for(var j = 0; j < 1; j++) {
                                        $('.card-header-text').append(spaceCtgName[j].spaceCtgName);
                                        $('.card-header-is_closed').append('</div>');// card-header-text 닫힘
                                    }
                                },
                                error:function(data, textStatus){
                                    alert("카테고리 이름 추출 실패");
                                }
                            }); // 카테고리 이름 뽑는 ajax 끝
                            $('.card-header-is_closed').append('<div class="card-header-number"></div>' + '</div>'); // card-header-number 닫힘
                            $('.card-header').append('</div>'); // card-header-is_closed 닫힘
                            $('.card').append('</div>');// card-header 닫힘
                            $('.card').append('<div class="card-body">');
                            $('.card-body').append('<div class="card-body-header">');
                            $('.card-body-header').append('<h1>' + space[i].spaceTitle + '</h1>' +
                                                            '<p class="card-body-hashtag">' + space[i].spaceArea + '</p>' +
                                                            '<p class="card-body-nickname">' + '최대' + space[i].spacePerMax + '인' + '</p>');
                            $('.card-body').append('</div>'); // card-body-header 닫음
                            $('.card-body').append('<p class="card-body-description">' + space[i].spacePrice1 + '<span>' + '/비수기' + '</span>' + '<br>' + space[i].spacePrice2 + '<span>' + '/성수기' + '</span>' + '</p>');
                            $('.card-body').append('<div class="card-body-footer">');
                            $('.card-body-footer').append('<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">' + '<i class="icon icon-view_count"></i>' + '<i class="icon icon-comments_count"></i>' + '<i class="reg_date"></i>')
                            $('.card-body').append('</div>'); // card-body-footer 닫음
                            $('.card').append('</div>'); // card-body 닫음
                            $('#card-link').append('</div>'); // card 닫음
                            $('#gallerylistBox').append('</a>'); // a 태그 (card-link) 닫음
                    $('#gallerylist').append('</span>');
                    }
                }
                else {
                    $('#gallerylist').empty();
                    $('#gallerylist').css({"margin-left" : "0 !important"});
                    $('#gallerylist').append('<span id="notFound" style="margin: 0 !important;">');
                    $('#gallerylist').append('<p style="font-weight: bold; color:#474646 ;font-size: 64px; padding: 20px; margin: 20px;">검색 결과가 없습니다.</p>');
                    $('#gallerylist').append('</span>');

                }
            },
            error:function(data, textStatus){
                alert("조건을 정확하게 입력해 주세요.");
            }
        });
    });
});