package com.boot.teamMainProject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.teamMainProject.model.ClassRevVO;
import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.model.GatherDetComVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.ClassRevService;
import com.boot.teamMainProject.service.ClassService;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class ClassReviewController {
	@Autowired
	ClassRevService service;
	
	@Autowired
	ClassService service3;
	 
	@Autowired
	MemberService service4;
	
	
	//글 상세보기
		@RequestMapping("/ldh/ClassReview/{classNo}/{classRevNo}")
		public String detailViewCR(@PathVariable int classNo, @PathVariable int classRevNo,String memId, Model model, HttpSession session) throws Exception {
			System.out.println(classNo + " " + classRevNo); 
			ClassRevVO cr = service.revlist2(classNo);
			ClassVO crd = service3.classinfo2(classNo);
//		    String memId = (String)session.getAttribute("memId");
//		    System.out.println(memId); 
		    MemberVO mem = service4.detailViewMember(memId);
		    model.addAttribute("mem", mem);
			model.addAttribute("cr", cr);
			model.addAttribute("crd", crd);
//			 System.out.println(memId); 

			
			return "ldh/ClassReview";
		}
}
