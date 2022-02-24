package com.boot.teamMainProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.teamMainProject.model.GatheringVO;

public interface IGatheringDAO {
	ArrayList<GatheringVO> showlist(String hobbyNo);
	ArrayList<GatheringVO> detailgat(int gatNo);
	ArrayList<GatheringVO> showall();
	ArrayList<GatheringVO> showlistdatemax(String hobbyNo);
	ArrayList<GatheringVO> showalldatemax();
	
	

	//sej
	ArrayList<GatheringVO> listAllGatherBest();   // 전체 모임 조회 - 베스트
	ArrayList<GatheringVO> listAllGatherNew();   // 전체 모임 조회 - 신규
	ArrayList<GatheringVO> gatherSearch(HashMap<String, Object> map); // 모임 검색

	
	
	//ldh
	void insertGathering(GatheringVO gath);
	GatheringVO detailViewSomoim(int gatNo);
}
