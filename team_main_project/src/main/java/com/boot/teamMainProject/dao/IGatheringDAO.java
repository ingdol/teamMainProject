package com.boot.teamMainProject.dao;

import java.util.ArrayList;

import com.boot.teamMainProject.model.GatheringVO;

public interface IGatheringDAO {
	ArrayList<GatheringVO> showlist(String hobbyNo);
	ArrayList<GatheringVO> detailgat(int gatNo);
	ArrayList<GatheringVO> showall();
	ArrayList<GatheringVO> showlistdatemax(String hobbyNo);
	ArrayList<GatheringVO> showalldatemax();
}
