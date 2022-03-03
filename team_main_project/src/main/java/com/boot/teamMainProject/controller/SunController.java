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
	// 해당모임클릭시 해당모임 상세페이지 나오도록
	
	@RequestMapping("/sun/detailgat/{gatNo}")
	public String detailgat(@PathVariable int gatNo, Model model) {
		ArrayList<GatheringVO> detail = gatherser.detailgat(gatNo);
		ArrayList<GatherDetVO> gatherCommu = gatherDetser.gatcommulist(gatNo);
		ArrayList<GatherScheduleVO> gatherSchedule = scheduleService.LoadGather_Sche(gatNo); // bch
		GatheringVO sendGatherNo = gatherser.detailViewSomoim(gatNo);
		
		model.addAttribute("detail",detail);
		model.addAttribute("gatherCommu",gatherCommu);
		model.addAttribute("gatherSchedule", gatherSchedule);
		model.addAttribute("sendGatherNo", sendGatherNo);
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
	
	//전체모임,클래스
	@RequestMapping("/sun/allmoim/all")
	public String showall(Model model) {
		ArrayList<GatheringVO> gatheringResult = gatherser.showall();
		ArrayList<ClassVO> classResult = classser.listall();
		ArrayList<HobbyCtgVO> ctg = ctgser.ctgall();
		
		System.out.println("gatheringResult="+gatheringResult);
		
		model.addAttribute("gatheringResult",gatheringResult);
		model.addAttribute("classResult",classResult);
		model.addAttribute("ctg",ctg);
		return "/sun/allmoim";
	}
	
	//**관심사카테고리에서 특정카테고리클릭시 해당카테고리 전체모임,클래스 나타내기	+개설일순
			@RequestMapping("/sun/allmoim/{hobbyNo}/datemax")
			public String showlistdate(@PathVariable String hobbyNo, Model model) {
				ArrayList<GatheringVO> gatheringResult = gatherser.showlistdatemax(hobbyNo);
				ArrayList<ClassVO> classResult = classser.listClassdatemax(hobbyNo);
				ArrayList<HobbyCtgVO> ctg = ctgser.ctgall();								
				
				model.addAttribute("gatheringResult",gatheringResult);
				model.addAttribute("classResult",classResult);
				model.addAttribute("ctg",ctg);
				return "/sun/allmoim";
			}
	
	//전체모임,클래스 개설일순으로
			@RequestMapping("/sun/allmoim/all/datemax")
			public String showalldate(Model model) {
				ArrayList<GatheringVO> gatheringResult = gatherser.showalldatemax();
				ArrayList<ClassVO> classResult = classser.listalldatemax();
				ArrayList<HobbyCtgVO> ctg = ctgser.ctgall();
				
				System.out.println("gatheringResult="+gatheringResult);
				
				model.addAttribute("gatheringResult",gatheringResult);
				model.addAttribute("classResult",classResult);
				model.addAttribute("ctg",ctg);
				return "/sun/allmoim";
			}
	
		
			@RequestMapping("/sun/allmoimdetail/1")
			public String allmoimdetail(Model model) {
				ArrayList<GatheringVO> gatheringResult = gatherser.hateasc();
				model.addAttribute("gatheringResult",gatheringResult);
				return "/sun/allmoimdetail";
			}
			
			@RequestMapping("/sun/allmoimdetail/2")
			public String allmoimdetail2(Model model) {
				ArrayList<GatheringVO> gatheringResult = gatherser.hateasc2();
				model.addAttribute("gatheringResult",gatheringResult);
				return "/sun/allmoimdetail";
			}
			
			@RequestMapping("/sun/allmoimdetail/3")
			public String allmoimdetail3(Model model) {
				ArrayList<GatheringVO> gatheringResult = gatherser.hateasc3();
				model.addAttribute("gatheringResult",gatheringResult);
				return "/sun/allmoimdetail";
			}
			
			@RequestMapping("/sun/detailclass/{classNo}")
			public String detailclass(@PathVariable int classNo, Model model) {
				ArrayList<ClassVO> detail = classser.classinfo(classNo);
				ArrayList<ClassRevVO> revlist = classrevser.revlist(classNo);
				model.addAttribute("detail",detail);
				model.addAttribute("revlist",revlist);
				return "/sun/detailclass";
			}
			
			//**관심사카테고리에서 특정카테고리클릭시 해당카테고리 전체모임,클래스 나타내기	
			@RequestMapping("/sun/allmoim/{gatArea}{hobbyNo}")
			public String filter(@PathVariable String gatArea,@PathVariable String hobbyNo, Model model) {
				System.out.println(gatArea+","+hobbyNo);
				ArrayList<GatheringVO> gatheringResult = gatherser.filtermoim(gatArea,hobbyNo);
				ArrayList<ClassVO> classResult = classser.filterclass(gatArea,hobbyNo);
				
				model.addAttribute("gatheringResult",gatheringResult);
				model.addAttribute("classResult",classResult);
				return "/sun/allmoim";
			}
}
