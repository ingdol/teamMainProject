package com.boot.teamMainProject.dao;

import java.util.ArrayList;

import com.boot.teamMainProject.model.GatheringVO;

public interface IGatheringDAO {
	ArrayList<GatheringVO> showlist(String hobbyNo);
}
