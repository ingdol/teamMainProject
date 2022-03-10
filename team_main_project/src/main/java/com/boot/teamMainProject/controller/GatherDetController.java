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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boot.teamMainProject.model.GHateVO;
import com.boot.teamMainProject.model.GLikeVO;
import com.boot.teamMainProject.model.GatherDetComVO;
import com.boot.teamMainProject.model.GatherDetVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.CommentService;
import com.boot.teamMainProject.service.GatherDetService;
import com.boot.teamMainProject.service.GatheringService;
import com.boot.teamMainProject.service.MemberService;



@Controller
public class GatherDetController {
	@Autowired
	GatherDetService service;
	
	@Inject
	CommentService service2;
	
	@Autowired
	GatheringService service3;
	 
	@Autowired
	MemberService service4;
	
	
	// 상세 정보 조회 리스트로 이동

	int count = 3;
	
	//글쓰기 페이지
	@RequestMapping("/ldh/SomoimboardWrite/{gatNo}/{memId}")
	public String MoveinsertGather(@PathVariable String memId,@PathVariable int gatNo, Model model) {
//		MemberVO mem = service4.detailViewMember(memId);
//	    model.addAttribute("mem", mem);
//		MemberVO gat = service.MoveinsertGather(memId);
//		model.addAttribute("gat", gat);
	    GatheringVO gath = service3.detailViewSomoim(gatNo);
		model.addAttribute("gath", gath);
		return "/ldh/SomoimboardWrite";
	}

	int test231 = 0;
	//글작성
	@RequestMapping("/sboard")
	public String insertGatherDet ( @RequestParam int gatNo ,
			@RequestParam("uploadFile") MultipartFile file, Model model ,GatherDetVO gat) throws IOException
	{
		ArrayList<GatherDetVO> gdList = service.CountBoard();
		int count2 = gdList.size() +1;
		
		String savedFileName ="";
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)

//		String uploadPath = "C:/teamImage/";		

		String uploadPath = "/upload/";

		
		// 2. 원본 파일 이름 알아오기
		String originalFileName = file.getOriginalFilename();
		
		if(originalFileName.length()==0) {
			savedFileName = null;
		}
		//3. 파일 이름 중복되지 않도록 이름 변경: 서버에 저장할 이름, UUID 사용
//		UUID uuid = UUID.randomUUID();uuid.toString() + "_" +
		else {
			
		int checkk = originalFileName.indexOf(".",0)+1;
		
		savedFileName = "gather_det" + count2 + ".";
		for(int i=checkk; i<originalFileName.length(); i++) {
			
			savedFileName+=originalFileName.charAt(i);
		}
		
		
		// 4. 파일 생성
		File file1 = new File(uploadPath + savedFileName);
		//5. 서버로 전송
		file.transferTo(file1);
		
		}
		model.addAttribute("originalFileName", originalFileName);
		
		String gatDetPhoto = savedFileName;
		gat.setGatDetPhoto(gatDetPhoto); 
//		int gatNo2 = gatNo;
//		count2 = count2 + 1;
		
//		int lastdata = service.Lastboard(gatNo);
		
