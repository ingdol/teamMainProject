package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.SpaceReservationVO;

import java.util.ArrayList;
import java.util.Date;

public interface ISpaceReservationDAO {
    void SpaceReservation(SpaceReservationVO spaceReservationVO);
    ArrayList<SpaceReservationVO> CheckReservationTime(int spaceNo); // 예약 시간 체크
    void ReservationComp(String memNick, int spaceNo, String date, String time, String time2, int spacePrice); // 예약 하기(개인)
    void ReservationCompGather(int gatNo, String memNick, int spaceNo, String date, String time, String time2, int spacePrice); // 예약 하기(모임)
}
