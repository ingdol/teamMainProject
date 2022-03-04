package com.boot.teamMainProject.service;

import java.util.HashMap;

import com.boot.teamMainProject.model.MemberVO;

public interface IMemberService {
	String memIdCheck(String memId);
	String memNickCheck(String memNick);
	MemberVO signIn(HashMap<String, String> param);
	void userSignup(MemberVO vo);
	MemberVO selectNick(String memNick);
	MemberVO detailViewMember(String memId);// sej : 상세 회원 조회
}
