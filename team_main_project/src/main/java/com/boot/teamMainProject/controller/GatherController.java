package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.*;
import com.boot.teamMainProject.service.GatherScheduleService;
import com.boot.teamMainProject.service.GatheringService;
import com.boot.teamMainProject.service.SpaceReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@Controller
public class GatherController {
    @Autowired
    GatherScheduleService service;
    @Autowired
    SpaceReservationService reservationService;
    @Autowired
    GatherScheduleService scheduleService;
    @Autowired
    GatheringService service3;

    // 모임 일정 신청 페이지
    @RequestMapping("GatherSchedule")
    public String GatherSchedule() {
        return "bch/gatherSchedule";
    }

    // 모임 일정 신청 POST
    @RequestMapping("WriteGatherSchedule/{gatNo}")
    public String WriteGatherSchedule(GatherScheduleVO gatherScheduleVO, SpaceReservationVO spaceReservationVO) {
        service.MakeGatherSchedule(gatherScheduleVO);
        reservationService.SpaceReservation(spaceReservationVO);
        return "redirect:/sun/detailgat/{gatNo}";
    }

    // 모임 일정 신청 POST
    @RequestMapping("WriteGatherScheduleWithoutSpaceReser/{gatNo}")
    public String WriteGatherScheduleWithoutSpaceReser(GatherScheduleVO gatherScheduleVO) {
        service.MakeGatherSchedule(gatherScheduleVO);
        return "redirect:/sun/detailgat/{gatNo}";
    }

    // 모임 일정 공지
    @RequestMapping("ScheduleNotice/{gatNo}/{gatScheNo}")
    public String ScheduleNotice(@PathVariable int gatNo, @PathVariable int gatScheNo, Model model) {
//        ArrayList<GatherScheduleVO> gatherSchedule = scheduleService.LoadGather_Sche(gatNo); // bch
        GatheringVO gath = service3.detailViewSomoim(gatNo);
        GatherScheduleVO gatherSchedule = scheduleService.LocdGather_Schedule(gatScheNo);
        ArrayList<Gather_Sche_PerVO> GatherJoinPerson = scheduleService.GatherJoinPerson(gatScheNo);
        model.addAttribute("gath", gath);
        model.addAttribute("gatherSchedule", gatherSchedule);
        model.addAttribute("GatherJoinPerson", GatherJoinPerson);
        scheduleService.updateViewCount(gatScheNo);
        return "bch/scheduleNotice";
    }

    // 모임 참가 ajax
    @ResponseBody
    @RequestMapping("JoinGatherPlan")
    public void JoinGatherPlan(@RequestParam("ajaxMemNick") String ajaxMemNick,
                               @RequestParam("ajaxGatScheNo") int ajaxGatScheNo,
                               @RequestParam("ajaxGatNo") int ajaxGatNo,
                               HttpServletResponse response) throws IOException {
        int ScheduleMaxPerson = scheduleService.CheckMaxPerson(ajaxGatScheNo);
        int SchedulePersonNow = scheduleService.GatherJoinNow(ajaxGatScheNo);
        System.out.println("모임 최대 인원 : " + ScheduleMaxPerson);
        System.out.println("현재 인원 : " + SchedulePersonNow);
        if(SchedulePersonNow >= ScheduleMaxPerson) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("인원이 초과되었습니다!");
            out.flush();
        }
        else {
            scheduleService.JoinGather(ajaxGatScheNo, ajaxGatNo, ajaxMemNick);
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("신청 완료!");
            out.flush();

        }
    }
}
