package com.boot.teamMainProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IClassCreateDAO;
import com.boot.teamMainProject.model.ClassVO;

@Service
public class ClassCreateService implements IClassCreateService {
	@Autowired
	@Qualifier("IClassCreateDAO")
	IClassCreateDAO dao;
	
	@Override
	public void insertClass(ClassVO cl) {
		// TODO Auto-generated method stub
		dao.insertClass(cl);
	}

}
