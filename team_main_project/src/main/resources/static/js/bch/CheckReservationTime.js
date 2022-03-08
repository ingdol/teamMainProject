$(document).ready(function(){
   function CalDiffTime(start, end) {
      var start = new Date(start);
      var end = new Date(end);
      var diffTime = (end.getTime() - start.getTime()) / (1000*60);
      alert(diffTime);
   }
   $('#date').change(function (){
      $('#time').val("");
      $('#time2').val("");
      // $('#ReservationBtn').css("display", "none");
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
               console.log(result);
                  var reservation = result;
                  for(var i = 0; i < Object.keys(reservation).length; i++) {
                     if(reservation[i].spaceReserDate == $('#date').val()) { // 날짜 비교 if문
                        if( reservation[i].spaceReserStartTime <= $('#time').val() && reservation[i].spaceReserEndTime >= $('#time').val() ) { // 예약 할 시작 시간이 이미 예약된 시작 시간보다 클 때 && 예약 할 시작 시간이 이미 예약 된 종료 시간보다 작을 때
                           alert(reservation[i].spaceReserStartTime + "부터 " + reservation[i].spaceReserEndTime + "까지는 예약이 불가능 합니다.");
                           $('#time').val("");
                           $('#time2').val("");
                           // $('#ReservationBtn').css("display", "none");
                        } // (예약 할 시간이 이미 예약된 시간 사이에 있을 때)
                        else if( reservation[i].spaceReserStartTime >= $('#time').val() && reservation[i].spaceReserStartTime <= $('#time2').val() ) { // 예약 할 시작 시간이 이미 예약된 시간보다 작을 때 && 예약 할 종료 시간이 이미 예약 된 시작 시간보다 클 때
                           alert(reservation[i].spaceReserStartTime + "부터 " + reservation[i].spaceReserEndTime + "까지는 예약이 불가능 합니다.");
                           $('#time').val("");
                           $('#time2').val("");
                           // $('#ReservationBtn').css("display", "none");
                        } // (시작 시간은 맞지만 종료 시간이 문제인 경우)
                        else {
                           // $('#ReservationBtn').css("display", "inline");
                        }
                     }
                     else {
                        // $('#ReservationBtn').css("display", "inline");
                     }
                  }
            },
            error:function(data, textStatus, result){
               alert("error!");
            }
         }); // ajax 끝
      } // else 끝
   });
   $('#ReservationBtn').on('click', function () {
      var Nick = $('#memNick').val();
      if (Nick == "null") {
         alert("회원만 이용 가능합니다.\n로그인 해주세요.");
         window.location.replace('/login');
      }
      else {
         $.ajax({
            type:"post",
            url:"/ReservationComp", // @RestController로 요청
            data:{"date":$('#date').val(),
               "time":$('#time').val(),
               "time2":$('#time2').val(),
               "memNick":$('#memNick').val(),
               "spacePrice":$('#spacePrice').val(),
               "spaceNo":$('#spaceNo').val(),
               "spaceTitle":$('#spaceTitle2').val()
            },
            async: false,
            success:function(result_name){
               alert("예약이 완료되었습니다!");
               window.location.replace('/');
            },
            error:function(data, textStatus){
               alert("예약에 실패했습니다.\n예약 정보를 정확하게 입력해 주세요.");
               // window.location.replace('/login');
            }
         });
      }
   }); // 예약하기 버튼
});



