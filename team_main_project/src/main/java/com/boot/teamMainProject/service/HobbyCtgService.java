package com.boot.teamMainProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IHobbyCtgDAO;
import com.boot.teamMainProject.model.HobbyCtgVO;

@Service
public class HobbyCtgService implements IHobbyCtgService {
	@Autowired
	@Qualifier("IHobbyCtgDAO")
	IHobbyCtgDAO dao;

	@Override
	public ArrayList<HobbyCtgVO> ctgall() {
		return dao.ctgall();
	}
	
}
