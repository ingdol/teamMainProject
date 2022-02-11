package com.boot.teamMainProject.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.IMemberService;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET})
	public String login() {

		return "pdh/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signin")
	public String signIn(@RequestBody HashMap<String, String> param, HttpSession session) {

		String checkVar = "fail";
		MemberVO resultChk = service.signIn(param);
		
		System.out.println(param);
		System.out.println(param.getClass().getName()); // 타입 확인
		System.out.println(resultChk);
		
		if(resultChk != null) {
			// System.out.println("use : " + memId_result);
			session.setAttribute("sid", resultChk.getMemId());
			checkVar = "success";
		}

		return checkVar;
	}
}