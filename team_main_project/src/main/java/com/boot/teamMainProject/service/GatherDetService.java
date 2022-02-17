package com.boot.teamMainProject.service;

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
	public GatherDetVO detailViewBoard(int gatDetNo) {
		// TODO Auto-generated method stub
		return dao.detailViewBoard(gatDetNo);
	}

	@Override
	public void insertGatherDet(GatherDetVO gat) {
		// TODO Auto-generated method stub
		dao.insertGatherDet(gat);
	}

	@Override
	public MemberVO MoveinsertGather(String memNick) {
		// TODO Auto-generated method stub
		return dao.MoveinsertGather(memNick);
	}

}
