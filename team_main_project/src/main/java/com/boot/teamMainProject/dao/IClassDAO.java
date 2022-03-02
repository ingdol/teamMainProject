package com.boot.teamMainProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.teamMainProject.model.ClassVO;


public interface IClassDAO {

   ArrayList<ClassVO> listAllClassBest();   // 전체 클래스 조회 - 베스트
   ArrayList<ClassVO> listAllClassNew();   // 전체 클래스 조회 - 신규
   ArrayList<ClassVO> classSearch(HashMap<String, Object> map); // 클래스 검색
   
   // 서연
   ArrayList<ClassVO> listClass(String hobbyNo);
   ArrayList<ClassVO> listall();
   ArrayList<ClassVO> listClassdatemax(String hobbyNo);
   ArrayList<ClassVO> listalldatemax();
   ArrayList<ClassVO> classinfo(int classNo);
}
