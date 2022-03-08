package com.boot.teamMainProject.service;

import com.boot.teamMainProject.model.SpaceReviewVO;
import com.boot.teamMainProject.model.SpaceVO;

import java.util.ArrayList;

public interface ISpaceReviewService {
    SpaceReviewVO spaceReview(String spaceNo);
    ArrayList<SpaceReviewVO> spaceReviewTest(String spaceNo);
    void WriteReview(int spaceNo, int spaceReserNo, String spaceRevTitle, String memNick, String spaceRevPhoto); // 리뷰 작성
    ArrayList<SpaceReviewVO> LookUpSpaceReview(int spaceReserNo);
    SpaceReviewVO CheckReview(int spaceReserNo); // 리뷰가 있는지 체크
}
