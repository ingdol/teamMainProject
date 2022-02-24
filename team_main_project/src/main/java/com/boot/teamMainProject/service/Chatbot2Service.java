package com.boot.teamMainProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IChatbotDAO;
import com.boot.teamMainProject.model.ChatbotVO;

@Service
public class Chatbot2Service implements IChatbotService {
	@Autowired
    @Qualifier("IChatbotDAO")
    IChatbotDAO dao;
	
	@Override
	public ArrayList<ChatbotVO> listAllChatbot(String apiURL, String secretKey)  {
		// TODO Auto-generated method stub
		return null;
	}

}
