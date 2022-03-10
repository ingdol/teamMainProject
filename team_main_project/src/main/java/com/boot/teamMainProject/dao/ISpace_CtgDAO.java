package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.Space_CtgVO;

import java.util.ArrayList;

public interface ISpace_CtgDAO {
    ArrayList<Space_CtgVO> SpaceCtgName();
    ArrayList<Space_CtgVO> SpaceCtgNameForAll(String spaceNo);
    Space_CtgVO FindSpaceCtgName(String spaceCtgNo);
}
