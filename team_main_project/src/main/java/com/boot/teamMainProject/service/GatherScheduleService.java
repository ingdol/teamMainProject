package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.IGatherScheduleDAO;
import com.boot.teamMainProject.dao.IGatheringDAO;
import com.boot.teamMainProject.model.GatherScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class GatherScheduleService implements IGatherScheduleService{
    @Autowired
    @Qualifier("IGatherScheduleDAO")
    IGatherScheduleDAO dao;

    @Override
    public void MakeGatherSchedule(GatherScheduleVO gatherScheduleVO) {
        dao.MakeGatherSchedule(gatherScheduleVO);
    }
}
