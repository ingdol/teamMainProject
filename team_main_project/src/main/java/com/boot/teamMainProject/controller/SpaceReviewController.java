package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.SpaceReservationVO;
import com.boot.teamMainProject.service.SpaceReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SpaceReviewController {
    @Autowired
    SpaceReservationService reservationService;

    @RequestMapping("mypage/{memNick}")
    public String MyPage(@PathVariable String memNick, Model model) {
        ArrayList<SpaceReservationVO> ReservationList = reservationService.LookUpReservation(memNick); // 내가 예약한 공간 조회
        model.addAttribute("ReservationList", ReservationList);

        return "bch/myPage";
    }

    @RequestMapping("WriteSpaceReview/{spaceReserNo}")
    public String WriteSpaceReview(Model model, @PathVariable int spaceReserNo) {
        SpaceReservationVO SpaceInfo = reservationService.LookUpReservationForReview(spaceReserNo);
        model.addAttribute("SpaceInfo", SpaceInfo);
        return "bch/WriteSpaceReview";
    }

    @PostMapping("SaveReview")
    public String SaveReview(@RequestParam("files") List<MultipartFile> files, @RequestParam("ReviewArea") String ReviewArea, @RequestParam("memNick") String memNick) throws Exception {
        String basePath = "/Users/gobyeongchae/Desktop/test";
        String originalName = "";
        if(files != null) {
            // 파일 업로드(여러개) 처리 부분
            for (MultipartFile file : files) {
                originalName = file.getOriginalFilename();
                String filePath = basePath + "/" + originalName;
                System.out.println(originalName);
                System.out.println(filePath);
                File dest = new File(filePath);
                file.transferTo(dest);
            }
            String name = originalName;
            System.out.println(name);
            System.out.println(ReviewArea);
        }
        else {

        }
        return "redirect:/mypage/"+memNick;
    }
}