package com.boot.teamMainProject.dao;

import java.util.ArrayList;

import com.boot.teamMainProject.model.ClassVO;


public interface IClassDAO {

   ArrayList<ClassVO> listAllClassBest();   // 전체 클래스 조회 - 베스트
   ArrayList<ClassVO> listAllClassNew();   // 전체 클래스 조회 - 신규
   
   
   // 서연
   ArrayList<ClassVO> listClass(String hobbyNo);
}