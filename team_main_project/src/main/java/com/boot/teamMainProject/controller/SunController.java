package com.boot.teamMainProject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.teamMainProject.model.ClassRevVO;
import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.model.Class_ScheVO;
import com.boot.teamMainProject.model.CommunityVO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.GatherScheduleVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.ClassRevService;
import com.boot.teamMainProject.service.ClassService;
import com.boot.teamMainProject.service.Class_ScheService;
import com.boot.teamMainProject.service.CommunityService;
import com.boot.teamMainProject.service.GatherDetService;
import com.boot.teamMainProject.service.GatherScheduleService;
import com.boot.teamMainProject.service.GatheringService;
import com.boot.teamMainProject.service.HobbyCtgService;
import com.boot.teamMainProject.service.MemberService;

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
	@Autowired
	Class_ScheService class_scheService;
	// 해당모임클릭시 해당모임 상세페이지 나오도록
	
	@RequestMapping("/sun/detailgat/{gatNo}")
	public String detailgat(@PathVariable int gatNo, Model model, HttpSession session) {
		ArrayList<GatheringVO> detail = gatherser.detailgat(gatNo);
		ArrayList<GatherDetVO> gatherCommu = gatherDetser.gatcommulist(gatNo);
		ArrayList<GatherScheduleVO> gatherSchedule = scheduleService.LoadGather_Sche(gatNo); // bch (목록에 일정 보여주기 위함)
		GatheringVO sendGatherNo = gatherser.detailViewSomoim(gatNo); // bxh
		String sid = (String) session.getAttribute("sid"); // bch
		MemberVO mem = memberService.detailViewMember(sid); // bch

		model.addAttribute("mem", mem); //bch
		model.addAttribute("detail",detail);
		model.addAttribute("gatherCommu",gatherCommu);
		model.addAttribute("gatherSchedule", gatherSchedule); // bch
		model.addAttribute("sendGatherNo", sendGatherNo); // bch
		System.out.println("detail = " + detail);
		System.out.println("gatherCommu = " + gatherCommu);
		return "/sun/detailgat";
	}

	
	// 전체커뮤니티게시판
	@RequestMapping("/sun/commumain/1")
	public String commumain(Model model) {
		System.out.println("aa");
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
	public String detailclass(@PathVariable int classNo, Model model, HttpSession session) {
		ArrayList<ClassVO> detail = classser.classinfo(classNo);
		ArrayList<ClassRevVO> revlist = classrevser.revlist(classNo);
		ArrayList<Class_ScheVO> classSchedule = class_scheService.LoadClass_Sche(classNo); // bch (목록에 일정 보여주기 위함)
		ClassVO classInfoVO = classser.ClassInfoVO(classNo); //bch
		String sid = (String) session.getAttribute("sid"); // bch
		MemberVO mem = memberService.detailViewMember(sid); // bch

		model.addAttribute("mem", mem); // bch
		model.addAttribute("detail", detail);
		model.addAttribute("revlist", revlist);
		model.addAttribute("classInfoVO", classInfoVO);// bch
		model.addAttribute("classSchedule", classSchedule);// bch
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
	
	@RequestMapping("/sun/allclassdetail/{hobbyNo}")
	public String allclassdetail(@PathVariable String hobbyNo, Model model) {
		ArrayList<ClassVO> Result = classser.listClass(hobbyNo);
		model.addAttribute("Result",Result);
		return "/sun/allclassdetail";
	}
	
	@RequestMapping("/sun/allmoim/filter")
	public String filter( @RequestParam("gatArea") String gatArea,
				@RequestParam("hobbyNo") String hobbyNo,
						Model model) {
		ArrayList<GatheringVO> gatheringResult = gatherser.filtermoim(gatArea, hobbyNo);
		ArrayList<ClassVO> classResult = classser.filterclass(gatArea, hobbyNo);	
		model.addAttribute("gatheringResult",gatheringResult);
		model.addAttribute("classResult",classResult);
		System.out.println(gatheringResult);
		System.out.println(classResult);
		return "/sun/allmoimajax";
	}
	
	@RequestMapping("/sun/allmoimdetail2/{hobbyNo}")
	public String filmoim(@PathVariable String hobbyNo, Model model) {
		ArrayList<GatheringVO> gatheringResult = gatherser.showlist(hobbyNo);
		model.addAttribute("gatheringResult",gatheringResult);
		return "/sun/allmoimdetail2";
	}
	
	//필터-gatarea,hobbyno-모임전체보기??
//	@RequestMapping("/sun/allmoim/filter")
//	public String filterm( @RequestParam("gatArea") String gatArea,
//				@RequestParam("hobbyNo") String hobbyNo,
//						Model model) {
//		ArrayList<GatheringVO> gatheringResult = gatherser.filtermoim(gatArea, hobbyNo);
//		ArrayList<ClassVO> classResult = classser.filterclass(gatArea, hobbyNo);	
//		model.addAttribute("gatheringResult",gatheringResult);
//		model.addAttribute("classResult",classResult);
//		System.out.println(gatheringResult);
//		System.out.println(classResult);
//		return "/sun/allmoimajax";
//	}
}
