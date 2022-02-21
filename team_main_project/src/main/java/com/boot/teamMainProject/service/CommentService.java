package com.boot.teamMainProject.service;

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

}
