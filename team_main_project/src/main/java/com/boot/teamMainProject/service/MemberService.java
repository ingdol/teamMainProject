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
		return dao.signIn(param);
	}
	
	@Override
	public String memIdCheck(String memId) {
		return dao.memIdCheck(memId);
	}
	
	@Override
	public String memNickCheck(String memNick) {
		System.out.println("memNick : " + memNick);
		return dao.memNickCheck(memNick);
	}
	 
	@Override
	public void userChangeInfo(MemberVO vo) {
		dao.userChangeInfo(vo);
	}
	
	@Override
	public void userSignup(MemberVO vo) {
		dao.userSignup(vo);
	}
	
	@Override
	public MemberVO gather(MemberVO memId) {
		return dao.gather(memId);
	}
	
	@Override
	public int selectPoint(String memId) {

		System.out.println("selectPoint : " + memId);
		System.out.println("selectPoint return : " +
		dao.selectPoint(memId));

		return dao.selectPoint(memId);
	}
	
	@Override
	public MemberVO selectNick(String memId) {
		/*
		 * System.out.println("selectNick : " + memId);
		 * System.out.println("selectNick return : " +
		 * dao.selectNick(memId).getMemNick());
		 */
		return dao.selectNick(memId);
	}
	//sej : 멤버 조회
	@Override
	public  MemberVO detailViewMember(String memId) {
		return dao.detailViewMember(memId);
	}
	@Override
	public void SignInGather1(int gatNo, String memNick) {
		dao.SignInGather1(gatNo, memNick);
	}
	@Override
	public void SignInGather2(int gatNo, String memNick) {
		dao.SignInGather2(gatNo, memNick);
	}
	@Override
	public void SignInGather3(int gatNo, String memNick) {
		dao.SignInGather3(gatNo, memNick);
	}
	@Override
	public void SignInGather4(int gatNo, String memNick) {
		dao.SignInGather4(gatNo, memNick);
	}
	@Override
	public void SignInGather5(int gatNo, String memNick) {
		dao.SignInGather5(gatNo, memNick);
	}

	@Override
	public void SignInClass1(int classNo, String memNick) {
		dao.SignInClass1(classNo, memNick);
	}

	@Override
	public void SignInClass2(int classNo, String memNick) {
		dao.SignInClass2(classNo, memNick);
	}

	@Override
	public void SignInClass3(int classNo, String memNick) {
		dao.SignInClass3(classNo, memNick);
	}

	@Override
	public void SignInClass4(int classNo, String memNick) {
		dao.SignInClass4(classNo, memNick);
	}

	@Override
	public void SignInClass5(int classNo, String memNick) {
		dao.SignInClass5(classNo, memNick);
	}
}