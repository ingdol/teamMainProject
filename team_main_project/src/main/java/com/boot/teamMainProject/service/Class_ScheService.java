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
    public void MakeClassSchedule(String memNick, int classNo, String classScheTitle, String classScheDate, String classScheTime, int classScheMax, String scheduleAddress, String scheduleSpace, String classScheSpace, String classScheInfo) {
        dao.MakeClassSchedule(memNick, classNo, classScheTitle, classScheDate, classScheTime, classScheMax, scheduleAddress, scheduleSpace, classScheSpace, classScheInfo);
    }

    @Override
    public ArrayList<Class_ScheVO> LoadClass_Sche(int classNo) {
        return dao.LoadClass_Sche(classNo);
    }

    @Override
    public void updateViewCountForClass(int classScheNo) {
        dao.updateViewCountForClass(classScheNo);
    }

    @Override
    public Class_ScheVO LoadClass_Schedule(int classScheNo) {
        return dao.LoadClass_Schedule(classScheNo);
    }

    @Override
    public int CheckMaxPersonForClass(int classScheNo) {
        return dao.CheckMaxPersonForClass(classScheNo);
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

    @Override
    public String CheckClassScheduleOverlap(int classScheNo, String memNick) {
        return dao.CheckClassScheduleOverlap(classScheNo, memNick);
    }

    @Override
    public void DeleteClassSchedule(int classScheNo) {
        dao.DeleteClassSchedule(classScheNo);
    }
}
