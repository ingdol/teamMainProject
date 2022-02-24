package com.boot.teamMainProject.service;

import java.util.ArrayList;

import com.boot.teamMainProject.model.ChatbotVO;

public interface IChatbotService {

	   ArrayList<ChatbotVO> listAllChatbot(String apiURL, String secretKey);   // 전체 조회
}
