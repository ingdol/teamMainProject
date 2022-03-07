package com.boot.teamMainProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpaceReviewController {
    @RequestMapping("WriteSpaceReview")
    public String WriteSpaceReview(Model model) {
        return "bch/WriteSpaceReview";
    }
}
