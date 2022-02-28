package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.IGatherScheduleDAO;
import com.boot.teamMainProject.dao.IGatheringDAO;
import com.boot.teamMainProject.model.GatherScheduleVO;
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
    public void MakeGatherSchedule(GatherScheduleVO gatherScheduleVO) {
        dao.MakeGatherSchedule(gatherScheduleVO);
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
}
