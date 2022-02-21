package com.boot.teamMainProject.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.teamMainProject.model.GatherDetComVO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.CommentService;
import com.boot.teamMainProject.service.GatherDetService;



@Controller
public class GatherDetController {
	@Autowired
	GatherDetService service;
	
	@Inject
	CommentService service2;
	

	
	@RequestMapping("/ldh/SomoimboardWrite/{memNick}")
	public String MoveinsertGather(@PathVariable String memNick, Model model) {
		System.out.println(memNick); 
		MemberVO gat = service.MoveinsertGather(memNick);
		model.addAttribute("gat", gat);

		return "/ldh/SomoimboardWrite";
	}
	

	@RequestMapping("/sboard")
	public String insertGatherDet(GatherDetVO gat) {
		service.insertGatherDet(gat);

		
		return "redirect:/ldh/Somoimboard";
	}
	
	
	
	@RequestMapping("/ldh/Somoimboard/{gatDetNo}")
	public String detailViewBoard(@PathVariable int gatDetNo, Model model) throws Exception {
		System.out.println(gatDetNo); 
		GatherDetVO gat = service.detailViewBoard(gatDetNo);
		model.addAttribute("gat", gat);
		
		List<GatherDetComVO> comList = service2.readComment(gatDetNo);
		model.addAttribute("comList", comList);
		
		return "ldh/Somoimboard";
	}
}
