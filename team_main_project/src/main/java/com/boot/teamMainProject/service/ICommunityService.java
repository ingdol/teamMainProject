package com.boot.teamMainProject.service;

import java.util.ArrayList;

import com.boot.teamMainProject.model.CommunityVO;

public interface ICommunityService {

	ArrayList<CommunityVO> communitylist();
	ArrayList<CommunityVO> communitylist2();
	ArrayList<CommunityVO> communitylist3();
	ArrayList<CommunityVO> dailylist();
	ArrayList<CommunityVO> reviewlist();
	ArrayList<CommunityVO> bestlist();
}
