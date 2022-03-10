package com.boot.teamMainProject.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.teamMainProject.model.SpaceVO;
import com.boot.teamMainProject.service.SpaceCreateService;


@Controller
public class SpaceCreateController {
	
	@Autowired	
	SpaceCreateService service;
	
	int count = 6;
	@RequestMapping("/spacecreate")
	public String insertSpace(@RequestParam String memNick, 
													SpaceVO spa, 
													@RequestParam("uploadFile3") MultipartFile file,
													@RequestParam("uploadFile4") ArrayList<MultipartFile> files
													) throws IOException {
		String savedFileName = "";
		String savedFileName2 = "";
		String uploadPath = "/images/";
//		String uploadPath = "C:/teamImage/";
		
		ArrayList<String> originalFilenameList = new ArrayList<String>();
		int count2 = count + 1;	
		
		String originalFileName2 = file.getOriginalFilename();
		int checkc = originalFileName2.indexOf(".",0)+1;
		
		String spacePhoto2="";
//		// 3. 파일 이름 중복되지 않도록 이름 변경 : 서버에 저장할 이름 . UUID 사용
//		UUID uuid = UUID.randomUUID();
		savedFileName2 = "space_"+count2+".";
		
		for(int i=checkc; i<originalFileName2.length(); i++) {
			
			savedFileName2+=originalFileName2.charAt(i);
		}
		// 4. 파일 생성
		File file2 = new File(uploadPath + savedFileName2);
		// 5. 서버로 전송
		file.transferTo(file2);			
		
		String spacePhoto = savedFileName2;
		spa.setSpacePhoto(spacePhoto); 
		
		int count3=1;
		for(MultipartFile file1 : files) {
			// 2. 원본 파일 이름 알아오기
			String originalFileName = file1.getOriginalFilename();
			
			// 파일 이름을 리스트에 추가
			originalFilenameList.add(originalFileName);
			int checkk = originalFileName.indexOf(".",0)+1;
			
			
//			// 3. 파일 이름 중복되지 않도록 이름 변경 : 서버에 저장할 이름 . UUID 사용
//			UUID uuid = UUID.randomUUID();
			savedFileName = "space_"+count2+"-"+count3+".";
			for(int i=checkk; i<originalFileName.length(); i++) {
				
				savedFileName+=originalFileName.charAt(i);
			}
			count3 +=1;
			
			
			// 4. 파일 생성
			File filec = new File(uploadPath + savedFileName);
			// 5. 서버로 전송
			file1.transferTo(filec);
			
			
			spacePhoto2+=savedFileName + " ";
		}
		
		spa.setSpacePhoto2(spacePhoto2); 
		
		spa.setMemNick(memNick); 
		service.insertSpace(spa);
		
		return "redirect:/main";
	}

}
