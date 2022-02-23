package com.boot.teamMainProject.service;

import java.util.ArrayList;

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

	public ArrayList<GatheringVO> showall() {
		return dao.showall();
	}

	public ArrayList<GatheringVO> showlistdatemax(String hobbyNo) {
		return dao.showlistdatemax(hobbyNo);
	}

	public ArrayList<GatheringVO> showalldatemax() {
		return dao.showalldatemax();
	}

}
