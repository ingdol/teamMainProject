package com.boot.teamMainProject.dao;

import java.util.HashMap;

import com.boot.teamMainProject.model.MemberVO;

public interface IMemDAO {
	String memIdCheck(String memId);
	void signIn(MemberVO vo);
}
