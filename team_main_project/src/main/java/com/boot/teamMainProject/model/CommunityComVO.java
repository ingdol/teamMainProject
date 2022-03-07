package com.boot.teamMainProject.model;

import java.util.Date;

public class CommunityComVO {
	private int commuComNo;
	private int commuNo;
	private String memNick;
	private String commuComInfo;
	private Date commuComDate;
	private int commuComLike;
	
	public int getCommuComNo() {
		return commuComNo;
	}
	public void setCommuComNo(int commuComNo) {
		this.commuComNo = commuComNo;
	}
	public int getCommuNo() {
		return commuNo;
	}
	public void setCommuNo(int commuNo) {
		this.commuNo = commuNo;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getCommuComInfo() {
		return commuComInfo;
	}
	public void setCommuComInfo(String commuComInfo) {
		this.commuComInfo = commuComInfo;
	}
	public Date getCommuComDate() {
		return commuComDate;
	}
	public void setCommuComDate(Date commuComDate) {
		this.commuComDate = commuComDate;
	}
	public int getCommuComLike() {
		return commuComLike;
	}
	public void setCommuComLike(int commuComLike) {
		this.commuComLike = commuComLike;
	}
}
