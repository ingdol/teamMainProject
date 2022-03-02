package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.SpaceReservationVO;

import java.util.ArrayList;
import java.util.Date;

public interface ISpaceReservationDAO {
    void SpaceReservation(SpaceReservationVO spaceReservationVO);
    ArrayList<SpaceReservationVO> CheckReservationTime(int spaceNo); // 예약 시간 체크
}
