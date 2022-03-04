package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.*;
import com.boot.teamMainProject.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Objects;

@Controller
public class SpaceReservationController {
    @Autowired
    SpaceService service;
    @Autowired
    Space_CtgService space_ctgService;
    @Autowired
    SpaceReviewService spaceReviewService;
    @Autowired
    SpaceReservationService reservationService;
    @Autowired
    MemberService memberService;

    // 공간 전체 페이지
    @RequestMapping("SpaceReservationAll")
    public String SpaceReservationAll(Model model) {
//        ArrayList<SpaceVO> spaceList = service.listAllSpace();
//        ArrayList<Space_CtgVO> spaceCtgName = space_ctgService.SpaceCtgName();
//        model.addAttribute("spaceList", spaceList);
////        model.addAttribute("spaceCtgName", spaceCtgName);
        return "bch/spaceReservationAll";
    }
    // 공간 전체 페이지(모임 일정 만드는 페이지에서 사용)
    @RequestMapping("ScheSpaceReservationAll")
    public String ScheSpaceReservationAll(Model model) {
        ArrayList<SpaceVO> spaceList = service.listAllSpace();
        ArrayList<Space_CtgVO> spaceCtgName = space_ctgService.SpaceCtgName();
        model.addAttribute("spaceList", spaceList);
        model.addAttribute("spaceCtgName", spaceCtgName);
        return "bch/scheSpaceReservationAll";
    }
    // 공간 전체페이지 카테고리 이름 찾기 (현재 동작 x)
//    @ResponseBody
//    @RequestMapping("transferCtgName")
//    public Space_CtgVO transferCtgName(Model model,
//                                       @RequestParam("spaceNoForCtgName") String spaceNo) {
//        Space_CtgVO SpaceCtgNameforAll = space_ctgService.SpaceCtgNameforAll(spaceNo);
//        model.addAttribute("SpaceCtgNameforAll", SpaceCtgNameforAll);
//        return SpaceCtgNameforAll;
//    }

    // 조건 상세 조회
    @ResponseBody
    @RequestMapping(value = "findConstraint")
    public ArrayList<SpaceVO> findConstraint(Model model,
                                             @RequestParam("gatArea1") String gatArea1,
                                             @RequestParam("state") String state,
                                             @RequestParam("category") String category,
                                             @RequestParam("maxPerson") int maxPerson) {
        ArrayList<SpaceVO> constraintSpaceList = service.listFindSpace(gatArea1, state, category, maxPerson);
//        model.addAttribute("constraintSpaceList", constraintSpaceList);
        return constraintSpaceList;
    }
    // 조건 상세 조회 할 때 카테고리 이름 조회(화면에 공간 유형 띄우기 위함.)
    @ResponseBody
    @RequestMapping(value = "constraintCtg")
    public ArrayList<Space_CtgVO> constraintCtg(Model model) {
        ArrayList<Space_CtgVO> spaceCtgName = space_ctgService.SpaceCtgName();
        model.addAttribute("spaceCtgName", spaceCtgName);
        return spaceCtgName;
    }
    // 공간 상세 페이지
    @RequestMapping("/detailViewSpace/{spaceNo}")
    public String detailViewSpace(@PathVariable String spaceNo, Model model, HttpSession session, HttpServletResponse write) throws IOException {

//        String sidNick = (String) session.getAttribute("sidNick");
//        if(sidNick == null) {
//            write.setContentType("text/html; charset=UTF-8");
//            PrintWriter out_write = write.getWriter();
//            out_write.println("<script>alert('회원만 사용 가능한 기능입니다.');</script>");
//            out_write.flush();
//
//            return "/pdh/login";
//        }
//        else {
        String sid = (String) session.getAttribute("sid");
        MemberVO mem = memberService.detailViewMember(sid);
        model.addAttribute("mem", mem);

            SpaceVO space = service.detailSpace(spaceNo);
            ArrayList<SpaceReviewVO> spaceReviewTest = spaceReviewService.spaceReviewTest(spaceNo);
            ArrayList<SpaceVO> spaceInfo = service.detailSpaceTest(spaceNo);
            model.addAttribute("space", space);
            model.addAttribute("spaceReviewTest", spaceReviewTest);
            model.addAttribute("spaceInfo", spaceInfo);
            return "bch/detailViewSpace";
//        }
    }
    // 공간 상세 페이지 (모임 일정 만드는 페이지에서 사용)
    @RequestMapping("/scheDetailViewSpace/{spaceNo}")
    public String scheDetailViewSpace(@PathVariable String spaceNo, Model model, HttpSession session) {
        SpaceVO space = service.detailSpace(spaceNo);
        ArrayList<SpaceReviewVO> spaceReviewTest = spaceReviewService.spaceReviewTest(spaceNo);
        ArrayList<SpaceVO> spaceInfo = service.detailSpaceTest(spaceNo);
        String sid = (String) session.getAttribute("sid");
        MemberVO mem = memberService.detailViewMember(sid);
        model.addAttribute("mem", mem);
        model.addAttribute("space", space);
        model.addAttribute("spaceReviewTest", spaceReviewTest);
        model.addAttribute("spaceInfo", spaceInfo);
        return "bch/scheDetailViewSpace";
    }
    // test Page
    @RequestMapping("/test")
    public String test() {
        return "bch/test";
    }

    // 공간 상세 페이지에서 예약 시간 조회
    @ResponseBody
    @RequestMapping("CheckReservationTime")
    public ArrayList<SpaceReservationVO> CheckReservationTime(@RequestParam("spaceNo") int spaceNo){
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        SimpleDateFormat Timeformatter = new SimpleDateFormat("HH:mm");
//        Date date = formatter.parse(spaceDate);
//        Date StartTime = Timeformatter.parse(spaceStartTime);
//        Date EndTime = Timeformatter.parse(spaceEndTime);
        ArrayList<SpaceReservationVO> CheckReservation = reservationService.CheckReservationTime(spaceNo);
        return CheckReservation;
    }
    // 공간 상세 페이지에서 예약 공간 하기
    @ResponseBody
    @RequestMapping("ReservationComp")
    public String ReservationComp(@RequestParam("date") String date,
                                @RequestParam("time") String time,
                                @RequestParam("time2") String time2,
                                @RequestParam("memNick") String memNick,
                                @RequestParam("spacePrice") int spacePrice,
                                @RequestParam("spaceNo") int spaceNo,
                                HttpSession session,
                                HttpServletResponse write) throws ParseException, IOException {

        if(Objects.equals(memNick, "null")) {
            write.setContentType("text/html; charset=UTF-8");
            PrintWriter out_write = write.getWriter();
            out_write.println("<script>alert('회원만 사용 가능한 기능입니다.');</script>");
            out_write.flush();

            return "/pdh/login";
        }
        else {
            SimpleDateFormat Timeformatter = new SimpleDateFormat("HH:mm");
            Date StartTime = Timeformatter.parse(time);
            Date EndTime = Timeformatter.parse(time2);
            long diffMin = (EndTime.getTime() - StartTime.getTime()) / 60000; // 분 차이 계산

            spacePrice = Integer.parseInt(String.valueOf(diffMin*spacePrice));
            reservationService.ReservationComp(memNick, spaceNo, date, time, time2, spacePrice);
            return "/sej/main";
        }
    }
}