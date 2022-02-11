package com.boot.teamMainProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.service.GatherDetService;



@Controller
public class GatherDetController {
	@Autowired
	GatherDetService service;
	
	@RequestMapping("/ldh/Somoimboard/{gatDetNo}")
	public String detailViewBoard(@PathVariable int gatDetNo, Model model) {
		System.out.println(gatDetNo); 
		GatherDetVO gat = service.detailViewBoard(gatDetNo);
		model.addAttribute("gat", gat);
		
		return "ldh/Somoimboard";  // 상품 상세 정보 뷰 페이지
	}
	
	@ResponseBody
	@RequestMapping("/sboard")
	public String updateGatherDet(GatherDetVO gat) {
		service.updateGatherDet(gat);

				
		return "/sboard";
	}
	
}
