/**
 * 
 */
 
 
$(document).ready(function(){ 
  var fileTarget = $('#file'); 
  fileTarget.on('change', function(){ // 값이 변경되면
      var cur=$(".filebox input[type='file']").val();
    $(".upload-name").val(cur);
  }); 
});

$(document).ready(function(){ 
  var fileTarget2 = $('#file2'); 
  fileTarget2.on('change', function(){ // 값이 변경되면
      var cur2=$(".filebox2 input[type='file']").val();
    $(".upload-name2").val(cur2);
  }); 
});

$(document).ready(function(){ 
  var fileTarget3 = $('#file3'); 
  fileTarget3.on('change', function(){ // 값이 변경되면
      var cur3=$(".filebox3 input[type='file']").val();
    $(".upload-name").val(cur3);
  }); 
});

$(document).ready(function(){ 
  var fileTarget4 = $('#file4'); 
  fileTarget4.on('change', function(){ // 값이 변경되면
      var cur4=$(".filebox4 input[type='file']").val();
    $(".upload-name2").val(cur4);
  }); 
});

$(document).ready(function(){ 
  var fileTarget5 = $('#file5'); 
  fileTarget5.on('change', function(){ // 값이 변경되면
      var cur5=$(".filebox5 input[type='file']").val();
    $(".upload-name").val(cur5);
  }); 
});

$(document).ready(function(){ 
  var fileTarget6 = $('#file6'); 
  fileTarget6.on('change', function(){ // 값이 변경되면
      var cur6=$(".filebox6 input[type='file']").val();
    $(".upload-name").val(cur6);
  }); 
});