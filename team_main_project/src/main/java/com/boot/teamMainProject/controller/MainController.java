
package com.boot.teamMainProject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.model.HobbyCtgVO;
import com.boot.teamMainProject.service.ClassService;
import com.boot.teamMainProject.service.GatheringService;
import com.boot.teamMainProject.service.HobbyCtgService;

@Controller
public class MainController {

	//------사용할 서비스-------------
	//--서연---
	@Autowired
	GatheringService gatherser;
	@Autowired
	ClassService classser;
	@Autowired
	HobbyCtgService ctgser;
//---------------------------
//---------컨트롤러코드부분----------


//	// 메인 페이지로 이동
//	@RequestMapping("/")
//	public String index() {
//		return "/sej/main";
//	}

	//ldh(아직 안추가함)

	// 메인 페이지로 이동
	@RequestMapping("/main")
	public String main() {
		return "/sej/main";
	}


	//--------------------------
	// 서연
	//**각 화면페이지
	@RequestMapping("/sun/mapsearch")
	public String mapsearch() {
		return "/sun/mapsearch";
	}
	@RequestMapping("/sun/detailgat")
	public String detailgat() {
		return "/sun/detailgat";
	}
	
	


	//**관심사카테고리에서 특정카테고리클릭시 해당카테고리 전체모임,클래스 나타내기	
		@RequestMapping("/sun/allmoim/{hobbyNo}")
		public String showlist(@PathVariable String hobbyNo, Model model) {
			ArrayList<GatheringVO> gatheringResult = gatherser.showlist(hobbyNo);
			ArrayList<ClassVO> classResult = classser.listClass(hobbyNo);
			ArrayList<HobbyCtgVO> ctg = ctgser.ctgall();
			
			model.addAttribute("gatheringResult",gatheringResult);
			model.addAttribute("classResult",classResult);
			model.addAttribute("ctg",ctg);
			return "/sun/allmoim";
		}
	//---------------------------------

	@RequestMapping("/ldh/SomoimboardWrite")
	public String SomoimboardWrite() {
		return "/ldh/SomoimboardWrite";
	}

	@RequestMapping("/ldh/Somoimboard")
	public String Somoimboard() {
		return "/ldh/Somoimboard";
	}
	
	@RequestMapping("/ldh/SomoimCreate")
	public String SomoimCreate() {
		return "/ldh/SomoimCreate";
	}
	

	//---------------------------------

	// pdh 로그인
//
//	@Autowired
//	MemberService service;
//
//	@Autowired
//	IMemberService iMemberService;
//
//	@RequestMapping(value = "/login", method = {RequestMethod.GET})
//	public String home() {
//
//		return "pdh/login";
//	}
//
////	@RequestMapping(value = "/signin")
//	public String signUp(@RequestBody HashMap<String, String> map, MemberVO vo) {
//
//		// System.out.println(map);
//
//		vo.setMemId(map.get("id"));
//		vo.setMemPw(map.get("pw"));
//		service.signIn(vo);
//
//		return "redirect:/";
//	}
}