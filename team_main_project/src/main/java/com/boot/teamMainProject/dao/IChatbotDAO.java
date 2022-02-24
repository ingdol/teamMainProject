package com.boot.teamMainProject.dao;

import java.util.ArrayList;

import com.boot.teamMainProject.model.ChatbotVO;

public interface IChatbotDAO {

	   ArrayList<ChatbotVO> listAllChatbot(String apiURL, String secretKey) ;   // 전체 조회
}
