package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.ISpaceDAO;
import com.boot.teamMainProject.dao.ISpaceReservationDAO;
import com.boot.teamMainProject.model.SpaceReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class SpaceReservationService implements ISpaceReservationService{
    @Autowired
    @Qualifier("ISpaceReservationDAO")
    ISpaceReservationDAO dao;

    @Override
    public void SpaceReservation(SpaceReservationVO spaceReservationVO) {
        dao.SpaceReservation(spaceReservationVO);
    }
}
