package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.ISpace_CtgDAO;
import com.boot.teamMainProject.model.Space_CtgVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class Space_CtgService implements ISpace_CtgService {
//    @Setter(onMethod_ = {@Autowired})
    @Qualifier("ISpace_CtgDAO")
    ISpace_CtgDAO dao;

    @Override
    public ArrayList<Space_CtgVO> SpaceCtgName() {
        return dao.SpaceCtgName();
    }
}