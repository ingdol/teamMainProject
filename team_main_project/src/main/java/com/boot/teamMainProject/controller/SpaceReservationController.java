package com.boot.teamMainProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpaceReservationController {
    @RequestMapping("SpaceReservationAll")
    public String SpaceReservationAll() {
        return "bch/spaceReservationAll";
    }
}