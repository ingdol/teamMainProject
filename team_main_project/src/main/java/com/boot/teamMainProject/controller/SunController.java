package com.boot.teamMainProject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.service.GatherDetService;
import com.boot.teamMainProject.service.GatheringService;

@Controller
public class SunController {
	// 서연 사용controller
	
	@Autowired
	GatheringService gatherser;
	
	@Autowired
	GatherDetService gatherDetser;
	
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
	
	
	// 상세페이지에서 모임게시판,사진첩 연동
	/*
	 * @RequestMapping("/sun/detailgat/{gatNo}/commulist") public String
	 * commulist(@PathVariable int gatNo, Model model) { return "/sun/detailgat"; }
	 */
	
}
