
package com.boot.teamMainProject.dao;

import java.io.IOException;
import java.util.ArrayList;

import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.MemberVO;

public interface IGatherDetDAO {
	String gatdetLoad(int gatDetNo);
	GatherDetVO detailViewBoard(int gatNo ,int gatDetNo);
	void insertGatherDet(GatherDetVO gat) throws IOException;
	MemberVO MoveinsertGather(String memNick);
	ArrayList<GatherDetVO> CountBoard ();
	void updateGatherDet(GatherDetVO gat);
	public int updateBoard2Read(int gatDetNo) throws Exception;
	GatherDetVO UpdateGatDet(int gatDetNo);
	void UpdateGatDetComp(GatherDetVO gat);
	void DeleteGatDet(int gatDetNo);
	void DeleteGatDetCom(int gatDetNo);
	int Lastboard(int gatNo);
	// 서연-소모임게시판 전체화면
	ArrayList<GatherDetVO> gatcommulist(int gatNo);
}