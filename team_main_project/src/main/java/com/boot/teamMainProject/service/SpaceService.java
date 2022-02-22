package com.boot.teamMainProject.service;

import java.util.ArrayList;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.ISpaceDAO;
import com.boot.teamMainProject.model.SpaceVO;

@Service
public class SpaceService implements ISpaceService {

    @Setter(onMethod_ = {@Autowired})
    @Qualifier("ISpaceDAO")
    ISpaceDAO dao;

    @Override
    public ArrayList<SpaceVO> listAllSpace() {
        return dao.listAllSpace();
    }

    @Override
    public ArrayList<SpaceVO> listFindSpace(String location, String category, int maxPerson) {
        return dao.listFindSpace(location, category, maxPerson);
    }
    @Override
    public SpaceVO detailSpace(String spaceNo) {
        return dao.detailSpace(spaceNo);
    }

    @Override
    public ArrayList<SpaceVO> detailSpaceTest(String spaceNo) {
        return dao.detailSpaceTest(spaceNo);
    }
}