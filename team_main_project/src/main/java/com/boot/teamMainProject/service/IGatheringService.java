package com.boot.teamMainProject.service;

import java.util.ArrayList;

import com.boot.teamMainProject.model.GatheringVO;

public interface IGatheringService {

	ArrayList<GatheringVO> showlist(String hobbyNo);
	ArrayList<GatheringVO> detailgat(int gatNo);
	ArrayList<GatheringVO> showall();
	ArrayList<GatheringVO> showlistdatemax(String hobbyNo);
	ArrayList<GatheringVO> showalldatemax();
}
