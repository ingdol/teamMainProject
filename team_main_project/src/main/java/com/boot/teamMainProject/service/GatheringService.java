package com.boot.teamMainProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IGatheringDAO;
import com.boot.teamMainProject.model.GatheringVO;

@Service
public class GatheringService implements IGatheringService {

	@Autowired
	@Qualifier("IGatheringDAO")
	IGatheringDAO dao;
	
	@Override
	public ArrayList<GatheringVO> showlist(String hobbyNo) {
		return dao.showlist(hobbyNo);
	}

	@Override
	public ArrayList<GatheringVO> detailgat(int gatNo) {
		return dao.detailgat(gatNo);
	}

	
	
	

	
	
	
	
	//sej
	// 전체 모임 조회 - 베스트
	@Override
	public ArrayList<GatheringVO> listAllGatherBest() {		
		return dao.listAllGatherBest();
	}
	// 전체 모임 조회 - 신규
	@Override
	public ArrayList<GatheringVO> listAllGatherNew() {		
		return dao.listAllGatherNew();
	}
	
	// 모임 검색
	@Override
	public ArrayList<GatheringVO> gatherSearch(HashMap<String, Object> map){
		return dao.gatherSearch(map);
	}

	//idh
	@Override
	public void insertGathering(GatheringVO gath) {
		// TODO Auto-generated method stub
		dao.insertGathering(gath);
	}
	

}
