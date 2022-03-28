/**
 * chatbot4.js
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
                    record.style.background = "#878bff";
                    /*record.style.color = "black";*/
                }

                stop.onclick = () => {//정지 버튼 클릭 시
                    mediaRecorder.stop();//녹음 정지                       
                    record.style.background = "";
                   /* record.style.color = "";*/
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
				$('#chatBox').append('<div class="msgBox send"><span id="in"><span id="msgInputBox">' + 
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
			$('#chatBox').append('<div class="msgBox send"><span id="in"><span id="msgInputBox">' + 
												$('#message').val() + '</span></span></div><br>');
		}
		
		callAjax(); // 입력된 값 전송
		
		/* 입력란 비우기*/
		$('#message').val('');
	});	// submit 끝
	
	// $.ajax()를 별도의 함수로 분리
	function callAjax(){
		$.ajax({
            type:"post",            
            url:"chatbotCallImgLink",
            data:{message : $('#message').val()},
            dataType :'json',
            success:function (result){
				//JSON 형식 그대로 반환 받음
				var bubbles = result.bubbles;
				for(var b in bubbles){
					if(bubbles[b].type == 'text'){ // 기본 답변인 경우
						/* chatBox에 받은 메시지 추가 */
							$('#chatBox').append('<div class="msgBox receive"><span id="in"><span id="msgOwner">Daily&Linker</span><br><span id="msgOwnBox">' + 
															   bubbles[b].data.description +'</span></span></div><br><br>'); 
															   
						// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
						callAjaxTTS(bubbles[b].data.description);										   
					}	else if(bubbles[b].type == 'template'){//이미지 답변 또는 멀티링크 답변 시작
						if(bubbles[b].data.cover.type=="image"){//이미지 이면
							$("#chatBox").append("<div class='msgBox receive'><span id='in'><span id='msgOwner'>Daily&Linker</span><br><span id='msgOwnBox'>" + bubbles[b].data.cover.data.description+ "</span></span></div><br><br>");	
								// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출
							$("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
																		 "' alt='이미지 없음' id='chatImage'>");
								callAjaxTTS(bubbles[b].data.cover.data.description);	
								if(bubbles[b].data.contentTable == null){
								$("#chatBox").append
								("<div id='chatUrl' ><a href='"+bubbles[b].data.cover.data.action.data.url+"' target='_blank'>" + 
										bubbles[b].data.cover.data.action.data.url+ "</a></div><br><br>");		
																   
								callAjaxTTS(bubbles[b].data.cover.data.description);							
							} else {
								$("#chatBox").append("<div class='msgBox receive'><span id='in'><span id='msgOwner'>Daily&Linker</span><br><span id='msgOwnBox'>" + bubbles[b].data.cover.data.description+ "</span></span></div><br><br>");	
								// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
								callAjaxTTS(bubbles[b].data.cover.data.description);										
							}
						} 	else if(bubbles[b].data.cover.type=="text"){//멀티링크 답변이면
							$("#chatBox").append("<div class='msgBox receive'><span id='in'><span id='msgOwner'>Daily&Linker</span><br><span id='msgOwnBox'>" + bubbles[b].data.cover.data.description+ "</span></span></div><br><br>");
							// 챗봇으로 부터 받은 텍스트 답변을 음성으로 변환하기 위해 TTS 호출									   
							callAjaxTTS(bubbles[b].data.cover.data.description);	
						}
						
						// 이미지 / 멀티링크 답변 공통 (contentTable 포함)
						for(var ct in bubbles[b].data.contentTable){
							var ct_data = bubbles[ct].data.contentTable[ct];
							for(var ct_d in ct_data){
								$("#chatBox").append
								("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'>" + 
									ct_data[ct_d].data.data.action.data.url+ "</a><br><br>");
						    }
					    }// contentTable for문 끝
				    }//template 끝			
				}//bubbles for문 종료
				
				// 스크롤해서 올리기										   
				$("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));	
						
            },
            error:function(data){
               alert("오류가 발생했습니다.");				
            }
       });
	}
	
	
	function callAjaxTTS(result){
		console.log(result);
		$.ajax({
            type:"post",            
            url:"chatbotTTS",
            data:{message : result},
            dataType :'text',
            success:function (result){ //음성 파일 이름 받음
				/* chatBox에 받은 음성 메시지 플레이 */
				$('audio').prop("src", '/voice/'+ result)[0].play();
				$('audio').hide();
            },
            error:function(data){
               alert("에러 발생");				
            }
       });
	}
});







