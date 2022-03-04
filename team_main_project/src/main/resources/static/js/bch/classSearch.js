$(document).ready(function(){
    function formatDate(date) {

        var d = new Date(date),

            month = '' + (d.getMonth() + 1) ,
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');

    }
    $('#findPlaceBtn').on('click', function(){
        event.preventDefault();

        $.ajax({
            type:"post",
            url:"findConstraintClass",
            data:{"gatArea1":$('#gatArea1').val(),
                "state":$('#state').val(),
                "category":$('#category').val()
            },
            dataType:'json',
            async: false,
            success:function(result){
                if(result != ""){
                    var classList = result;

                    console.log(classList);
                    $('#gallerylistBox').empty(); // 비우기
                    for(var i = 0; i < Object.keys(classList).length; i++){
                        var item = $('#gallerylistBoxTemp > .card-link-R').clone(); // 복사
                        item.attr('href', "/detailViewClass/" + classList[i].classNo);
                        $(item).find('#card-image-R').html();
                        $(item).find('#card-image-R').attr('src', "/images/" + classList[i].classPhoto);
                        $(item).find('.card-header-text').html(classList[i].classArea);
                        $(item).find('.card-body-header-title').html(classList[i].classTitle);
                        $(item).find('.card-body-description').html('<span>오픈 : </span>' + formatDate(classList[i].classOpen));
                        $(item).find('.reg_date').html('Hate ' + classList[i].classHate);
                        $(item).css({'display': 'inline'});
                        $('#gallerylistBox').append(item);
                    }

                }
                else {
                    $('#gallerylistBox').empty();
                    $('#gallerylistBox').css({"margin-left" : "0 !important"});
                    $('#gallerylistBox').append('<span id="notFound" style="margin: 0 !important;">');
                    $('#gallerylistBox').append('<p style="font-weight: bold; color:#474646 ;font-size: 64px; padding: 20px; margin: 20px;">검색 결과가 없습니다.</p>');
                    $('#gallerylistBox').append('</span>');

                }
            },
            error:function(data, textStatus){
                alert("조건을 정확하게 입력해 주세요.");
            }
        });
    });
});