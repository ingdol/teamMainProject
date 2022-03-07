package com.boot.teamMainProject.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.boot.teamMainProject.model.CommunityComVO;
import com.boot.teamMainProject.model.GatherDetComVO;

public interface ICommunityComDAO {
	
	public List<CommunityComVO> readComComment(int commuNo) throws Exception;
	ArrayList<CommunityComVO> ComCommentCountBoard(int commuNo);
	void insertCommunityCom (CommunityComVO comc) throws IOException;
}
