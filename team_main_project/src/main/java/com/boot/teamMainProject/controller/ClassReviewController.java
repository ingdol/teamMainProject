package com.boot.teamMainProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.teamMainProject.model.ClassRevVO;
import com.boot.teamMainProject.model.ClassVO;
import com.boot.teamMainProject.model.GatherDetComVO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.ClassRevService;
import com.boot.teamMainProject.service.ClassService;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class ClassReviewController {
	@Autowired
	ClassRevService service;
	
	@Autowired
	ClassService service3;
	 
	@Autowired
	MemberService service4;
	
	
	//글 상세보기
		@RequestMapping("/ldh/ClassReview/{classNo}/{classRevNo}")
		public String detailViewCR(@PathVariable int classNo, @PathVariable int classRevNo,String memId, Model model, HttpSession session) throws Exception {
			System.out.println(classNo + " " + classRevNo); 
			ClassRevVO cr = service.revlist2(classRevNo);
			ClassVO crd = service3.classinfo2(classNo);
//		    String memId = (String)session.getAttribute("memId");
//		    System.out.println(memId); 
		    MemberVO mem = service4.detailViewMember(memId);
		    model.addAttribute("mem", mem);
			model.addAttribute("cr", cr);
			model.addAttribute("crd", crd);
//			 System.out.println(memId); 

			
			return "ldh/ClassReview";
		}
		
		//글 쓰기 페이지로 이동
		
		@RequestMapping("/ldh/ClassReviewWrite/{classNo}/{memId}")
		public String MoveinsertClass(@PathVariable String memId,@PathVariable int classNo, Model model) {
			ClassVO crd = service3.classinfo2(classNo);
			model.addAttribute("crd", crd);
			return "/ldh/ClassReviewWrite";
		}
		
		
		@RequestMapping("/ClassReviewboard")
		public String insertClassRev ( @RequestParam int classNo ,
				@RequestParam("uploadFile") MultipartFile file, Model model ,ClassRevVO cr) throws IOException
		{
			ArrayList<ClassRevVO> crList = service.revlist(classNo);
			int count2 = crList.size() +1;
			
			String savedFileName ="";
			
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
			
//			String uploadPath = "/images/";
			String uploadPath = "C:/teamImage/";		
			
			// 2. 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();
			
			if(originalFileName.length()==0) {
				savedFileName = null;
			}
			//3. 파일 이름 중복되지 않도록 이름 변경: 서버에 저장할 이름, UUID 사용
//			UUID uuid = UUID.randomUUID();uuid.toString() + "_" +
			else {
				
			int checkk = originalFileName.indexOf(".",0)+1;
			
			savedFileName = "class_rev" + count2 + ".";
			for(int i=checkk; i<originalFileName.length(); i++) {
				
				savedFileName+=originalFileName.charAt(i);
			}
			
			
			// 4. 파일 생성
			File file1 = new File(uploadPath + savedFileName);
			//5. 서버로 전송
			file.transferTo(file1);
			
			}
			model.addAttribute("originalFileName", originalFileName);
			
			String classRevPhoto = savedFileName;
			cr.setClassRevPhoto(classRevPhoto); 
//			int gatNo2 = gatNo;
//			count2 = count2 + 1;
			
//			int lastdata = service.Lastboard(gatNo);
			
			int classNo2 = classNo;
//			if(test231 == 0) {
//				
//			}
			
//			gat.setGatDetNo(gatDetNo); 
			service.insertClassRev(cr);
			System.out.println(count2); 
			
//			int gatDetNo = lastdata;
//			System.out.println(gatDetNo); 
			return "redirect:/ldh/ClassReview/"+classNo2;
		}
		
		@RequestMapping("/ldh/ClassReview/{classNo}")
		public String MoveinsertGather2(@PathVariable int classNo, Model model) {
			int lastdata = service.LastCRboard(classNo);
			int classRevNo = lastdata;
			System.out.println(classRevNo); 
		return "redirect:/ldh/ClassReview/"+classNo + "/" + classRevNo;
		
	}
		
		
		
}
