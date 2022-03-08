package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.SpaceReservationVO;

import java.util.ArrayList;
import java.util.Date;

public interface ISpaceReservationDAO {
    void SpaceReservation(SpaceReservationVO spaceReservationVO);
    ArrayList<SpaceReservationVO> CheckReservationTime(int spaceNo); // 예약 시간 체크
    void ReservationComp(String memNick, String spaceTitle, int spaceNo, String date, String time, String time2, int spacePrice); // 예약 하기(개인)
    void ReservationCompGather(int gatNo, String spaceTitle, String memNick, int spaceNo, String date, String time, String time2, int spacePrice); // 예약 하기(모임)
    void ReservationCompClass(int classNo,String spaceTitle,  String memNick, int spaceNo, String date, String time, String time2, int spacePrice); // 예약 하기(클래스)
    ArrayList<SpaceReservationVO> LookUpReservation(String memNick); // 예약한 공간 조회
    void CancelSpaceReservation(int spaceReserNo); // 공간 예약 취소
    SpaceReservationVO LookUpReservationForReview(int spaceReserNo); // 예약한 공간 조회 리뷰용
}