		int gatNo2 = gatNo;
//		if(test231 == 0) {
//			
//		}
		
//		gat.setGatDetNo(gatDetNo); 
		service.insertGatherDet(gat);
		System.out.println(count2); 
		
//		int gatDetNo = lastdata;
//		System.out.println(gatDetNo); 
		return "redirect:/ldh/Somoimboard/"+gatNo2;
	}
	
	@RequestMapping("/ldh/Somoimboard/{gatNo}")
	public String MoveinsertGather2(@PathVariable int gatNo, Model model) {
		int lastdata = service.Lastboard(gatNo);
		int gatDetNo = lastdata;
		System.out.println(gatDetNo); 
	return "redirect:/ldh/Somoimboard/"+gatNo + "/" + gatDetNo;
	
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
	
	
	//글 상세보기
	@RequestMapping("/ldh/Somoimboard/{gatNo}/{gatDetNo}")
	public String detailViewBoard(@PathVariable int gatNo, @PathVariable int gatDetNo,String memId, Model model, HttpSession session) throws Exception {
		System.out.println(gatNo + " " + gatDetNo); 
		GatherDetVO gat = service.detailViewBoard(gatNo, gatDetNo);
		GatheringVO gath = service3.detailViewSomoim(gatNo);
//	    String memId = (String)session.getAttribute("memId");
//	    System.out.println(memId); 
	    MemberVO mem = service4.detailViewMember(memId);
	    model.addAttribute("mem", mem);
		model.addAttribute("gat", gat);
		model.addAttribute("gath", gath);
//		 System.out.println(memId); 
		
		 service.updateBoard2Read(gatDetNo);
		
		List<GatherDetComVO> comList = service2.readComment(gatDetNo);
		model.addAttribute("comList", comList);
		
		return "ldh/Somoimboard";
	}

	
	//글 수정 페이지로 이동
	@RequestMapping("/ldh/SomoimboardUpdate/{gatNo}/{gatDetNo}")
	public String UpdateGatDet(@PathVariable int gatNo, @PathVariable int gatDetNo, Model model) {
//		MemberVO mem = service4.detailViewMember(memId);
//	    model.addAttribute("mem", mem);
		GatherDetVO gat = service.detailViewBoard(gatNo, gatDetNo);
		model.addAttribute("gat", gat);
//	    GatheringVO gath = service3.detailViewSomoim(gatNo);
//		model.addAttribute("gath", gath);
		return "/ldh/SomoimboardUpdate";
	}
	
	@RequestMapping("/sboardupdate")
	public String UpdateGatDetComp ( @RequestParam int gatDetNo, @RequestParam int gatNo , Model model ,GatherDetVO gat) throws IOException
	{

		int gatNo2 = gatNo;
		
		service.UpdateGatDetComp(gat);

		
		return "redirect:/ldh/Somoimboard/"+gatNo2 + "/" + gatDetNo;
	}
	
	//글 삭제
	@RequestMapping("/SomoimboardDelete/{gatNo}/{gatDetNo}")
	public String DeleteGatDet ( @PathVariable int gatDetNo, @PathVariable int gatNo) throws IOException
	{
		service.DeleteGatDetCom(gatDetNo);
		service.DeleteGatHate(gatDetNo);
		service.DeleteGatLike(gatDetNo);
		service.DeleteGatDet(gatDetNo);
		
		
		return "redirect:/sun/detailgat/"+gatNo;
	}
	
	
	int countex1 = 14;
	int countex2 = 14;
	
	//소모임 생성 페이지
		@RequestMapping("/ldh/SomoimCreate/{memId}")
		public String CreateGather(@PathVariable String memId, Model model) {
			System.out.println(memId); 
			MemberVO mem = service4.detailViewMember(memId);
		    model.addAttribute("mem", mem);
//			MemberVO gat = service.MoveinsertGather(memId);
//			model.addAttribute("gat", gat);

			return "/ldh/SomoimCreate";
		}

	@RequestMapping("/screate")
	public String insertGathering(GatheringVO gath, @RequestParam String gatArea1, @RequestParam String gatArea2, @RequestParam("uploadFile1") MultipartFile file1,@RequestParam("uploadFile2") MultipartFile file2, Model model,Model model2) throws IOException {
//		System.out.println(gath.getGatArea());
		
		String savedFileName1 ="";
		String savedFileName2 ="";
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
		String uploadPath1 = "/upload/";
		String uploadPath2 = "/upload/";
//		String uploadPath1 = "C:/teamImage/";
//		String uploadPath2 = "C:/teamImage/";
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
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("/SomoimboardLike")
	public int LikeSBoard( @RequestParam("gatNo") int gatNo,  
												@RequestParam("gatDetNo")  int gatDetNo,  
												@RequestParam("memNick")  String memNick, 
												GLikeVO gl){
		
		service.LikeSBoard(gl);
		int result = service.LikeSBoard2(gatDetNo,memNick);
		service.LikeUpdate(gatDetNo,memNick);
		
		
		System.out.println(result);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/SomoimboardHate")
	public int HateSBoard( @RequestParam("gatNo") int gatNo,  
												@RequestParam("gatDetNo")  int gatDetNo,  
												@RequestParam("memNick")  String memNick, 
												GHateVO gh){
		
		service.HateSBoard(gh);
		int result = service.HateSBoard2(gatDetNo,memNick);
		service.HateUpdate(gatDetNo,memNick);
		
		
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping("/SomoimboardComDelete/{gatNo}/{gatDetNo}/{gatDetComNo}")
	public String DeleteGatDetCom ( @PathVariable int gatDetNo, @PathVariable int gatDetComNo, 
																@PathVariable int gatNo) throws IOException
	{
		service.DeleteGatDetCom2(gatDetNo, gatDetComNo);
		service.ComReset(gatDetNo);
		
		return "redirect:/ldh/Somoimboard/"+gatNo + "/"+gatDetNo;
	}
	
}
