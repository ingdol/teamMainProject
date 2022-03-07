package com.boot.teamMainProject.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.ISpaceCreateDAO;
import com.boot.teamMainProject.model.SpaceVO;

@Service
public class SpaceCreateService implements ISpaceCreateService {
	@Autowired
	@Qualifier("ISpaceCreateDAO")
	ISpaceCreateDAO dao;
	
	@Override
	public void insertSpace(SpaceVO spa) throws IOException {
		// TODO Auto-generated method stub
			dao.insertSpace(spa);
	}

}
