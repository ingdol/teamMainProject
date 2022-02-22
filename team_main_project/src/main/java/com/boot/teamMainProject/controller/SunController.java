package com.boot.teamMainProject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.teamMainProject.model.CommunityVO;
import com.boot.teamMainProject.model.GatherDetComVO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.service.CommentService;
import com.boot.teamMainProject.service.CommunityService;
import com.boot.teamMainProject.service.GatherDetService;
import com.boot.teamMainProject.service.GatheringService;

@Controller
public class SunController {
	// 서연 사용controller
	
	@Autowired
	GatheringService gatherser;
	
	@Autowired
	GatherDetService gatherDetser;
	
	@Autowired
	CommunityService commuser;
	
	// 해당모임클릭시 해당모임 상세페이지 나오도록
	
	@RequestMapping("/sun/detailgat/{gatNo}")
	public String detailgat(@PathVariable int gatNo, Model model) {
		ArrayList<GatheringVO> detail = gatherser.detailgat(gatNo);
		ArrayList<GatherDetVO> gatherCommu = gatherDetser.gatcommulist(gatNo);
		
		model.addAttribute("detail",detail);
		model.addAttribute("gatherCommu",gatherCommu);
		System.out.println("detail = " + detail);
		System.out.println("gatherCommu = " + gatherCommu);
		return "/sun/detailgat";
	}
	
	
	// 전체모임에서 모임전체보기누르면 필터정렬된 전체모임만 다 나오도록
	// 전체모임에서 클래스전체보기누르면 필터정렬된 전체클래스만 다 나오도록
	
	@RequestMapping("/sun/allmoimdetail/{hobbyNo}")
	public String allmoimdetail(@PathVariable String hobbyNo, Model model) {
		ArrayList<GatheringVO> Result = gatherser.showlist(hobbyNo);
		model.addAttribute("gatheringResult",Result);
		return "/sun/allmoimdetail";
	}
	
	@RequestMapping("/sun/allclassdetail")
	public String allclassdetail(@PathVariable String hobbyNo, Model model) {
		ArrayList<GatheringVO> Result = gatherser.showlist(hobbyNo);
		model.addAttribute("Result",Result);
		return "/sun/allclassdetail";
	}
	
	
	// 전체커뮤니티게시판
	@RequestMapping("/sun/commumain")
	public String commumain(Model model) {
		ArrayList<CommunityVO> comlist = commuser.communitylist();
		ArrayList<CommunityVO> dailylist = commuser.dailylist();
		ArrayList<CommunityVO> reviewlist = commuser.reviewlist();
		ArrayList<CommunityVO> bestlist = commuser.bestlist();
		
		model.addAttribute("comlist",comlist);
		model.addAttribute("dailylist",dailylist);
		model.addAttribute("reviewlist",reviewlist);
		model.addAttribute("bestlist",bestlist);
		
		System.out.println("comlist = "+comlist);
		System.out.println("dailylist = "+dailylist);
		System.out.println("reviewlist = "+reviewlist);
		System.out.println("bestlist = "+bestlist);
		
		return "/sun/commumain";
	}
	
}
