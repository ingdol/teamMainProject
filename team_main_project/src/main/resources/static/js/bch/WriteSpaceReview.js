$(document).ready(function() {
    $("#files").on('change', function () {
        var fileName = $("#files").val();
        $(".upload-name").val(fileName);
        for(var i = 0; i < $('#files')[0].files.length; i++) {
            console.log($('#files').get(0).files[i].name);
        }
    });
})