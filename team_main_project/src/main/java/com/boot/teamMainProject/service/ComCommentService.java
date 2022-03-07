package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.ICommunityComDAO;
import com.boot.teamMainProject.model.CommunityComVO;

@Service
public class ComCommentService implements IComCommentService {
	@Inject
	private ICommunityComDAO dao;
	
	@Override
	public List<CommunityComVO> readComComment(int commuNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.readComComment(commuNo);
	}

	@Override
	public ArrayList<CommunityComVO> ComCommentCountBoard(int commuNo) {
		// TODO Auto-generated method stub
		return dao.ComCommentCountBoard(commuNo);
	}

	@Override
	public void insertCommunityCom(CommunityComVO comc) throws IOException {
		// TODO Auto-generated method stub
		dao.insertCommunityCom(comc);
	}

}
