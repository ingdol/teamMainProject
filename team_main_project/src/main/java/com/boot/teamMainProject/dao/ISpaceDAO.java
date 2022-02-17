package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.SpaceVO;
import java.util.ArrayList;

public interface ISpaceDAO {
    ArrayList<SpaceVO> listAllSpace();
    ArrayList<SpaceVO> listFindSpace(String location, String category, int maxPerson);
}
