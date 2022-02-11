package com.boot.teamMainProject.model;

import java.util.Date;

public class GatherDetVO {
	private String gatNo;
	private String gatDetNo;
	private String gatDetTitle;
	private String memNick;
	private String gatDetInfo;
	private String gatDetPhoto;
	private Date gatDetDate;
	private int gatDetLike;
	private int gatDetView;
	private int gatDetComNum;
	
	public String getGatNo() {
		return gatNo;
	}
	public void setGatNo(String gatNo) {
		this.gatNo = gatNo;
	}
	public String getGatDetNo() {
		return gatDetNo;
	}
	public void setGatDetNo(String gatDetNo) {
		this.gatDetNo = gatDetNo;
	}
	public String getGatDetTitle() {
		return gatDetTitle;
	}
	public void setGatDetTitle(String gatDetTitle) {
		this.gatDetTitle = gatDetTitle;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getGatDetInfo() {
		return gatDetInfo;
	}
	public void setGatDetInfo(String gatDetInfo) {
		this.gatDetInfo = gatDetInfo;
	}
	public String getGatDetPhoto() {
		return gatDetPhoto;
	}
	public void setGatDetPhoto(String gatDetPhoto) {
		this.gatDetPhoto = gatDetPhoto;
	}
	public Date getGatDetDate() {
		return gatDetDate;
	}
	public void setGatDetDate(Date gatDetDate) {
		this.gatDetDate = gatDetDate;
	}
	public int getGatDetLike() {
		return gatDetLike;
	}
	public void setGatDetLike(int gatDetLike) {
		this.gatDetLike = gatDetLike;
	}
	public int getGatDetView() {
		return gatDetView;
	}
	public void setGatDetView(int gatDetView) {
		this.gatDetView = gatDetView;
	}
	public int getGatDetComNum() {
		return gatDetComNum;
	}
	public void setGatDetComNum(int gatDetComNum) {
		this.gatDetComNum = gatDetComNum;
	}
}
