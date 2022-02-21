/**
 * chatbot3.js
 */
 
 $(function(){
	// 웰컴 메시지를 받기 위해서 message 입력받기 전에
	// 빈 값으로 서버에 전송하고 웰컴 메시지를 받기 위해
	// $.ajax()를 별도의 함수로 분리해서 호출
	callAjax(); //매시지 입력하지 않고 호출해서 빈값 전송 -> open event -> 웰컴 메시지 출력
	
	/////////////////////////////////////////////////////////
	// 음성으로 질문하기
	
	//(1) 녹음 기능
	const record = document.getElementById("record");
    const stop = document.getElementById("stop");
    const soundClips = document.getElementById("sound-clips");

    const audioCtx = new(window.AudioContext || window.webkitAudioContext)(); // 오디오 컨텍스트 정의

    if (navigator.mediaDevices) {
        var constraints = {
            audio: true
        }
         let chunks = [];

        navigator.mediaDevices.getUserMedia(constraints)
            .then(stream => {
                const  mediaRecorder = new MediaRecorder(stream);
          
                record.onclick = () => {
                    mediaRecorder.start();
                    record.style.background = "red";
                    record.style.color = "black";
                }

                stop.onclick = () => {//정지 버튼 클릭 시
                    mediaRecorder.stop();//녹음 정지                       
                    record.style.background = "";
                    record.style.color = "";
                }
                
                mediaRecorder.onstop = e => {                        
                    
                    const clipName = "voiceMsg";
					//태그 3개 생성
                    const clipContainer = document.createElement('article');                     
                    const audio = document.createElement('audio');
                    const a = document.createElement('a');
					                       
                    clipContainer.appendChild(a);
                    soundClips.appendChild(clipContainer);                        
					
                    //chunks에 저장된 녹음 데이터를 audio 양식으로 설정
                    //audio.controls = true;
                    const blob = new Blob(chunks, {
                        'type': 'audio/mp3 codecs=opus'
                    }) ;
                    chunks = [];
                    const audioURL = URL.createObjectURL(blob);
                   // audio.src = audioURL;                       
                   //blob:http://localhost:8011/6377d19d-2ca8-49b1-a37f-068d602ceb60    
                    a.href=audioURL;                    
                    a.download = clipName;                      
                   //a.innerHTML = "DOWN"
					a.click(); // 다운로드 폴더에 저장하도록 클릭 이벤트 발생			
					
                    fileUpload(blob, clipName);
                   
                }//mediaRecorder.onstop

                //녹음 시작시킨 상태가 되면 chunks에 녹음 데이터를 저장하라 
                mediaRecorder.ondataavailable = e => {
                    chunks.push(e.data)
                }
                
                
            })
            .catch(err => {
                console.log('The following error occurred: ' + err)
            })
    }        
	
	
	// (2) 파일 업로드 기능
    // 서버에 업로드
    function fileUpload(blob, clipName){	    
	
		var formData = new FormData();
		formData.append('uploadFile', blob, clipName+".mp3");
					  
    	//녹음된 mp3파일 전송하고 반환된 텍스트(result)를 챗봇 서버에 전달
    	$.ajax({    		
			type:"post",	
			enctype: 'multipart/form-data',
			url: "clovaSTT", //통신할 url		
			data: formData, //전송할 데이타	: 파일명 :voiceMsg.mp3
			processData: false,
    		contentType: false,
			success: function(result) {
				$('#chatBox').append('<div class="msgBox send"><span id="in"><span>' + 
											  result + '</span></span></div><br>'); 
			
				// 챗봇에게 전달
			    $('#message').val(result);
				callAjax(); 
				$('#message').val('');	
			},
			error: function(e) {
				alert("에러가 발생했습니다 : " + e);
			}
		});
	
    }		
	
	
	/////////////////////////////////////////////////////////
	
	
	// 챗봇에게 질문하고 응답받기 - 텍스트 응답
	// message 입력하고 전송 버튼 눌렀을 때
	$('#chatForm').on('submit', function(event){
		event.preventDefault();
		
		// 메시지 입력하지 않고 [전송] 버튼 누른 경우 (웰컴 메시지 출력되지 않도록)
		if ($('#message').val() == ""){
			alert("질문을 입력하세요");
			return false;
		}		
		
		/* chatBox에 보낸 메시지 추가 */
		if($('#message').val() != ""){
			$('#chatBox').append('<div class="msgBox send"><span id="in"><span>' + 
												$('#message').val() + '</span></span></div><br>');
		}
		
		callAjax(); // 입력된 값 전송
		
		/* 입력란 비우기*/
		$('#message').val('');
	});	// submit 끝
	
	// $.ajax()를 별도의 함수로 분리
	function callAjax(){
		$.ajax({
			url:"chatbotCall",
			type:"post",
			data:{message: $('#message').val()},		
			success:function(result){				
				/* chatBox에 받은 메시지 추가 */
				$('#chatBox').append('<div class="msgBox receive"><span id="in"><span>챗봇</span><br><span>' + 
														   result +'</span></span></div><br><br>'); 								   
				// 스크롤해서 올리기										   
				$("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));		
				
			},
			error:function(){
				alert("오류가 발생했습니다.")
			}
		});
	}
	
});







