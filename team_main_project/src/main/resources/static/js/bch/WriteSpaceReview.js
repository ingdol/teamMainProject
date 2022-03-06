$(document).ready(function() {
    $("#FileList").on('change', function () {
        var fileName = $("#FileList").val();
        $(".upload-name").val(fileName);
        for(var i = 0; i < $('#FileList')[0].files.length; i++) {
            console.log($('#FileList').get(0).files[i].name);
        }
    });
})