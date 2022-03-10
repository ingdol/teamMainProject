package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.ISpaceDAO;
import com.boot.teamMainProject.dao.ISpaceReservationDAO;
import com.boot.teamMainProject.model.SpaceReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

@Service
public class SpaceReservationService implements ISpaceReservationService{
    @Autowired
    @Qualifier("ISpaceReservationDAO")
    ISpaceReservationDAO dao;

    @Override
    public void SpaceReservation(SpaceReservationVO spaceReservationVO) {
        dao.SpaceReservation(spaceReservationVO);
    }

    @Override
    public ArrayList<SpaceReservationVO> CheckReservationTime(int spaceNo) {
        return dao.CheckReservationTime(spaceNo);
    }

    @Override
    public void ReservationComp(String memNick, String spaceTitle, int spaceNo, String date, String time, String time2, int spacePrice) {
        dao.ReservationComp(memNick, spaceTitle, spaceNo, date, time, time2, spacePrice);
    }

    @Override
    public void ReservationCompGather(int gatNo, String spaceTitle, String memNick, int spaceNo, String date, String time, String time2, int spacePrice) {
        dao.ReservationCompGather(gatNo, spaceTitle, memNick, spaceNo, date, time, time2, spacePrice);
    }

    @Override
    public void ReservationCompClass(int classNo, String spaceTitle, String memNick, int spaceNo, String date, String time, String time2, int spacePrice) {
        dao.ReservationCompClass(classNo, spaceTitle,  memNick, spaceNo, date, time, time2, spacePrice);
    }

    @Override
    public ArrayList<SpaceReservationVO> LookUpReservation(String memNick) {
        return dao.LookUpReservation(memNick);
    }

    @Override
    public void CancelSpaceReservation(int spaceReserNo) {
        dao.CancelSpaceReservation(spaceReserNo);
    }

    @Override
    public SpaceReservationVO LookUpReservationForReview(int spaceReserNo) {
        return dao.LookUpReservationForReview(spaceReserNo);
    }
}
