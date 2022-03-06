package com.boot.teamMainProject.service;

import com.boot.teamMainProject.model.Class_ScheVO;
import com.boot.teamMainProject.model.Class_Sche_PerVO;

import java.util.ArrayList;

public interface IClass_ScheService {
    void MakeClassSchedule(String memNick, int classNo, String classScheTitle, String classScheDate, String classScheTime, int classScheMax, String scheduleAddress, String scheduleSpace, String classScheSpace, String classScheInfo);// 일정 만들기
    ArrayList<Class_ScheVO> LoadClass_Sche(int classNo); // 글 목록 보기 전용
    void updateViewCountForClass(int classScheNo);
    Class_ScheVO LoadClass_Schedule(int classScheNo); // 상세 보기 전용
    int CheckMaxPersonForClass(int classScheNo); // 모임 최대 인원 검색
    int ClassJoinNow(int classScheNo); // 현재 참가 인원 검색
    ArrayList<Class_Sche_PerVO> ClassJoinPerson(int classScheNo); // 현재 참가인원 조회
    void JoinClass(int classScheNo, int classNo, String memNick); // 모임 참가 버튼
    String CheckClassScheduleOverlap(int classScheNo, String memNick); // 모임 중복 참가 막기
    void DeleteClassSchedule(int classScheNo); // 클래스 모임 일정 삭제
}
