package com.boot.teamMainProject.controller;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.teamMainProject.model.*;
import com.boot.teamMainProject.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class SunController {
	// 서연 사용controller
	
	@Autowired
	GatheringService gatherser;
	
	@Autowired
	GatherDetService gatherDetser;
	
	@Autowired
	CommunityService commuser;
	
	@Autowired
	ClassService classser;
	
	@Autowired
	HobbyCtgService ctgser;
	
	@Autowired
	ClassRevService classrevser;

	// 모임 일정 공지 service(고병채)
	@Autowired
	GatherScheduleService scheduleService;
	@Autowired
	MemberService memberService;
	// 해당모임클릭시 해당모임 상세페이지 나오도록
	
	@RequestMapping("/sun/detailgat/{gatNo}")
	public String detailgat(@PathVariable int gatNo, Model model, HttpSession session) {
		ArrayList<GatheringVO> detail = gatherser.detailgat(gatNo);
		ArrayList<GatherDetVO> gatherCommu = gatherDetser.gatcommulist(gatNo);
		ArrayList<GatherScheduleVO> gatherSchedule = scheduleService.LoadGather_Sche(gatNo); // bch
		GatheringVO sendGatherNo = gatherser.detailViewSomoim(gatNo);
		String sid = (String) session.getAttribute("sid");
		MemberVO mem = memberService.detailViewMember(sid);

		model.addAttribute("mem", mem);
		model.addAttribute("detail",detail);
		model.addAttribute("gatherCommu",gatherCommu);
		model.addAttribute("gatherSchedule", gatherSchedule);
		model.addAttribute("sendGatherNo", sendGatherNo);
		System.out.println("detail = " + detail);
		System.out.println("gatherCommu = " + gatherCommu);
		return "/sun/detailgat";
	}

	
	// 전체커뮤니티게시판
	@RequestMapping("/sun/commumain/1")
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
	
	@RequestMapping("/sun/commumain/2")
	public String commumain2(Model model) {
		ArrayList<CommunityVO> comlist = commuser.communitylist2();
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
	
	@RequestMapping("/sun/commumain/3")
	public String commumain3(Model model) {
		ArrayList<CommunityVO> comlist = commuser.communitylist3();
		ArrayList<CommunityVO> dailylist = commuser.dailylist();
		ArrayList<CommunityVO> reviewlist = commuser.reviewlist();
		ArrayList<CommunityVO> bestlist = commuser.bestlist();

		model.addAttribute("comlist", comlist);
		model.addAttribute("dailylist", dailylist);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("bestlist", bestlist);

		System.out.println("comlist = " + comlist);
		System.out.println("dailylist = " + dailylist);
		System.out.println("reviewlist = " + reviewlist);
		System.out.println("bestlist = " + bestlist);

		return "/sun/commumain";
	}

	@RequestMapping("/sun/allmoimdetail/1")
	public String allmoimdetail(Model model) {
		ArrayList<GatheringVO> gatheringResult = gatherser.hateasc();
		model.addAttribute("gatheringResult", gatheringResult);
		return "/sun/allmoimdetail";
	}

	@RequestMapping("/sun/allmoimdetail/2")
	public String allmoimdetail2(Model model) {
		ArrayList<GatheringVO> gatheringResult = gatherser.hateasc2();
		model.addAttribute("gatheringResult", gatheringResult);
		return "/sun/allmoimdetail";
	}

	@RequestMapping("/sun/allmoimdetail/3")
	public String allmoimdetail3(Model model) {
		ArrayList<GatheringVO> gatheringResult = gatherser.hateasc3();
		model.addAttribute("gatheringResult", gatheringResult);
		return "/sun/allmoimdetail";
	}

	@RequestMapping("/sun/detailclass/{classNo}")
	public String detailclass(@PathVariable int classNo, Model model) {
		ArrayList<ClassVO> detail = classser.classinfo(classNo);
		ArrayList<ClassRevVO> revlist = classrevser.revlist(classNo);
		model.addAttribute("detail", detail);
		model.addAttribute("revlist", revlist);
		return "/sun/detailclass";
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
	
}
