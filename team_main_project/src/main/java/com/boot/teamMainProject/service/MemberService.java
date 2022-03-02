package com.boot.teamMainProject.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IMemDAO;
import com.boot.teamMainProject.model.MemberVO;

@Service
public class MemberService implements IMemberService {

	@Autowired
	@Qualifier("IMemDAO")
	IMemDAO dao;
	
	@Override
	public MemberVO signIn(HashMap<String, String> param) {
		System.out.println("MemberService" + param);
		System.out.println("MemberService=return" + dao.signIn(param) );
		return dao.signIn(param);
	}
	
	@Override
	public String memIdCheck(String memId) {
		return dao.memIdCheck(memId);
	}
	
	@Override
	public String memNickCheck(String memNick) {
		return dao.memNickCheck(memNick);
	}
	
	@Override
	public void userSignup(MemberVO vo) {
		dao.userSignup(vo);
	}

	//sej : 멤버 조회
	@Override
	public  MemberVO detailViewMember(String memId) {		
		return dao.detailViewMember(memId);
	}
}
