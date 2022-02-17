package com.boot.teamMainProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.teamMainProject.service.ChatbotService;

@Controller
public class APIController {
	

	@Autowired
	private ChatbotService chatService;
	
	// 챗봇 : 질문 메시지 전송하고 결과 받아서 출력
//	@RequestMapping("/chatbot")
//	public void chatbot() {
//		String result = chatService.main("어떤 모임인가요?");
//		System.out.println(result);
//	}
	
	@RequestMapping("/chatbotForm")
	public String chatbotForm() {
		return "/sej/chatForm";
	}
	
		
		
}
