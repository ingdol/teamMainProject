package com.boot.teamMainProject.dao;

import java.util.HashMap;

import com.boot.teamMainProject.model.MemberVO;

public interface IMemDAO {
//	void signIn(MemberVO vo);
	String memIdCheck(String memId);
	void signUp(MemberVO vo);
	MemberVO signIn(HashMap<String, String> param);
}
