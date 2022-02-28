package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IGatherDetDAO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.MemberVO;

@Service
public class GatherDetService implements IGatherDetService {
	@Autowired
	@Qualifier("IGatherDetDAO")
	IGatherDetDAO dao;
			
	@Override
	public String gatdetLoad(int gatDetNo) {
		// TODO Auto-generated method stub
		return dao.gatdetLoad(gatDetNo);
	}

	@Override
	public GatherDetVO detailViewBoard(int gatNo ,int gatDetNo) {
		return dao.detailViewBoard(gatNo, gatDetNo);
	}

	@Override
	public void insertGatherDet(GatherDetVO gat) throws IOException {
		// TODO Auto-generated method stub
		dao.insertGatherDet(gat);
	}

	@Override
	public MemberVO MoveinsertGather(String memNick) {
		// TODO Auto-generated method stub
		return dao.MoveinsertGather(memNick);
	}
	
	@Override
	public ArrayList<GatherDetVO> CountBoard() {
		// TODO Auto-generated method stub
		return dao.CountBoard();
	}
	
	// 서연 - 소모임게시판 전체화면
	public ArrayList<GatherDetVO> gatcommulist(int gatNo) {
		// TODO Auto-generated method stub
		return dao.gatcommulist(gatNo);
	}

	@Override
	public void updateGatherDet(GatherDetVO gat) {
		// TODO Auto-generated method stub
		dao.updateGatherDet(gat);
	}

	



}
