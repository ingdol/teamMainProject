package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.IGatherScheduleDAO;
import com.boot.teamMainProject.model.GatherScheduleVO;
import com.boot.teamMainProject.model.Gather_Sche_PerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class GatherScheduleService implements IGatherScheduleService{
    @Autowired
    @Qualifier("IGatherScheduleDAO")
    IGatherScheduleDAO dao;

    @Override
    public void MakeGatherSchedule(String memNick, int gatNo, String gatScheTitle, String gatScheDate, String gatScheTime, int gatScheMax, String scheduleAddress, String scheduleSpace, String gatScheSpace, String gatScheInfo) {
        dao.MakeGatherSchedule(memNick, gatNo, gatScheTitle, gatScheDate, gatScheTime, gatScheMax, scheduleAddress, scheduleSpace, gatScheSpace, gatScheInfo);
    }

    @Override
    public ArrayList<GatherScheduleVO> LoadGather_Sche(int gatNo) {
        return dao.LoadGather_Sche(gatNo);
    }

    @Override
    public void updateViewCount(int gatScheNo) {
        dao.updateViewCount(gatScheNo);
    }

    @Override
    public GatherScheduleVO LocdGather_Schedule(int gatNo) {
        return dao.LocdGather_Schedule(gatNo);
    }

    @Override
    public int CheckMaxPerson(int gatScheNo) {
        return dao.CheckMaxPerson(gatScheNo);
    }

    @Override
    public int GatherJoinNow(int gatScheNo) {
        return dao.GatherJoinNow(gatScheNo);
    }

    @Override
    public ArrayList<Gather_Sche_PerVO> GatherJoinPerson(int gatScheNo) {
        return dao.GatherJoinPerson(gatScheNo);
    }

    @Override
    public void JoinGather(int gatScheNo, int gatNo, String memNick) {
        dao.JoinGather(gatScheNo, gatNo, memNick);
    }
}
