package com.boot.teamMainProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.boot.teamMainProject.service.ClassService;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassController {
   @Autowired
   ClassService service;

   // 모임 일정 신청 페이지(bch)
   @RequestMapping("ClassSchedule")
   public String GatherSchedule() {
      return "bch/classSchedule";
   }

}
