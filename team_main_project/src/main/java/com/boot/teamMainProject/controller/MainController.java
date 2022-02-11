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
<<<<<<< Updated upstream
	
	// pdh 로그인
	
	@Autowired
	MemberService service;
	
	@Autowired
	IMemberService iMemberService;
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET})
	public String home() {

		return "pdh/login";
	}
	
	@RequestMapping(value = "/signin")
	public String signUp(@RequestBody HashMap<String, String> map, MemberVO vo) {

		// System.out.println(map);
		
		vo.setMemId(map.get("id"));
		vo.setMemPw(map.get("pw"));
		service.signIn(vo);

		return "redirect:/";
	}
	

	
	//ldh(아직 안추가함)
	@RequestMapping("/ldh/SomoimboardWrite")
	public String SomoimboardWrite() {
		return "/ldh/SomoimboardWrite";

	}
	@RequestMapping("/ldh/Somoimboard")
	public String Somoimboard() {
		return "/ldh/Somoimboard";

	}
	

	@RequestMapping("/sun/hobbysearch")
	public String hobbysearch() {
		return "/sun/hobbysearch";
	}
	
	@RequestMapping("/sun/allmoim")
	public String allmoim() {
		return "/sun/allmoim";
	}
	
	@RequestMapping("/sun/detailgat")
	public String detailgat() {
		return "/sun/detailgat";
	}
	
	@RequestMapping("/sun/commumain")
	public String commumain() {
		return "/sun/commumain";
	}
	
=======
>>>>>>> Stashed changes
}