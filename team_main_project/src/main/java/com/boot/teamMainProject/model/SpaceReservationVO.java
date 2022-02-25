package com.boot.teamMainProject.model;

public class SpaceReservationVO {
    private int spaceReserNo;
    private int gatNo;
    private int classNo;
    private String memNick;
    private int spaceNo;
    private String spaceReserDate;
    private String spaceReserTime;

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

    public String getSpaceReserDate() {
        return spaceReserDate;
    }

    public void setSpaceReserDate(String spaceReserDate) {
        this.spaceReserDate = spaceReserDate;
    }

    public String getSpaceReserTime() {
        return spaceReserTime;
    }

    public void setSpaceReserTime(String spaceReserTime) {
        this.spaceReserTime = spaceReserTime;
    }
}
