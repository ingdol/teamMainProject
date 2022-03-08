package com.boot.teamMainProject.service;

import java.util.ArrayList;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.ISpaceReviewDAO;
import com.boot.teamMainProject.model.SpaceReviewVO;

@Service
public class SpaceReviewService implements ISpaceReviewService{

//    @Setter(onMethod_ = {@Autowired})
    @Autowired
    @Qualifier("ISpaceReviewDAO")
    ISpaceReviewDAO dao;

    @Override
    public SpaceReviewVO spaceReview(String spaceNo) {
        return dao.spaceReview(spaceNo);
    }

    @Override
    public ArrayList<SpaceReviewVO> spaceReviewTest(String spaceNo) {
        return dao.spaceReviewTest(spaceNo);
    }

    @Override
    public void WriteReview(int spaceNo, int spaceReserNo, String spaceRevTitle, String memNick, String spaceRevPhoto) {
        dao.WriteReview(spaceNo, spaceReserNo, spaceRevTitle, memNick, spaceRevPhoto);
    }

    @Override
    public ArrayList<SpaceReviewVO> LookUpSpaceReview(int spaceReserNo) {
        return dao.LookUpSpaceReview(spaceReserNo);
    }

    @Override
    public SpaceReviewVO CheckReview(int spaceReserNo) {
        return dao.CheckReview(spaceReserNo);
    }
}
