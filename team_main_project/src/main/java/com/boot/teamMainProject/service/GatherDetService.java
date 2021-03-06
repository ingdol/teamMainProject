package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IGatherDetDAO;
import com.boot.teamMainProject.model.GHateVO;
import com.boot.teamMainProject.model.GLikeVO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.MemberVO;

@Service
public class GatherDetService implements IGatherDetService {
	@Autowired
	@Qualifier("IGatherDetDAO")
	IGatherDetDAO dao;
			
	@Override
	public String gatdetLoad(int gatDetNo) {
		// TODO Auto-generated method stub
		return dao.gatdetLoad(gatDetNo);
	}

	@Override
	public GatherDetVO detailViewBoard(int gatNo ,int gatDetNo) {
		return dao.detailViewBoard(gatNo, gatDetNo);
	}

	@Override
	public void insertGatherDet(GatherDetVO gat) throws IOException {
		// TODO Auto-generated method stub
		dao.insertGatherDet(gat);
	}

	@Override
	public MemberVO MoveinsertGather(String memNick) {
		// TODO Auto-generated method stub
		return dao.MoveinsertGather(memNick);
	}
	
	@Override
	public ArrayList<GatherDetVO> CountBoard() {
		// TODO Auto-generated method stub
		return dao.CountBoard();
	}
	
	// 서연 - 소모임게시판 전체화면
	public ArrayList<GatherDetVO> gatcommulist(int gatNo) {
		// TODO Auto-generated method stub
		return dao.gatcommulist(gatNo);
	}

	@Override
	public void updateGatherDet(GatherDetVO gat) {
		// TODO Auto-generated method stub
		dao.updateGatherDet(gat);
	}

	@Override
	public int updateBoard2Read(int gatDetNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateBoard2Read(gatDetNo);
	}

	@Override
	public GatherDetVO UpdateGatDet(int gatDetNo) {
		// TODO Auto-generated method stub
		return dao.UpdateGatDet(gatDetNo);
	}

	@Override
	public void UpdateGatDetComp(GatherDetVO gat) {
		// TODO Auto-generated method stub
		dao.UpdateGatDetComp(gat);
	}

	@Override
	public void DeleteGatDet(int gatDetNo) {
		// TODO Auto-generated method stub
		dao.DeleteGatDet(gatDetNo);
	}

	@Override
	public void DeleteGatDetCom(int gatDetNo) {
		// TODO Auto-generated method stub
		dao.DeleteGatDetCom(gatDetNo);
	}

	@Override
	public int Lastboard(int gatNo) {
		// TODO Auto-generated method stub
		return dao.Lastboard(gatNo);
	}

	@Override
	public void LikeSBoard(GLikeVO gl) {
		// TODO Auto-generated method stub
		dao.LikeSBoard(gl);
	}

	@Override
	public void LikeUpdate(int gatDetNo, String memNick) {
		// TODO Auto-generated method stub
		dao.LikeUpdate(gatDetNo,memNick);
	}

	@Override
	public int LikeSBoard2(int gatDetNo, String memNick) {
		// TODO Auto-generated method stub
		return dao.LikeSBoard2(gatDetNo,memNick);
	}

	@Override
	public void DeleteGatLike(int gatDetNo) {
		// TODO Auto-generated method stub
		dao.DeleteGatLike(gatDetNo);
	}

	@Override
	public void HateSBoard(GHateVO gh) {
		// TODO Auto-generated method stub
		dao.HateSBoard(gh);
	}

	@Override
	public int HateSBoard2(int gatDetNo, String memNick) {
		// TODO Auto-generated method stub
		return dao.HateSBoard2(gatDetNo, memNick);
	}

	@Override
	public void HateUpdate(int gatDetNo, String memNick) {
		// TODO Auto-generated method stub
		dao.HateUpdate(gatDetNo, memNick);
	}

	@Override
	public void DeleteGatHate(int gatDetNo) {
		// TODO Auto-generated method stub
		dao.DeleteGatHate(gatDetNo);
	}

	@Override
	public void DeleteGatDetCom2(int gatDetNo, int gatDetComNo) {
		// TODO Auto-generated method stub
		dao.DeleteGatDetCom2(gatDetNo, gatDetComNo);
	}

	@Override
	public void ComReset(int gatDetNo) {
		// TODO Auto-generated method stub
		dao.ComReset(gatDetNo);
	}







}
