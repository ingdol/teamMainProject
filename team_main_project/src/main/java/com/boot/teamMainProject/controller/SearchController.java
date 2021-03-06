package com.boot.teamMainProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.ClassService;
import com.boot.teamMainProject.service.GatheringService;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class SearchController {
	@Autowired
	GatheringService Gatherservice;
	
	@Autowired
	ClassService service;
	
	@Autowired
	MemberService memService;
	
	// 테스트
//	@RequestMapping("/chatBtn")
//	public String chatBtn() {
//		return "/sej/chatBtn";
//	}
	
//	// 멤버 조회 리스트로 이동
//	@RequestMapping("/gatherList")
//	public String gatherListForm() {
//		return "/sej/gatheringList";
//	}
	
	
	 //메인페이지 - 베스트 모임 클래스. 신규 모임 클래스 DB 연결
	// @ResponseBody
	@RequestMapping("/")
	public String listAllGatherBest(Model model) {
		ArrayList<GatheringVO> gatListBest = Gatherservice.listAllGatherBest();
		ArrayList<GatheringVO> gatListNew = Gatherservice.listAllGatherNew();
		ArrayList<ClassVO> classListBest = service.listAllClassBest();
		ArrayList<ClassVO> classListNew = service.listAllClassNew();
		model.addAttribute("gatListBest", gatListBest);
		model.addAttribute("gatListNew", gatListNew);
		model.addAttribute("classListBest", classListBest);
		model.addAttribute("classListNew", classListNew);
		return "sej/main";
	}
	
	@RequestMapping("/chatWindow")
	public String listAllGatherBest2(HttpSession session, Model model) {
		// 로그인 정보 가져오기
		String sid = (String) session.getAttribute("sid");
		MemberVO mem = memService.detailViewMember(sid);
		System.out.println(mem);
		if (mem == null) {
			System.out.println("null");
		} else {
			// 회원이 가입한 모임 받아와서
			String gatNo1 = mem.getGatJoinNo1();
			String gatNo2 = mem.getGatJoinNo2();
			String gatNo3 = mem.getGatJoinNo3();
			String gatNo4 = mem.getGatJoinNo4();
			String gatNo5 = mem.getGatJoinNo5();
			// 회원이 가입한 모임 = gatNo로 대입 -> gatNo의 상세 내용 검색
			GatheringVO gatV1 = Gatherservice.detailViewGatNo(gatNo1);
			GatheringVO gatV2 = Gatherservice.detailViewGatNo(gatNo2);
			GatheringVO gatV3 = Gatherservice.detailViewGatNo(gatNo3);
			GatheringVO gatV4 = Gatherservice.detailViewGatNo(gatNo4);
			GatheringVO gatV5 = Gatherservice.detailViewGatNo(gatNo5);
			// 밑에 모델을 jsp에서 사용
			model.addAttribute("gatV1", gatV1);
			model.addAttribute("gatV2", gatV2);
			model.addAttribute("gatV3", gatV3);
			model.addAttribute("gatV4", gatV4);
			model.addAttribute("gatV5", gatV5);
		}
		model.addAttribute("mem", mem);
		return "/sej/chatList";
	}
	
	
//	@RequestMapping("/")
//	public String mainChatList(HttpSession session, Model model) {
//		String sid = (String) session.getAttribute("sid");
//		MemberVO mem = memService.detailViewMember(sid);
//		String gatNo1 = mem.getGatJoinNo1();
//		String gatNo2 = mem.getGatJoinNo2();
//		String gatNo3 = mem.getGatJoinNo3();
//		String gatNo4 = mem.getGatJoinNo4();
//		String gatNo5 = mem.getGatJoinNo5();
//		GatheringVO gatV1 = Gatherservice.detailViewGatNo(gatNo1);
//		GatheringVO gatV2 = Gatherservice.detailViewGatNo(gatNo2);
//		GatheringVO gatV3 = Gatherservice.detailViewGatNo(gatNo3);
//		GatheringVO gatV4 = Gatherservice.detailViewGatNo(gatNo4);
//		GatheringVO gatV5 = Gatherservice.detailViewGatNo(gatNo5);
//		ArrayList<GatheringVO> gatListBest = Gatherservice.listAllGatherBest();
//		ArrayList<GatheringVO> gatListNew = Gatherservice.listAllGatherNew();
//		ArrayList<ClassVO> classListBest = service.listAllClassBest();
//		ArrayList<ClassVO> classListNew = service.listAllClassNew();
//		model.addAttribute("mem", mem);
//		model.addAttribute("gatV1", gatV1);
//		model.addAttribute("gatV2", gatV2);
//		model.addAttribute("gatV3", gatV3);
//		model.addAttribute("gatV4", gatV4);
//		model.addAttribute("gatV5", gatV5);
//		model.addAttribute("gatListBest", gatListBest);
//		model.addAttribute("gatListNew", gatListNew);
//		model.addAttribute("classListBest", classListBest);
//		model.addAttribute("classListNew", classListNew);
//		return "/sej/main";
//	}
	
	
	
	// 회원 검색 폼로 이동
	@RequestMapping("/search")
	public String memberSearchForm() {
		return "/sej/allSearch";
	}
	
	
	@RequestMapping("/gatherSearch")
	public String gatherSearch(@RequestParam HashMap<String, Object> param, 
																				Model model){
		ArrayList<GatheringVO> gatSearchList = Gatherservice.gatherSearch(param);
		ArrayList<ClassVO> classSearchList = service.classSearch(param);
		model.addAttribute("gatSearchList", gatSearchList);			
		model.addAttribute("classSearchList", classSearchList);			

		return "sej/searchFormResult"; // 뷰 페이지 반환
	}
	
	
}
