package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.SpaceVO;
import java.util.ArrayList;

public interface ISpaceDAO {
    ArrayList<SpaceVO> listAllSpace();
    ArrayList<SpaceVO> listFindSpace(String gatArea1, String state, String category, int maxPerson);
    SpaceVO detailSpace(String spaceNo);
    ArrayList<SpaceVO> detailSpaceTest(String spaceNo);
}
