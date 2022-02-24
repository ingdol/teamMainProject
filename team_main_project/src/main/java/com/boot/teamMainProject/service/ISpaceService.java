package com.boot.teamMainProject.service;

import com.boot.teamMainProject.model.SpaceVO;
import java.util.ArrayList;

public interface ISpaceService {
    ArrayList<SpaceVO> listAllSpace();
    ArrayList<SpaceVO> listFindSpace(String gatArea1, String state, String category, int maxPerson);
    SpaceVO detailSpace(String spaceNo);
    ArrayList<SpaceVO> detailSpaceTest(String spaceNo);
}