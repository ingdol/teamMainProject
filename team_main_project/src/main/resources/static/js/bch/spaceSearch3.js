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
                    console.log(space);
                    $('#gallerylistBox').empty();
                    alert(Object.keys(space).length);
                    for(var i = 0; i < Object.keys(space).length; i++){
                        var item = $('.card-link-R').clone();
                        $(item).find('.card-body-header-title').html(space[i].spaceTitle);
                        $(item).find('.card-body-hashtag').html(space[i].spaceArea);
                        $(item).find('.card-body-nickname').html('최대 ' + space[i].spacePerMax + '인');
                        $(item).find('.card-body-description').html(space[i].spacePrice1 + '<span>/비수기</span><br>' + space[i].spacePrice2 + '<span>/성수기</span></p>');
                            $.ajax({
                                type:"post",
                                url:"constraintCtg", // @RestController로 요청
                                dataType: 'json',
                                async: false,
                                success:function(result_name){
                                    var spaceCtgName = result_name;
                                    for(var j = 0; j < 1; j++) {
                                        $(item).find(".card-header-text").html(spaceCtgName[j].spaceCtgName);
                                    }
                                },
                                error:function(data, textStatus){
                                    alert("카테고리 이름 추출 실패");
                                }
                            }); // 카테고리 이름 뽑는 ajax 끝
                    $(item).css({'display': 'inline'});
                    $('#gallerylistBox').append(item);
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