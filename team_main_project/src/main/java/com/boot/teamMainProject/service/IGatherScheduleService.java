package com.boot.teamMainProject.service;

import com.boot.teamMainProject.model.GatherScheduleVO;
import com.boot.teamMainProject.model.Gather_Sche_PerVO;

import java.util.ArrayList;

public interface IGatherScheduleService {
    void MakeGatherSchedule(String memNick, int gatNo, String gatScheTitle, String gatScheDate, String gatScheTime, int gatScheMax, String scheduleAddress, String scheduleSpace, String gatScheSpace, String gatScheInfo);// 일정 만들기
    ArrayList<GatherScheduleVO> LoadGather_Sche(int gatNo); // 글 목록 보기 전용
    void updateViewCount(int gatScheNo);
    GatherScheduleVO LocdGather_Schedule(int gatNo); // 상세 보기 전용
    int CheckMaxPerson(int gatScheNo); // 모임 최대 인원 검색
    int GatherJoinNow(int gatScheNo); // 현재 참가 인원 검색
    ArrayList<Gather_Sche_PerVO> GatherJoinPerson(int gatScheNo); // 현재 참가인원 조회
    void JoinGather(int gatScheNo, int gatNo, String memNick); // 모임 참가 버튼
    String CheckGatherScheduleOverlap(int gatScheNo, String memNick); // 모임 중복 참가 막기
    void DeleteGatherSchedule(int gatScheNo); // 모임 글 삭제
}
