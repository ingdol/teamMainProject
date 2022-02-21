
package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.MemberVO;

public interface IGatherDetDAO {
	String gatdetLoad(int gatDetNo);
	GatherDetVO detailViewBoard(int gatDetNo);
	void insertGatherDet(GatherDetVO gat);
	MemberVO MoveinsertGather(String memNick);
}