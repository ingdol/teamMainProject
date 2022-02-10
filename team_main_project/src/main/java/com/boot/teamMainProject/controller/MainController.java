package com.boot.teamMainProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	// index 페이지로 이동
	@RequestMapping("/")
	public String index() {
		int a = 1;
		return "index";
	}
	
	// 메인 페이지로 이동
	@RequestMapping("/main")
	public String main() {
		return "/sej/main";
	}
}