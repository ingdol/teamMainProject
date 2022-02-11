package com.boot.teamMainProject.service;

import java.util.HashMap;

import com.boot.teamMainProject.model.MemberVO;

public interface IMemberService {
//	void signIn(MemberVO vo);
	String memIdCheck(String memId);
	void signUp(MemberVO vo);
	MemberVO signIn(HashMap<String, String> param);
}
