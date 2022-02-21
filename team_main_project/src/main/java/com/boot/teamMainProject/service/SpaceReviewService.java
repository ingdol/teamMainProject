package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.ISpaceReviewDAO;
import com.boot.teamMainProject.dao.ISpace_CtgDAO;
import com.boot.teamMainProject.model.SpaceReviewVO;
import com.boot.teamMainProject.model.SpaceVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SpaceReviewService implements ISpaceReviewService{
    @Setter(onMethod_ = {@Autowired})
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