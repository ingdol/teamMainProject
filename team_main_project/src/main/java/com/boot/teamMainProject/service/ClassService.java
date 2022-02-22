package com.boot.teamMainProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.IClassDAO;
import com.boot.teamMainProject.model.ClassVO;

@Service
public class ClassService implements IClassService {
   
   @Autowired
   @Qualifier("IClassDAO")
   IClassDAO dao;

   @Override
   public ArrayList<ClassVO> listAllClassBest() {
      return dao.listAllClassBest();
   }
   
   @Override
   public ArrayList<ClassVO> listAllClassNew() {
      return dao.listAllClassNew();
   }


   
   // 서연
   @Override
   public ArrayList<ClassVO> listClass(String hobbyNo) {
	   return dao.listClass(hobbyNo);
   }
   

}

