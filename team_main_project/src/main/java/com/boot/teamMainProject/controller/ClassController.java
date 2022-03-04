package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.model.SpaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.boot.teamMainProject.service.ClassService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class ClassController {
   @Autowired
   ClassService service;

   // 모임 일정 신청 페이지(bch)
   @RequestMapping("VIewAllClass")
   public String GatherSchedule(Model model) {
      ArrayList<ClassVO> classList = service.listall();
      model.addAttribute("classList", classList);
      return "bch/classAll";
   }
   // 조건 상세 조회
   @ResponseBody
   @RequestMapping(value = "findConstraintClass")
   public ArrayList<ClassVO> findConstraintClass(Model model,
                                            @RequestParam("gatArea1") String gatArea1,
                                            @RequestParam("state") String state,
                                            @RequestParam("category") String category,
                                            @RequestParam("maxPerson") int maxPerson) {
      ArrayList<ClassVO> constraintClassList = service.listFindClass(gatArea1, state, category);
//        model.addAttribute("constraintSpaceList", constraintSpaceList);
      return constraintClassList;
   }
}