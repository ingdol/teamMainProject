package com.boot.teamMainProject.dao;

import com.boot.teamMainProject.model.GatherScheduleVO;

import java.util.ArrayList;

public interface IGatherScheduleDAO {
    void MakeGatherSchedule(GatherScheduleVO gatherScheduleVO);
    ArrayList<GatherScheduleVO> LoadGather_Sche(int gatNo); // 글 목록 보기 전용
    void updateViewCount(int gatScheNo);
    GatherScheduleVO LocdGather_Schedule(int gatNo); // 상세 보기 전용
}
