package com.boot.teamMainProject.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 로그인
	@ResponseBody
	@RequestMapping(value = "/signin")
	public String signIn(@RequestBody HashMap<String, String> param, HttpServletRequest request) {

		String checkVar = "fail";
		MemberVO resultChk = service.signIn(param);
		HttpSession session = request.getSession();
		
		if(resultChk != null) {
			session.setAttribute("sid", resultChk.getMemId());
			session.setAttribute("sidNick", resultChk.getMemNick()); //닉네임
			session.setMaxInactiveInterval(3600); // 60분
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
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public void logout(HttpServletRequest request) {
		request.getSession().invalidate();
		request.getSession(true);
	}
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @RequestMapping(value = "/start", method = RequestMethod.POST, consumes = "application/json")
    @ResponseBody
    public String startApp(@RequestBody String body) {
        System.out.println(body);
        logger.info(body);
        return "/";
    }

    @RequestMapping(value = "/doA", method = RequestMethod.GET)
    public String doA(Locale locale, Model model){
        JSONObject cred = new JSONObject();
        JSONObject auth = new JSONObject();
        JSONObject parent = new JSONObject();

        cred.put("username","adm");
        cred.put("password", "pwd");
        auth.put("tenantName", "bee6438379@gmail.com");
//        auth.put("tenantName", param);
        auth.put("passwordCredentials", cred);
        parent.put("auth", auth);

        URLConn conn = new URLConn("http://127.0.0.1",1516);
        conn.urlPost(parent);

        System.out.println(MemberVO.getAuthNum());

        return "index";
    }
	
}