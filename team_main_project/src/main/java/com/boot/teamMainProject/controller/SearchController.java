package com.boot.teamMainProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.service.ClassService;
import com.boot.teamMainProject.service.GatheringService;

@Controller
public class SearchController {
	@Autowired
	GatheringService Gatherservice;
	
	@Autowired
	ClassService service;
	
	// 테스트
	@RequestMapping("/chatBtn")
	public String chatBtn() {
		return "/sej/chatBtn";
	}
	
//	// 멤버 조회 리스트로 이동
//	@RequestMapping("/gatherList")
//	public String gatherListForm() {
//		return "/sej/gatheringList";
//	}
	
	
	// 메인페이지 - 베스트 모임 클래스. 신규 모임 클래스 DB 연결
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
		return "/sej/main";
	}
	
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
