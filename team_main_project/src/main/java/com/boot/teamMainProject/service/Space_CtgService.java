package com.boot.teamMainProject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boot.teamMainProject.dao.ISpace_CtgDAO;
import com.boot.teamMainProject.model.Space_CtgVO;

@Service
public class Space_CtgService implements ISpace_CtgService {

//	@Setter(onMethod_ = {@Autowired})

    @Qualifier("ISpace_CtgDAO")
    ISpace_CtgDAO dao;

    @Override
    public ArrayList<Space_CtgVO> SpaceCtgName() {
        return dao.SpaceCtgName();
    }

    @Override
    public ArrayList<Space_CtgVO> SpaceCtgNameForAll(String spaceNo) {
        return dao.SpaceCtgNameForAll(spaceNo);
    }
}