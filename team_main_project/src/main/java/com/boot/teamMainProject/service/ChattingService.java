package com.boot.teamMainProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IChattingDAO;
import com.boot.teamMainProject.model.ChattingVO;

@Service
public class ChattingService implements IChattingDAO {
	@Autowired
    @Qualifier("IChattingDAO")
	IChattingDAO dao;
	
	@Override
	public ChattingVO detailChatting(String gatNo) {
		return dao.detailChatting(gatNo);
	}

}
