$(document).ready(function(){

   $('#date').change(function (){
      $('#time').val("");
      $('#time2').val("");
   });

   $('#time').change(function (){
      var date = $('#date').val();
      if(date == "" || date == null) {
         alert("날짜 먼저 선택해 주세요.");
         $('#time').val("");
         $('#date').focus();
      }
   });

   $('#time2').change(function (){
      var time = $('#time').val();
      var time2 = $('#time2').val();
      if(time == "" || time == null) {
         alert("시작 시간 먼저 선택해 주세요.");
         $('#time2').val("");
         $('#time').focus();
      }
      else if(time >= time2){
         alert("시간 입력이 올바르지 않습니다.");
         $('#time2').val("");
         $('#time2').focus();
      }
      else {
         event.preventDefault();
         $.ajax({
            type:"post",
            url:"/CheckReservationTime",
            data:{"spaceNo":$('#no').val(),
                  "spaceDate":$('#date').val(),
                  "spaceStartTime":$('#time').val(),
                  "spaceEndTime":$('#time2').val(),
            },
            dataType: "json",
            success:function(result){
               alert(result);
               console.log(result);
               var date = new Date();
               if(result != "") {
                  var reservation = result;
                  for(var i = 0; i < Object.keys(reservation).length; i++) {
                     alert(reservation[i].spaceReserDate.date.toLocaleString() + "\n" + reservation[i].spaceReserStartTime.date.toLocaleString() + "\n" + reservation[i].spaceReserEndTime.date.toLocaleString());
                  }
               }
            },
            error:function(data, textStatus, result){

            }
         }); // ajax 끝
      } // else 끝
   });
});



