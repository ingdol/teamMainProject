package com.boot.teamMainProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.teamMainProject.service.ChattingService;
import com.boot.teamMainProject.service.GatheringService;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class ChattingController {
	@Autowired
	MemberService service;
	
	@Autowired
	GatheringService Gatherservice;
	
	@Autowired
	ChattingService ChatService;
	
//	@RequestMapping("/testSej/{memId}/{gatNo}")
//	public String detailViewMember(@PathVariable String memId, @PathVariable String gatNo, Model model) {
//		MemberVO mem = service.detailViewMember(memId); // 상세 회원 조회 메소드 그대로 사용
//		model.addAttribute("mem", mem);
//		
//		ChattingVO chat = ChatService.detailChatting(gatNo);
//		model.addAttribute("chat", chat);
//
//		return "/sej/searchTest";
//	}
	
	@RequestMapping("/testSearch")
	public String main() {
		return "/sej/searchTest";
	}
}
