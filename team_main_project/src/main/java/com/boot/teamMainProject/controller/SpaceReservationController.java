package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.service.SpaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.ArrayList;

@Controller
public class SpaceReservationController {
    @Autowired
    SpaceService service;

    @RequestMapping("SpaceReservationAll")
    public String SpaceReservationAll(Model model) {
        ArrayList<SpaceVO> spaceList = service.listAllSpace();
        model.addAttribute("spaceList", spaceList);
        return "bch/spaceReservationAll";
    }
}