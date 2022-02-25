package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.GatherScheduleVO;
import com.boot.teamMainProject.model.SpaceReservationVO;
import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.model.Space_CtgVO;
import com.boot.teamMainProject.service.GatherScheduleService;
import com.boot.teamMainProject.service.SpaceReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class GatherController {
    @Autowired
    GatherScheduleService service;
    @Autowired
    SpaceReservationService reservationService;

    // 모임 일정 신청 페이지
    @RequestMapping("GatherSchedule")
    public String GatherSchedule() {
        return "bch/gatherSchedule";
    }
    @ResponseBody
    @RequestMapping("sendForm")
    public String sendForm() {

        return "bch/gatherSchedule";
    }

    // 모임 일정 신청 POST
    @RequestMapping("WriteGatherSchedule")
    public String WriteGatherSchedule(GatherScheduleVO gatherScheduleVO, SpaceReservationVO spaceReservationVO) {
        service.MakeGatherSchedule(gatherScheduleVO);
        reservationService.SpaceReservation(spaceReservationVO);
        return "redirect:/";
    }
}
