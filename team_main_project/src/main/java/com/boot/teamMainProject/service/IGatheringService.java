package com.boot.teamMainProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.boot.teamMainProject.model.GatRecomVO;
import com.boot.teamMainProject.model.GatheringVO;

public interface IGatheringService {

	ArrayList<GatheringVO> showlist(String hobbyNo);
	ArrayList<GatheringVO> detailgat(int gatNo);
	ArrayList<GatheringVO> hateasc();
	ArrayList<GatheringVO> hateasc2();
	ArrayList<GatheringVO> hateasc3();
	ArrayList<GatheringVO> filtermoim(@Param("gatArea") String gatArea,@Param("hobbyNo") String hobbyNo);
	//sej
	ArrayList<GatheringVO> listAllGatherBest();   // 전체 모임 조회
	ArrayList<GatheringVO> listAllGatherNew();   // 전체 모임 조회 - 신규
	ArrayList<GatheringVO> gatherSearch(HashMap<String, Object> map); // 모임 검색
	GatheringVO detailViewGatNo(String gatNo);
	//ldh
	void insertGathering(GatheringVO gath);
	GatheringVO detailViewSomoim(int gatNo);
	void LikeGathering(GatRecomVO gr);
	int LikeGathering2(int gatNo, String memNick);
	void LikeGatUpdate(int gatNo, String memNick);
	//sun
	ArrayList<GatheringVO> showall();
	ArrayList<GatheringVO> showlistdatemax(String hobbyNo);
	ArrayList<GatheringVO> showalldatemax();
	

}
