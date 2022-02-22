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
}