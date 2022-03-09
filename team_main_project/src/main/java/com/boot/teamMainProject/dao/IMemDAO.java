package com.boot.teamMainProject.dao;

import java.util.HashMap;

import com.boot.teamMainProject.model.MemberVO;

public interface IMemDAO {
	String memIdCheck(String memId);
	String memNickCheck(String memNick);
	MemberVO signIn(HashMap<String, String> param);
	void userSignup(MemberVO vo);
	MemberVO selectNick(String memNick);
	MemberVO detailViewMember(String memId);// sej : 상세 회원 조회
	void SignInGather1(int gatNo, String memNick); // 모임 가입
	void SignInGather2(int gatNo, String memNick); // 모임 가입
	void SignInGather3(int gatNo, String memNick); // 모임 가입
	void SignInGather4(int gatNo, String memNick); // 모임 가입
	void SignInGather5(int gatNo, String memNick); // 모임 가입
	void SignInClass1(int classNo, String memNick); // 클래스 가입
	void SignInClass2(int classNo, String memNick); // 클래스 가입
	void SignInClass3(int classNo, String memNick); // 클래스 가입
	void SignInClass4(int classNo, String memNick); // 클래스 가입
	void SignInClass5(int classNo, String memNick); // 클래스 가입
}
