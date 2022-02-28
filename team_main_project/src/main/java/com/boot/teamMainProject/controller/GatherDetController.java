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

import com.boot.teamMainProject.model.GatherDetComVO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.CommentService;
import com.boot.teamMainProject.service.GatherDetService;
import com.boot.teamMainProject.service.GatheringService;



@Controller
public class GatherDetController {
	@Autowired
	GatherDetService service;
	
	@Inject
	CommentService service2;
	
	@Autowired
	GatheringService service3;
	 
	int count = 3;
	
	@RequestMapping("/ldh/SomoimboardWrite/{memNick}")
	public String MoveinsertGather(@PathVariable String memNick, Model model) {
		System.out.println(memNick); 
		MemberVO gat = service.MoveinsertGather(memNick);
		model.addAttribute("gat", gat);

		return "/ldh/SomoimboardWrite";
	}

	
	
	@RequestMapping("/sboard")
	public String insertGatherDet ( @RequestParam int gatNo ,@RequestParam("uploadFile") MultipartFile file, Model model ,GatherDetVO gat) throws IOException
	{
		
		
		String savedFileName ="";
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
		String uploadPath = "C:/teamImage/";
		
		// 2. 원본 파일 이름 알아오기
		String originalFileName = file.getOriginalFilename();
		
		//3. 파일 이름 중복되지 않도록 이름 변경: 서버에 저장할 이름, UUID 사용
//		UUID uuid = UUID.randomUUID();uuid.toString() + "_" +
		if(originalFileName.length()>3) {
		count = count + 1;
		savedFileName = "gather_det" + count + "." + originalFileName.charAt(originalFileName.length()-3) + originalFileName.charAt(originalFileName.length()-2) + originalFileName.charAt(originalFileName.length()-1);
//				 + ".jpg" ;
		//4. 파일 생성
				File file1 = new File(uploadPath + savedFileName);
				
				
				//5. 서버로 전송
				file.transferTo(file1);
		}
		else {
			savedFileName = null;
		}
		
		
		
		// model
		model.addAttribute("originalFileName", originalFileName);
		
		String gatDetPhoto = savedFileName;
		gat.setGatDetPhoto(gatDetPhoto); 
		
		
//		int gatNo2 = gatNo;
//		count2 = count2 + 1;
		
		ArrayList<GatherDetVO> gdList = service.CountBoard();
		int count2 = gdList.size() +1;
		
		int gatNo2 = gatNo;
		
		int gatDetNo = count2;
		gat.setGatDetNo(gatDetNo); 
		service.insertGatherDet(gat);
		System.out.println(count2); 
		return "redirect:/ldh/Somoimboard/"+gatNo2 + "/" + count2;
	}
	
	
	//댓글작성
	@RequestMapping("/Commentcreate/{gatNo}/{gatDetNo}")
	public String insertGatDetCom (@PathVariable int gatNo ,@PathVariable int gatDetNo ,@RequestParam String gatDetComInfo,GatherDetComVO gatc) throws IOException
	{
		
		String check = gatDetComInfo;
		
		if(check.length()!=0) {
		ArrayList<GatherDetComVO> cmList = service2.CommentCountBoard(gatDetNo);
		GatherDetVO gat = service.detailViewBoard(gatNo, gatDetNo);
		int comcount = cmList.size() +1;
		gat.setGatDetComNum(comcount);

		int gatDetComNo = comcount;
		gatc.setGatDetComNo(gatDetComNo); 
		gat.setGatDetComNum(gatDetComNo);
		service.updateGatherDet(gat);
		service2.insertGatDetCom(gatc);
		System.out.println(comcount); 
		}
		return "redirect:/ldh/Somoimboard/"+gatNo + "/" + gatDetNo;
	}
	
	
	
	@RequestMapping("/ldh/Somoimboard/{gatNo}/{gatDetNo}")
	public String detailViewBoard(@PathVariable int gatNo, @PathVariable int gatDetNo, Model model) throws Exception {
		System.out.println(gatNo + " " + gatDetNo); 
		GatherDetVO gat = service.detailViewBoard(gatNo, gatDetNo);
		GatheringVO gath = service3.detailViewSomoim(gatNo);
		
		model.addAttribute("gat", gat);
		model.addAttribute("gath", gath);

		
		
		List<GatherDetComVO> comList = service2.readComment(gatDetNo);
		model.addAttribute("comList", comList);
		
		return "ldh/Somoimboard";
	}
	
	
	
	
	
	
	
	
	
	
	int countex1 = 14;
	int countex2 = 14;
	
	
	@RequestMapping("/screate")
	public String insertGathering(GatheringVO gath, @RequestParam String gatArea1, @RequestParam String gatArea2, @RequestParam("uploadFile1") MultipartFile file1,@RequestParam("uploadFile2") MultipartFile file2, Model model,Model model2) throws IOException {
//		System.out.println(gath.getGatArea());
		
		String savedFileName1 ="";
		String savedFileName2 ="";
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
		String uploadPath1 = "C:/teamImage/";
		String uploadPath2 = "C:/teamImage/ldh/";
		// 2. 원본 파일 이름 알아오기
		String originalFileName1= file1.getOriginalFilename();
		String originalFileName2= file2.getOriginalFilename();
		
		//3. 파일 이름 중복되지 않도록 이름 변경: 서버에 저장할 이름, UUID 사용
//		UUID uuid = UUID.randomUUID();uuid.toString() + "_" +
		if(originalFileName1.length()>3) {
		countex1 = countex1 + 1;
		savedFileName1 = "gathering" + countex1 + "." + originalFileName1.charAt(originalFileName1.length()-3) + originalFileName1.charAt(originalFileName1.length()-2) + originalFileName1.charAt(originalFileName1.length()-1);
//				 + ".jpg" ;
		//4. 파일 생성
				File filed1 = new File(uploadPath1 + savedFileName1);
				
				//5. 서버로 전송
				file1.transferTo(filed1);
		}
		else {
			savedFileName1 = null;
		}
		if(originalFileName2.length()>3) {
			countex2 = countex2 + 1;
			savedFileName2 = "ex" + countex2 + "." + originalFileName2.charAt(originalFileName2.length()-3) + originalFileName2.charAt(originalFileName2.length()-2) + originalFileName2.charAt(originalFileName2.length()-1);
//					 + ".jpg" ;
			//4. 파일 생성
					File filed2 = new File(uploadPath2 + savedFileName2);
					
					//5. 서버로 전송
					file2.transferTo(filed2);
			}
			else {
				savedFileName2 = null;
			}
		
		model.addAttribute("originalFileName1", originalFileName1);
		model2.addAttribute("originalFileName2", originalFileName2);
		
		String gatPhoto = savedFileName1;
		gath.setGatPhoto(gatPhoto); 
		
		String gatBanPhoto = savedFileName2;
		gath.setGatBanPhoto(gatBanPhoto); 

		
		String gatArea = gatArea1 + " " + gatArea2;
		gath.setGatArea(gatArea); 
		service3.insertGathering(gath);
		
		return "redirect:/main";
	}
}
