package com.boot.teamMainProject.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET})
	public String login() {

		return "pdh/login";
	}
	
	@RequestMapping(value = "/signup", method = {RequestMethod.GET})
	public String signup() {

		return "pdh/signup";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signin")
	public String signIn(@RequestBody HashMap<String, String> param, HttpSession session) {

		String checkVar = "fail";
		MemberVO resultChk = service.signIn(param);
		
		if(resultChk != null) {
			session.setAttribute("sid", resultChk.getMemId());
			checkVar = "success";
		}

		return checkVar;
	}
	
	@ResponseBody
	@RequestMapping(value = "/idcheck")
	public HashMap<String, String> memIdCheck(@RequestBody String param) {
		
		String checkId = "use";
		String memIdCheck = service.memIdCheck(param);
		
		if(memIdCheck == null) {
			checkId = "no_use";
		}
		
		HashMap<String, String> id = new HashMap<String, String>();
		id.put("id", checkId);
		return id;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickcheck")
	public HashMap<String, String> memNickCheck(@RequestBody String param) {
		
		String checkNick = "use";
		String memNickCheck = service.memNickCheck(param);
		
		if(memNickCheck == null) {
			checkNick = "no_use";
		}
		
		HashMap<String, String> nick = new HashMap<String, String>();
		nick.put("nick", checkNick);
		return nick;
	}
	
	@ResponseBody
	@RequestMapping(value = "/user-signup")
	public String userSignup(@RequestBody HashMap<String, String> params) throws ParseException {
		
		String[] hobbySplit = params.get("hobby").split(",");
		HashMap<String, String> hobbyArr = new HashMap<String, String>();
		hobbyArr.put("hobby1", hobbySplit[0]);
		hobbyArr.put("hobby2", hobbySplit[1]);
		hobbyArr.put("hobby3", hobbySplit[2]);
		
		MemberVO vo = new MemberVO();
		
		vo.setMemName(params.get("name"));
		vo.setMemId(params.get("email"));
		vo.setMemPw(params.get("pw"));
		vo.setMemNick(params.get("nick"));
		vo.setMemPhone(params.get("phone"));
		vo.setMemBirth(params.get("birth"));
		vo.setHobbyNo1(hobbyArr.get("hobby1"));
		vo.setHobbyNo2(hobbyArr.get("hobby2"));
		vo.setHobbyNo3(hobbyArr.get("hobby3"));
		vo.setMemArea(params.get("address"));
		service.userSignup(vo);
		
		return "test";
	}
}