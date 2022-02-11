package com.boot.teamMainProject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.IMemberService;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class MainController {
	
	// index 페이지로 이동
	@RequestMapping("/")
	public String index() {
//		int a = 1;
		return "index";
	}
	

	//ldh(아직 안추가함)

	// 메인 페이지로 이동
	@RequestMapping("/main")
	public String main() {
		return "/sej/main";
	}
	
	//서연
	@RequestMapping("/sun/mapsearch")
	public String mapsearch() {
		return "/sun/mapsearch";

	}
}