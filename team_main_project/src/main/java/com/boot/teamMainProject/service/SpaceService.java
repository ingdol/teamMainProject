package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.ISpaceDAO;
import com.boot.teamMainProject.model.SpaceVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
}