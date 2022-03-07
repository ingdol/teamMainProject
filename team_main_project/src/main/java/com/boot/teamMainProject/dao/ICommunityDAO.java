package com.boot.teamMainProject.dao;

import java.io.IOException;
import java.util.ArrayList;

import com.boot.teamMainProject.model.CLikeVO;
import com.boot.teamMainProject.model.CommunityVO;
import com.boot.teamMainProject.model.GatherDetVO;

public interface ICommunityDAO {

	ArrayList<CommunityVO> communitylist();
	ArrayList<CommunityVO> dailylist();
	ArrayList<CommunityVO> reviewlist();
	ArrayList<CommunityVO> bestlist();
	ArrayList<CommunityVO> communitylist2();
	ArrayList<CommunityVO> communitylist3();
	
	//ldh
	ArrayList<CommunityVO> CountComBoard();
	void insertComBoard(CommunityVO com) throws IOException;
	int Lastcomboard();
	void updateCommunity(CommunityVO com);
	CommunityVO detailViewCommu(int commuNo);
	public int updateCommBoard2Read(int commuNo) throws Exception;
	void LikeCBoard(CLikeVO gl);
	int LikeCBoard2(int commuNo, String memNick);
	void LikeCUpdate(int commuNo, String memNick);
	void UpdateCommuComp(CommunityVO com);
	void DeleteCommuCom(int commuNo);
	void DeleteCommuLike(int commuNo);
	void DeleteCommuDet(int commuNo);
}
