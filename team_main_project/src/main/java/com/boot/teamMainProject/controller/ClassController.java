package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.*;
import com.boot.teamMainProject.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Objects;

@Controller
public class ClassController {
   @Autowired
   Class_ScheService service;
   @Autowired
   MemberService memberService;
   @Autowired
   SpaceReservationService reservationService;
   @Autowired
   GatheringService service3;

   // 모임 일정 신청 페이지
   @RequestMapping("ClassSchedule")
   public String ClassSchedule(HttpSession session, Model model) {
      String sid = (String) session.getAttribute("sid");
      MemberVO mem = memberService.detailViewMember(sid);

      model.addAttribute("mem", mem);
      return "bch/classSchedule";
   }

   // 모임 일정 신청 POST 공간 빌림.
   @ResponseBody
   @RequestMapping("WriteClassSchedule")
   public void WriteClassSchedule(@RequestParam("memNick") String memNick,
                                   @RequestParam("classNo") int classNo,
                                   @RequestParam("classScheTitle") String classScheTitle,
                                   @RequestParam("classScheDate") String classScheDate,
                                   @RequestParam("classScheTime") String classScheTime,
                                   @RequestParam("classScheMax") int classScheMax,
                                   @RequestParam("scheduleAddress") String scheduleAddress,
                                   @RequestParam("scheduleSpace") String scheduleSpace,
                                   @RequestParam("classScheSpace") String classScheSpace,
                                   @RequestParam("classScheInfo") String classScheInfo,
                                   @RequestParam("spaceNo") int spaceNo,
                                   @RequestParam("date") String date,
                                   @RequestParam("time") String time,
                                   @RequestParam("time2") String time2,
                                   @RequestParam("spacePrice") int spacePrice,
                                   @RequestParam("spaceTitle") String spaceTitle) throws ParseException {

      SimpleDateFormat Timeformatter = new SimpleDateFormat("HH:mm");
      Date StartTime = Timeformatter.parse(time);
      Date EndTime = Timeformatter.parse(time2);
      long diffMin = (EndTime.getTime() - StartTime.getTime()) / 60000; // 분 차이 계산

      spacePrice = Integer.parseInt(String.valueOf(diffMin*spacePrice));

      service.MakeClassSchedule(memNick, classNo, classScheTitle, classScheDate, classScheTime, classScheMax, scheduleAddress, scheduleSpace, classScheSpace, classScheInfo); // 모임 만들기
      reservationService.ReservationCompClass(classNo, spaceTitle, memNick, spaceNo, date, time, time2, spacePrice); // 공간 예약

   }

   // 모임 일정 신청 POST 공간 빌리지 않음.
   @ResponseBody
   @RequestMapping("WriteClassScheduleWithoutSpaceReser")
   public void WriteClassScheduleWithoutSpaceReser(@RequestParam("memNick") String memNick,
                                                    @RequestParam("classNo") int classNo,
                                                    @RequestParam("classScheTitle") String classScheTitle,
                                                    @RequestParam("classScheDate") String classScheDate,
                                                    @RequestParam("classScheTime") String classScheTime,
                                                    @RequestParam("classScheMax") int classScheMax,
                                                    @RequestParam("scheduleAddress") String scheduleAddress,
                                                    @RequestParam("scheduleSpace") String scheduleSpace,
                                                    @RequestParam("classScheSpace") String classScheSpace,
                                                    @RequestParam("classScheInfo") String classScheInfo) {
      service.MakeClassSchedule(memNick, classNo, classScheTitle, classScheDate, classScheTime, classScheMax, scheduleAddress, scheduleSpace, classScheSpace, classScheInfo); // 모임 만들기
   }

   // 모임 일정 공지
   @RequestMapping("ScheduleNoticeClass/{classNo}/{classScheNo}")
   public String ScheduleNoticeClass(@PathVariable int classNo, @PathVariable int classScheNo, Model model) {
//        ArrayList<GatherScheduleVO> gatherSchedule = scheduleService.LoadGather_Sche(gatNo); // bch
      GatheringVO gath = service3.detailViewSomoim(classNo);
      Class_ScheVO classSchedule = service.LoadClass_Schedule(classScheNo);
      ArrayList<Class_Sche_PerVO> ClassJoinPerson = service.ClassJoinPerson(classScheNo);
      model.addAttribute("gath", gath);
      model.addAttribute("classSchedule", classSchedule);
      model.addAttribute("ClassJoinPerson", ClassJoinPerson);
      service.updateViewCountForClass(classScheNo);
      return "bch/ClassNotice";
   }

   // 모임 참가 ajax
   @ResponseBody
   @RequestMapping("JoinClassPlan")
   public void JoinClassPlan(@RequestParam("ajaxMemNick") String ajaxMemNick,
                              @RequestParam("ajaxClassScheNo") int ajaxClassScheNo,
                              @RequestParam("ajaxClassNo") int ajaxClassNo,
                              HttpServletResponse response) throws IOException {
      int ScheduleMaxPerson = service.CheckMaxPersonForClass(ajaxClassScheNo);
      int SchedulePersonNow = service.ClassJoinNow(ajaxClassScheNo);
      System.out.println("모임 최대 인원 : " + ScheduleMaxPerson);
      System.out.println("현재 인원 : " + SchedulePersonNow);
      if(SchedulePersonNow >= ScheduleMaxPerson) {
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("인원이 초과되었습니다!");
         out.flush();
      }
      else {
         String ScheduleMemNick = service.CheckClassScheduleOverlap(ajaxClassScheNo, ajaxMemNick);
         if(Objects.equals(ScheduleMemNick, ajaxMemNick)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("이미 신청하셨습니다!");
            out.flush();
         }
         else {
            service.JoinClass(ajaxClassScheNo, ajaxClassNo, ajaxMemNick);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("신청 완료!");
            out.flush();
         }
      }
   }
   // 클래스 일정 삭제
   @ResponseBody
   @RequestMapping("DeleteClassSchedule")
   public Class_ScheVO DeleteClassSchedule(@RequestParam("ajaxClassScheNo") int ajaxClassScheNo) {
      Class_ScheVO class_scheVO = service.LoadClass_Schedule(ajaxClassScheNo);
//        int gatNo = gatherScheduleVO.getGatNo();
//        System.out.println("모임 번호 : " + gatNo);
      service.DeleteClassSchedule(ajaxClassScheNo);
      return class_scheVO;
   }
//   클래스 공간 예약 시작
}