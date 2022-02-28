package com.boot.teamMainProject.service;

import com.boot.teamMainProject.model.GatherScheduleVO;

import java.util.ArrayList;

public interface IGatherScheduleService {
    void MakeGatherSchedule(GatherScheduleVO gatherScheduleVO);
    ArrayList<GatherScheduleVO> LoadGather_Sche(int gatNo); // 글 목록 보기 전용
    void updateViewCount(int gatScheNo);
    GatherScheduleVO LocdGather_Schedule(int gatNo); // 상세 보기 전용
    int CheckMaxPerson(int gatScheNo); // 모임 최대 인원 검색
    int GatherJoinNow(int gatScheNo); // 현재 참가 인원 검색
}
