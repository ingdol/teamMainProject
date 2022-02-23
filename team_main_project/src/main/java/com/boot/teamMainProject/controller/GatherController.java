package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.model.Space_CtgVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
public class GatherController {
    // 공간 전체 페이지
    @RequestMapping("GatherSchedule")
    public String GatherSchedule(Model model) {
        return "bch/gatherSchedule";
    }
}
