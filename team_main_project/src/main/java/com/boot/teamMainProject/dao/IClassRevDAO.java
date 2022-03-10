package com.boot.teamMainProject.dao;

import java.util.ArrayList;

import com.boot.teamMainProject.model.ClassRevVO;

public interface IClassRevDAO {

	ArrayList<ClassRevVO> revlist(int classNo);
	
	//ldh
	ClassRevVO revlist2(int classRevNo);
	void insertClassRev(ClassRevVO cr);
	int LastCRboard(int classNo);
}
