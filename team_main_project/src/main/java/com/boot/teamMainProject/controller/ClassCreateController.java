package com.boot.teamMainProject.controller;


import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.service.ClassCreateService;


@Controller
public class ClassCreateController {
	
	@Autowired	
	ClassCreateService service;
	
	
	int count = 7;
	
	@RequestMapping("/classcreate")
	public String insertClass(@RequestParam String memNick, 
													@RequestParam String classArea1,
													@RequestParam String classArea2,
													ClassVO cl, Model model, 
													@RequestParam("uploadFile5") MultipartFile file5) throws IOException {
		String savedFileName ="";
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
		String uploadPath = "C:/teamImage/";
		
		// 2. 원본 파일 이름 알아오기
		String originalFileName = file5.getOriginalFilename();
		
		if(originalFileName.length()>3) {
			count = count + 1;
			savedFileName = "class" + count + "." + originalFileName.charAt(originalFileName.length()-3) + originalFileName.charAt(originalFileName.length()-2) + originalFileName.charAt(originalFileName.length()-1);
//					 + ".jpg" ;
			//4. 파일 생성
					File file = new File(uploadPath + savedFileName);
					//5. 서버로 전송
					file5.transferTo(file);
			}
			else {
				savedFileName = null;
			}		// model
			model.addAttribute("originalFileName", originalFileName);
			String classPhoto = savedFileName;
			System.out.println(classPhoto); 
			cl.setClassPhoto(classPhoto); 
			
			String classArea = classArea1 +" "+ classArea2;
			cl.setClassArea(classArea);
			
			
			service.insertClass(cl);
		
		
		return "redirect:/main";
	}
}
