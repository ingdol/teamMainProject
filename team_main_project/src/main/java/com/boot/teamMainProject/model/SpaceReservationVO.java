package com.boot.teamMainProject.model;

import java.util.Date;

public class SpaceReservationVO {
    private int spaceReserNo;
    private int gatNo;
    private int classNo;
    private String memNick;
    private int spaceNo;
    private Date spaceReserDate;
    private Date spaceReserStartTime;
    private Date spaceReserEndTime;
    private int spacePay;

    public int getSpaceNo() {
        return spaceNo;
    }

    public void setSpaceNo(int spaceNo) {
        this.spaceNo = spaceNo;
    }

    public int getSpaceReserNo() {
        return spaceReserNo;
    }

    public void setSpaceReserNo(int spaceReserNo) {
        this.spaceReserNo = spaceReserNo;
    }

    public int getGatNo() {
        return gatNo;
    }

    public void setGatNo(int gatNo) {
        this.gatNo = gatNo;
    }

    public int getClassNo() {
        return classNo;
    }

    public void setClassNo(int classNo) {
        this.classNo = classNo;
    }

    public String getMemNick() {
        return memNick;
    }

    public void setMemNick(String memNick) {
        this.memNick = memNick;
    }

    public Date getSpaceReserDate() {
        return spaceReserDate;
    }

    public void setSpaceReserDate(Date spaceReserDate) {
        this.spaceReserDate = spaceReserDate;
    }

    public Date getSpaceReserStartTime() {
        return spaceReserStartTime;
    }

    public void setSpaceReserStartTime(Date spaceReserStartTime) {
        this.spaceReserStartTime = spaceReserStartTime;
    }

    public Date getSpaceReserEndTime() {
        return spaceReserEndTime;
    }

    public void setSpaceReserEndTime(Date spaceReserEndTime) {
        this.spaceReserEndTime = spaceReserEndTime;
    }

    public int getSpacePay() {
        return spacePay;
    }

    public void setSpacePay(int spacePay) {
        this.spacePay = spacePay;
    }
}
