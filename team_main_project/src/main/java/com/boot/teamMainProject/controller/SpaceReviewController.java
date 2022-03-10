package com.boot.teamMainProject.controller;

import com.boot.teamMainProject.model.SpaceReservationVO;
import com.boot.teamMainProject.model.SpaceReviewVO;
import com.boot.teamMainProject.service.SpaceReservationService;
import com.boot.teamMainProject.service.SpaceReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class SpaceReviewController {
    @Autowired
    SpaceReservationService reservationService;
    @Autowired
    SpaceReviewService reviewService;

    @RequestMapping("mypage/{memNick}")
    public String MyPage(@PathVariable String memNick, Model model) {
        ArrayList<SpaceReservationVO> ReservationList = reservationService.LookUpReservation(memNick); // 내가 예약한 공간 조회
        model.addAttribute("ReservationList", ReservationList);

        return "bch/myPage";
    }

    @RequestMapping("WriteSpaceReview/{spaceReserNo}")
    public String WriteSpaceReview(Model model, @PathVariable int spaceReserNo, HttpSession session, HttpServletResponse response) throws IOException {
        SpaceReservationVO SpaceInfo = reservationService.LookUpReservationForReview(spaceReserNo);
        SpaceReviewVO checkReview = reviewService.CheckReview(spaceReserNo);
        String snick = (String) session.getAttribute("snick");
        if(checkReview == null) {
            model.addAttribute("SpaceInfo", SpaceInfo);
            return "bch/WriteSpaceReview";
        }
        else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script language='javascript'>");
            out.println("alert('이미 리뷰를 작성하셨습니다.')");
            out.println("</script>");
            out.flush();

            return "bch/redirect";
        }
    }

    @RequestMapping("SaveReview")
    public String SaveReview(@RequestParam("files") List<MultipartFile> files,
                             @RequestParam("ReviewArea") String ReviewArea,
                             @RequestParam("memNick") String memNick,
                             @RequestParam("spaceNo") int spaceNo,
                             @RequestParam("spaceReserNo") int spaceReserNo) throws Exception {
        String basePath = "/upload";
        String originalName = "";
        StringBuilder name = new StringBuilder();
        System.out.println(files.size());
        if(files.size() >= 1) {
            // 파일 업로드(여러개) 처리 부분
            for (MultipartFile file : files) {
                originalName = Objects.requireNonNull(file.getOriginalFilename()).replace(" ", "");
                String filePath = basePath + "/" + originalName;
                if(originalName.equals("")) { // 파일 아에 없을 때도 size가 1이라 orginalName이 공백이면 작동
                    System.out.println(originalName);
                }
                // 파일 1개 일 때도 size가 1로 들어와서 파일이 1개 있을 때 else문 작동
                else {
                    File dest = new File(filePath);
                    file.transferTo(dest);
                }
                name.append(originalName).append(" ");
            }
            reviewService.WriteReview(spaceNo, spaceReserNo, ReviewArea, memNick, name.toString());
        }
        return "redirect:/mypage/"+memNick;
    }
}
