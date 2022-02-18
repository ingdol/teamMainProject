package com.boot.teamMainProject.dao;

import java.util.List;

import com.boot.teamMainProject.model.GatherDetComVO;

public interface GatherDetComDAO {
	
	public List<GatherDetComVO> readComment(int gatDetNo) throws Exception;
}
