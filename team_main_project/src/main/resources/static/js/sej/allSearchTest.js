$(function(){
	$('.chatInfo').hide();
	$('.chatTime').hide();
	$('.chatArea').hide();
	
	/*메뉴 누르면 게시판 보이도록*/
	$(".chat1").on('click',function(){
		msg = $("#chatInfo").val()
		$('.chatInfo').show();
		$('.chatTime').hide();
		$('.chatArea').hide();
		$("#chating").append("<p class='me'>" +"모임소개"+ "</p>");	
		$("#chating").append("<p class='othersText'>" + "개설자"+ " </p><p class='othersBox'>" + msg + "</p>");
	});
	
	$(".chat2").on('click',function(){
		msg = $("#chatTime").val()
		$('.chatInfo').hide();
		$('.chatTime').show();
		$('.chatArea').hide();
		$("#chating").append("<p class='me'>" +"모임시간"+ "</p>");	
		$("#chating").append("<p class='othersText'>" + "개설자"+ " </p><p class='othersBox'>" + msg + "</p>");
	});
	
	$(".chat3").on('click',function(){
		msg = $("#chatArea").val()
		$('.chatInfo').hide();
		$('.chatTime').hide();
		$('.chatArea').show();
		$("#chating").append("<p class='me'>" +"모임장소"+ "</p>");	
		$("#chating").append("<p class='othersText'>" + "개설자"+ " </p><p class='othersBox'>" + msg + "</p>");
	});
});

var ws;

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='othersText'>" + d.userName + " </p><p class='othersBox'>" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}