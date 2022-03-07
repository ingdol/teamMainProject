package com.boot.teamMainProject.dao;

import java.io.IOException;

import com.boot.teamMainProject.model.SpaceVO;

public interface ISpaceCreateDAO {
	
	public void insertSpace(SpaceVO spa) throws IOException;
	
}
