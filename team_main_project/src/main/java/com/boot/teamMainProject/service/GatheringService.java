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
	
	@Override
	public GatheringVO detailViewGatNo(String gatNo){
		return dao.detailViewGatNo(gatNo);
	}

	//idh
	@Override
	public void insertGathering(GatheringVO gath) {
		// TODO Auto-generated method stub
		dao.insertGathering(gath);
	}
	public GatheringVO detailViewSomoim(int gatNo) {
		return dao.detailViewSomoim(gatNo);
	}

  //서연
  	public ArrayList<GatheringVO> showall() {
		return dao.showall();
	}

	public ArrayList<GatheringVO> showlistdatemax(String hobbyNo) {
		return dao.showlistdatemax(hobbyNo);
	}

	public ArrayList<GatheringVO> showalldatemax() {
		return dao.showalldatemax();
	}
	
	public ArrayList<GatheringVO> hateasc() {
		return dao.hateasc();
	}

	public ArrayList<GatheringVO> hateasc2() {
		return dao.hateasc2();
	}
	
	public ArrayList<GatheringVO> hateasc3() {
		return dao.hateasc3();
	}

	public ArrayList<GatheringVO> filtermoim(String gatArea, String hobbyNo) {
		return dao.filtermoim(gatArea,hobbyNo);
	}


}
