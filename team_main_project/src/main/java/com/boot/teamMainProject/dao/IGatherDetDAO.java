package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.GatherDetVO;

public interface IGatherDetDAO {
	String gatdetLoad(int gatDetNo);
	GatherDetVO detailViewBoard(int gatDetNo);
	void insertGatherDet(GatherDetVO gat);
}
