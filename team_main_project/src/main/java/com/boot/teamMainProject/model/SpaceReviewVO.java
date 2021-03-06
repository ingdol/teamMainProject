package com.boot.teamMainProject.model;

import java.util.Date;

public class SpaceReviewVO {
    private int spaceNo;
    private String spaceRevNo;
    private int spaceReserNo;
    private String spaceRevTitle;
    private String memNick;
    private String spaceRevInfo;
    private Date spaceRevDate;
    private String spaceRevPhoto;

    public int getSpaceReserNo() {
        return spaceReserNo;
    }

    public void setSpaceReserNo(int spaceReserNo) {
        this.spaceReserNo = spaceReserNo;
    }

    public String getSpaceRevPhoto() {
        return spaceRevPhoto;
    }

    public void setSpaceRevPhoto(String spaceRevPhoto) {
        this.spaceRevPhoto = spaceRevPhoto;
    }

    public int getSpaceNo() {
        return spaceNo;
    }

    public void setSpaceNo(int spaceNo) {
        this.spaceNo = spaceNo;
    }

    public String getSpaceRevNo() {
        return spaceRevNo;
    }

    public void setSpaceRevNo(String spaceRevNo) {
        this.spaceRevNo = spaceRevNo;
    }

    public String getSpaceRevTitle() {
        return spaceRevTitle;
    }

    public void setSpaceRevTitle(String spaceRevTitle) {
        this.spaceRevTitle = spaceRevTitle;
    }

    public String getMemNick() {
        return memNick;
    }

    public void setMemNick(String memNick) {
        this.memNick = memNick;
    }

    public String getSpaceRevInfo() {
        return spaceRevInfo;
    }

    public void setSpaceRevInfo(String spaceRevInfo) {
        this.spaceRevInfo = spaceRevInfo;
    }

    public Date getSpaceRevDate() {
        return spaceRevDate;
    }

    public void setSpaceRevDate(Date spaceRevDate) {
        this.spaceRevDate = spaceRevDate;
    }
}
