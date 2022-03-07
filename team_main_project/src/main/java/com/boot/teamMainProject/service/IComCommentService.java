package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.boot.teamMainProject.model.CommunityComVO;

public interface IComCommentService {
	public List<CommunityComVO> readComComment(int commuNo) throws Exception;
	ArrayList<CommunityComVO> ComCommentCountBoard(int commuNo);
	void insertCommunityCom (CommunityComVO comc) throws IOException;
}
