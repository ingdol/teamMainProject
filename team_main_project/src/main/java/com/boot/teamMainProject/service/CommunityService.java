package com.boot.teamMainProject.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.boot.teamMainProject.dao.ICommunityDAO;
import com.boot.teamMainProject.model.CommunityVO;

@Service
public class CommunityService implements ICommunityService {
	
	@Autowired
	@Qualifier("ICommunityDAO")
	ICommunityDAO dao;
	
	@Override
	public ArrayList<CommunityVO> communitylist() {
		return dao.communitylist();
	}

	@Override
	public ArrayList<CommunityVO> dailylist() {
		return dao.dailylist();
	}

	@Override
	public ArrayList<CommunityVO> reviewlist() {
		return dao.reviewlist();
	}

	@Override
	public ArrayList<CommunityVO> bestlist() {
		return dao.bestlist();
	}

}
