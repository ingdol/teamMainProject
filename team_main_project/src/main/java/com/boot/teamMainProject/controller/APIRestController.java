package com.boot.teamMainProject.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.boot.teamMainProject.service.ChatbotService;
import com.boot.teamMainProject.service.STTService;
import com.boot.teamMainProject.service.TTSService;

@RestController
public class APIRestController {
	
	@Autowired
	private ChatbotService chatService;

	@Autowired
	private STTService sttService;
	
	@Autowired
	private TTSService ttsService;
	
	@RequestMapping("/chatbotCall")
	public String  chatbotCall(@RequestParam("message") String message ) {
		String result = chatService.main(message);
		return result;
	}
	
	@RequestMapping("/clovaSTT")
	public String  clovaSTT(@RequestParam("uploadFile") MultipartFile file) {		
		
		String result = "";
		
		try {
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
			/* String uploadPath = "c:/upload/"; */
			String uploadPath = "/voice/";
			
			// 2. 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();
			String filePathName = uploadPath + originalFileName;
			
			// 3. 파일 생성
			File file1 = new File(filePathName);
			
			// 4. 서버로 전송
			file.transferTo(file1);				
			
			// 서비스에 파일 path와 파일명 전달  -> 서비스 메소드에서 변경
			// 서비스에서 반환된 PoseVO 리스트 저장
			result = sttService.clovaSpeechToText(filePathName);			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	
	@RequestMapping("/chatbotTTS")
	public String  chatbotTTS(@RequestParam("message") String message ) {
		String result = ttsService.chatbotTextToSpeech(message);
		return result;  // voiceFileName;  // 저장된 음성 파일명 반환
	}
	
	@RequestMapping("/chatbotCallImgLink")
	public String  chatbotCallImgLink(@RequestParam("message") String message ) {
		String result = chatService.imgLinkMainService(message);
		return result; // JSON 형태의 결과를 그대로 ajax로 응답으로 전송
	}
}
