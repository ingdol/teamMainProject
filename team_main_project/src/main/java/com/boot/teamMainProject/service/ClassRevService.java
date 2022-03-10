package com.boot.teamMainProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IClassRevDAO;
import com.boot.teamMainProject.model.ClassRevVO;

@Service
public class ClassRevService implements IClassRevService {
	
	@Autowired
	@Qualifier("IClassRevDAO")
	IClassRevDAO dao;

	public ArrayList<ClassRevVO> revlist(int classNo) {
		return dao.revlist(classNo);
	}
	//ldh
	@Override
	public ClassRevVO revlist2(int classRevNo) {
		// TODO Auto-generated method stub
		return dao.revlist2(classRevNo);
	}
	@Override
	public void insertClassRev(ClassRevVO cr) {
		// TODO Auto-generated method stub
		dao.insertClassRev(cr);
	}
	@Override
	public int LastCRboard(int classNo) {
		// TODO Auto-generated method stub
		return dao.LastCRboard(classNo);
	}

}
