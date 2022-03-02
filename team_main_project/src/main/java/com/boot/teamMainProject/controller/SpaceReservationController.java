package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.SpaceReservationVO;
import com.boot.teamMainProject.model.SpaceReviewVO;
import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.model.Space_CtgVO;
import com.boot.teamMainProject.service.SpaceReservationService;
import com.boot.teamMainProject.service.SpaceReviewService;
import com.boot.teamMainProject.service.SpaceService;
import com.boot.teamMainProject.service.Space_CtgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

    // 공간 전체 페이지
    @RequestMapping("SpaceReservationAll")
    public String SpaceReservationAll(Model model) {
        ArrayList<SpaceVO> spaceList = service.listAllSpace();
        ArrayList<Space_CtgVO> spaceCtgName = space_ctgService.SpaceCtgName();
        model.addAttribute("spaceList", spaceList);
        model.addAttribute("spaceCtgName", spaceCtgName);
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
    public String detailViewSpace(@PathVariable String spaceNo, Model model) {
        SpaceVO space = service.detailSpace(spaceNo);
//        SpaceReviewVO spaceReview = spaceReviewService.spaceReview(spaceNo); // ArrayList로 동작해야 돌아감
        ArrayList<SpaceReviewVO> spaceReviewTest = spaceReviewService.spaceReviewTest(spaceNo);
        ArrayList<SpaceVO> spaceInfo = service.detailSpaceTest(spaceNo);
        model.addAttribute("space", space);
//        model.addAttribute("spaceReview", spaceReview); // ArrayList로 동작해야 돌아감
        model.addAttribute("spaceReviewTest", spaceReviewTest);
        model.addAttribute("spaceInfo", spaceInfo);
        return "bch/detailViewSpace";
    }
    // 공간 상세 페이지 (모임 일정 만드는 페이지에서 사용)
    @RequestMapping("/scheDetailViewSpace/{spaceNo}")
    public String scheDetailViewSpace(@PathVariable String spaceNo, Model model) {
        SpaceVO space = service.detailSpace(spaceNo);
        ArrayList<SpaceReviewVO> spaceReviewTest = spaceReviewService.spaceReviewTest(spaceNo);
        ArrayList<SpaceVO> spaceInfo = service.detailSpaceTest(spaceNo);
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

    // 예약 상세 페이지에서 예약 시간 조회
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
}