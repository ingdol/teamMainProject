package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;

import com.boot.teamMainProject.model.CLikeVO;
import com.boot.teamMainProject.model.CommunityVO;
import com.boot.teamMainProject.model.GatherDetVO;

public interface ICommunityService {

	ArrayList<CommunityVO> communitylist();
	ArrayList<CommunityVO> communitylist2();
	ArrayList<CommunityVO> communitylist3();
	ArrayList<CommunityVO> dailylist();
	ArrayList<CommunityVO> reviewlist();
	ArrayList<CommunityVO> bestlist();
	
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
