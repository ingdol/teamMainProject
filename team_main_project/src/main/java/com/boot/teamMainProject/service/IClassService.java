package com.boot.teamMainProject.service;

import java.util.ArrayList;

import com.boot.teamMainProject.model.ClassVO;

public interface IClassService {

   ArrayList<ClassVO> listAllClassBest();   // 전체 클래스 조회 - 베스트
   ArrayList<ClassVO> listAllClassNew();   // 전체 클래스 조회 - 신규
   
   
   // 서연
   ArrayList<ClassVO> listClass(String hobbyNo);
   ArrayList<ClassVO> listall();
   ArrayList<ClassVO> listClassdatemax(String hobbyNo);
   ArrayList<ClassVO> listalldatemax();
}
