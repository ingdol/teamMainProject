package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.model.Space_CtgVO;
import com.boot.teamMainProject.service.SpaceService;
import com.boot.teamMainProject.service.Space_CtgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
public class SpaceReservationController {
    @Autowired
    SpaceService service;
    @Autowired
    Space_CtgService space_ctgService;

    @RequestMapping("SpaceReservationAll")
    public String SpaceReservationAll(Model model) {
        ArrayList<SpaceVO> spaceList = service.listAllSpace();
        ArrayList<Space_CtgVO> spaceCtgName = space_ctgService.SpaceCtgName();
        model.addAttribute("spaceList", spaceList);
        model.addAttribute("spaceCtgName", spaceCtgName);
        return "bch/spaceReservationAll";
    }
    @RequestMapping("findConstraint")
    public ArrayList<SpaceVO> findConstraint(Model model, @RequestParam("location") String location, @RequestParam("category") String category, @RequestParam("maxPerson") int maxPerson) {
        ArrayList<SpaceVO> constraintSpaceList = service.listFindSpace(location, category, maxPerson);
        model.addAttribute("constraintSpaceList", constraintSpaceList);
        return constraintSpaceList;
    }
}