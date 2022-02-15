package com.boot.teamMainProject.service;

import com.boot.teamMainProject.model.SpaceVO;
import java.util.ArrayList;

public interface ISpaceService {
    ArrayList<SpaceVO> listAllSpace();
    ArrayList<SpaceVO> listFindSpace(String location, String category, int maxPerson);
}