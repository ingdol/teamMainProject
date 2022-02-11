package com.boot.teamMainProject.service;

import java.util.HashMap;

import com.boot.teamMainProject.model.MemberVO;

public interface IMemberService {
	String memIdCheck(String memId);
	void signIn(MemberVO vo);
}
