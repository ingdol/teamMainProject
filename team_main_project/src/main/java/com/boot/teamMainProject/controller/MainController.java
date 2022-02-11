package com.boot.teamMainProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	// index 페이지로 이동
	@RequestMapping("/")
	public String index() {
//		int a = 1;
		return "index";
	}
	
	//서연 --------------------
	@RequestMapping("/sun/mapsearch")
	public String mapsearch() {
		return "/sun/mapsearch";
	}
	
	@RequestMapping("/sun/hobbysearch")
	public String hobbysearch() {
		return "/sun/hobbysearch";
	}
	
	@RequestMapping("/sun/allmoim")
	public String allmoim() {
		return "/sun/allmoim";
	}
	
	@RequestMapping("/sun/detailgat")
	public String detailgat() {
		return "/sun/detailgat";
	}
	
	@RequestMapping("/sun/commumain")
	public String commumain() {
		return "/sun/commumain";
	}
	
	//-------------------------
}