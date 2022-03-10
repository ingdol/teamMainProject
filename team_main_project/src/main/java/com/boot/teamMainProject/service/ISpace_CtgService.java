package com.boot.teamMainProject.service;

import com.boot.teamMainProject.model.Space_CtgVO;

import java.util.ArrayList;

public interface ISpace_CtgService {
    ArrayList<Space_CtgVO> SpaceCtgName();
    ArrayList<Space_CtgVO> SpaceCtgNameForAll(String spaceNo);
    Space_CtgVO FindSpaceCtgName();
}
