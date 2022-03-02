package com.boot.teamMainProject.dao;

import java.util.HashMap;

import com.boot.teamMainProject.model.MemberVO;

public interface IMemDAO {
//	void signIn(MemberVO vo);
	String memIdCheck(String memId);
	String memNickCheck(String memNick);
	MemberVO signIn(HashMap<String, String> param);
	void userSignup(MemberVO vo);
	MemberVO detailViewMember(String memId);// sej:상세 회원 조회
}
