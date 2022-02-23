package com.boot.teamMainProject.dao;

import java.util.ArrayList;

import com.boot.teamMainProject.model.ChatbotVO;

public interface IChatbotDAO {

	   ArrayList<ChatbotVO> listAllChatbot();   // 전체 조회
}
