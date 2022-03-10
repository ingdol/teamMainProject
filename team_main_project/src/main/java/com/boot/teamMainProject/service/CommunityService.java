package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.ICommunityDAO;
import com.boot.teamMainProject.model.CHateVO;
import com.boot.teamMainProject.model.CLikeVO;
import com.boot.teamMainProject.model.CommunityVO;

@Service
public class CommunityService implements ICommunityService {
	
	@Autowired
	@Qualifier("ICommunityDAO")
	ICommunityDAO dao;
	
	@Override
	public ArrayList<CommunityVO> communitylist() {
		return dao.communitylist();
	}

	@Override
	public ArrayList<CommunityVO> dailylist() {
		return dao.dailylist();
	}

	@Override
	public ArrayList<CommunityVO> reviewlist() {
		return dao.reviewlist();
	}

	@Override
	public ArrayList<CommunityVO> bestlist() {
		return dao.bestlist();
	}

	@Override
	public ArrayList<CommunityVO> communitylist2() {
		return dao.communitylist2();
	}

	@Override
	public ArrayList<CommunityVO> communitylist3() {
		return dao.communitylist3();
	}

	@Override
	public ArrayList<CommunityVO> CountComBoard() {
		// TODO Auto-generated method stub
		return dao.CountComBoard();
	}

	@Override
	public void insertComBoard(CommunityVO com) throws IOException {
		// TODO Auto-generated method stub
		dao.insertComBoard(com);
	}

	@Override
	public int Lastcomboard() {
		// TODO Auto-generated method stub
		return dao.Lastcomboard();
	}

	@Override
	public void updateCommunity(CommunityVO com) {
		// TODO Auto-generated method stub
		dao.updateCommunity(com);
	}

	@Override
	public CommunityVO detailViewCommu(int commuNo) {
		// TODO Auto-generated method stub
		return dao.detailViewCommu(commuNo);
	}

	@Override
	public int updateCommBoard2Read(int commuNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateCommBoard2Read(commuNo);
	}

	@Override
	public void LikeCBoard(CLikeVO gl) {
		// TODO Auto-generated method stub
		dao.LikeCBoard(gl);
	}

	@Override
	public int LikeCBoard2(int commuNo, String memNick) {
		// TODO Auto-generated method stub
		return dao.LikeCBoard2(commuNo, memNick);
	}

	@Override
	public void LikeCUpdate(int commuNo, String memNick) {
		// TODO Auto-generated method stub
		dao.LikeCUpdate(commuNo, memNick);
	}

	@Override
	public void UpdateCommuComp(CommunityVO com) {
		// TODO Auto-generated method stub
		dao.UpdateCommuComp(com);
	}

	@Override
	public void DeleteCommuCom(int commuNo) {
		// TODO Auto-generated method stub
		dao.DeleteCommuCom(commuNo);
	}

	@Override
	public void DeleteCommuLike(int commuNo) {
		// TODO Auto-generated method stub
		dao.DeleteCommuLike(commuNo);
	}

	@Override
	public void DeleteCommuDet(int commuNo) {
		// TODO Auto-generated method stub
		dao.DeleteCommuDet(commuNo);
	}

	@Override
	public void HateCBoard(CHateVO gh) {
		// TODO Auto-generated method stub
		dao.HateCBoard(gh);
	}

	@Override
	public int HateCBoard2(int commuNo, String memNick) {
		// TODO Auto-generated method stub
		return dao.HateCBoard2(commuNo, memNick);
	}

	@Override
	public void HateCUpdate(int commuNo, String memNick) {
		// TODO Auto-generated method stub
		dao.HateCUpdate(commuNo, memNick);
	}

	@Override
	public void DeleteCommuHate(int commuNo) {
		// TODO Auto-generated method stub
		dao.DeleteCommuHate(commuNo);
	}

	@Override
	public void DeleteCommuCom2(int commuNo, int commuComNo) {
		// TODO Auto-generated method stub
		dao.DeleteCommuCom2(commuNo, commuComNo);
	}

	@Override
	public void ComCReset(int commuNo) {
		// TODO Auto-generated method stub
		dao.ComCReset(commuNo);
	}

	
	@Override
	public ArrayList<CommunityVO> memNickCheck(String memNick) {
		// TODO Auto-generated method stub
		return dao.memNickCheck(memNick);
	}
	
}
