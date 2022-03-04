package com.boot.teamMainProject.service;

import com.boot.teamMainProject.dao.IClass_ScheDAO;
import com.boot.teamMainProject.model.Class_ScheVO;
import com.boot.teamMainProject.model.Class_Sche_PerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class Class_ScheService implements IClass_ScheService{
    @Autowired
    @Qualifier("IClass_ScheDAO")
    IClass_ScheDAO dao;

    @Override
    public void MakeClassSchedule(String memNick, int gatNo, String classScheTitle, String classScheDate, String classScheTime, int classScheMax, String scheduleAddress, String scheduleSpace, String classScheSpace, String classScheInfo) {
        dao.MakeClassSchedule(memNick, gatNo, classScheTitle, classScheDate, classScheTime, classScheMax, scheduleAddress, scheduleSpace, classScheSpace, classScheInfo);
    }

    @Override
    public ArrayList<Class_ScheVO> LoadClass_Sche(int classNo) {
        return dao.LoadClass_Sche(classNo);
    }

    @Override
    public void updateViewCount(int classScheNo) {
        dao.updateViewCount(classScheNo);
    }

    @Override
    public Class_ScheVO LocdClass_Schedule(int classScheNo) {
        return dao.LocdClass_Schedule(classScheNo);
    }

    @Override
    public int CheckMaxPerson(int classScheNo) {
        return dao.CheckMaxPerson(classScheNo);
    }

    @Override
    public int ClassJoinNow(int classScheNo) {
        return dao.ClassJoinNow(classScheNo);
    }

    @Override
    public ArrayList<Class_Sche_PerVO> ClassJoinPerson(int classScheNo) {
        return dao.ClassJoinPerson(classScheNo);
    }

    @Override
    public void JoinClass(int classScheNo, int classNo, String memNick) {
        dao.JoinClass(classScheNo, classNo, memNick);
    }
}
