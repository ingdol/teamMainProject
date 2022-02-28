package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.GatherDetComDAO;
import com.boot.teamMainProject.model.GatherDetComVO;

@Service
public class CommentService implements ICommentService {
	@Inject
	private GatherDetComDAO dao;
	
	@Override
	public List<GatherDetComVO> readComment(int gatDetNo) throws Exception{
		// TODO Auto-generated method stub
		return dao.readComment(gatDetNo);
	}

	@Override
	public void insertGatDetCom(GatherDetComVO gatc) throws IOException {
		// TODO Auto-generated method stub
		dao.insertGatDetCom(gatc);
	}

	@Override
	public ArrayList<GatherDetComVO> CommentCountBoard(int gatDetNo) {
		// TODO Auto-generated method stub
		return dao.CommentCountBoard(gatDetNo);
	}

}
