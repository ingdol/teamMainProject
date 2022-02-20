package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.SpaceReviewVO;
import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.model.Space_CtgVO;
import com.boot.teamMainProject.service.SpaceReviewService;
import com.boot.teamMainProject.service.SpaceService;
import com.boot.teamMainProject.service.Space_CtgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
public class SpaceReservationController {
    @Autowired
    SpaceService service;
    @Autowired
    Space_CtgService space_ctgService;
    @Autowired
    SpaceReviewService spaceReviewService;

    // 공간 전체 페이지
    @RequestMapping("SpaceReservationAll")
    public String SpaceReservationAll(Model model) {
        ArrayList<SpaceVO> spaceList = service.listAllSpace();
        ArrayList<Space_CtgVO> spaceCtgName = space_ctgService.SpaceCtgName();
        model.addAttribute("spaceList", spaceList);
        model.addAttribute("spaceCtgName", spaceCtgName);
        return "bch/spaceReservationAll";
    }
    // 공간 전체페이지 카테고리 이름 찾기 (현재 동작 x)
    @ResponseBody
    @RequestMapping("transferCtgName")
    public Space_CtgVO transferCtgName(Model model,
                                       @RequestParam("spaceNoForCtgName") String spaceNo) {
        Space_CtgVO SpaceCtgNameforAll = space_ctgService.SpaceCtgNameforAll(spaceNo);
        model.addAttribute("SpaceCtgNameforAll", SpaceCtgNameforAll);
        return SpaceCtgNameforAll;
    }

    // 조건 상세 조회
    @ResponseBody
    @RequestMapping(value = "findConstraint")
    public ArrayList<SpaceVO> findConstraint(Model model,
                                             @RequestParam("location") String location,
                                             @RequestParam("category") String category,
                                             @RequestParam("maxPerson") int maxPerson) {
        ArrayList<SpaceVO> constraintSpaceList = service.listFindSpace(location, category, maxPerson);
        model.addAttribute("constraintSpaceList", constraintSpaceList);
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
        SpaceReviewVO spaceReview = spaceReviewService.spaceReview(spaceNo);
        model.addAttribute("space", space);
        model.addAttribute("spaceReview", spaceReview);
        return "bch/detailViewSpace";
    }
    // test Page
    @RequestMapping("/test")
    public String test() {
        return "bch/test";
    }
}