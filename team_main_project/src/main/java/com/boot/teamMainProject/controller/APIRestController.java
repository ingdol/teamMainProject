package com.boot.teamMainProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.boot.teamMainProject.service.ChatbotService;

@RestController
public class APIRestController {
	
	@Autowired
	private ChatbotService chatService;
	
	@RequestMapping("/chatbotCall")
	public String  chatbotCall(@RequestParam("message") String message ) {
		String result = chatService.main(message);
		return result;
	}

	
//	@RequestMapping("/chatbotTTS")
//	public String  chatbotTTS(@RequestParam("message") String message ) {
//		String result = ttsService.chatbotTextToSpeech(message);
//		return result;  // voiceFileName;  // 저장된 음성 파일명 반환
//	}
//	
//	@RequestMapping("/chatbotCallImgLink")
//	public String  chatbotCallImgLink(@RequestParam("message") String message ) {
//		String result = chatService.imgLinkMainService(message);
//		return result; // JSON 형태의 결과를 그대로 ajax로 응답으로 전송
//	}
}
