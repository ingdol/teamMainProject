package com.boot.teamMainProject.model;

import java.util.Date;

public class ClassRevVO {
	private int classNo; 
	private int classRevNo; 
	private String classRevTitle; 
	private String memNick; 
	private String classRevPhoto; 
	private String classRevInfo; 
	private Date classRevDate;
	
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public int getClassRevNo() {
		return classRevNo;
	}
	public void setClassRevNo(int classRevNo) {
		this.classRevNo = classRevNo;
	}
	public String getClassRevTitle() {
		return classRevTitle;
	}
	public void setClassRevTitle(String classRevTitle) {
		this.classRevTitle = classRevTitle;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getClassRevPhoto() {
		return classRevPhoto;
	}
	public void setClassRevPhoto(String classRevPhoto) {
		this.classRevPhoto = classRevPhoto;
	}
	public String getClassRevInfo() {
		return classRevInfo;
	}
	public void setClassRevInfo(String classRevInfo) {
		this.classRevInfo = classRevInfo;
	}
	public Date getClassRevDate() {
		return classRevDate;
	}
	public void setClassRevDate(Date classRevDate) {
		this.classRevDate = classRevDate;
	}
	
	
}
