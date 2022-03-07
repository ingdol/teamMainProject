package com.boot.teamMainProject.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.service.SpaceCreateService;


@Controller
public class SpaceCreateController {
	
	@Autowired	
	SpaceCreateService service;
	
	@RequestMapping("/spacecreate")
	public String insertSpace(@RequestParam String memNick, 
													SpaceVO spa, Model model, 
													MultipartHttpServletRequest mtfRequest) throws IOException {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		for (MultipartFile mf : fileList) {
			 String originFileName = mf.getOriginalFilename();
			 System.out.println("originFileName : " + originFileName);
		}
		spa.setMemNick(memNick); 
		service.insertSpace(spa);
		
		return "redirect:/main";
	}
}
