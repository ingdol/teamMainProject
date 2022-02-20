package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.Space_CtgVO;

import java.util.ArrayList;

public interface ISpace_CtgDAO {
    ArrayList<Space_CtgVO> SpaceCtgName();
    Space_CtgVO SpaceCtgNameforAll(String spaceNo);
}
