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

import com.boot.teamMainProject.model.CHateVO;
import com.boot.teamMainProject.model.CLikeVO;
import com.boot.teamMainProject.model.CommunityComVO;
import com.boot.teamMainProject.model.CommunityVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.service.ComCommentService;
import com.boot.teamMainProject.service.CommunityService;
import com.boot.teamMainProject.service.MemberService;

@Controller
public class CommunityController {
	@Autowired
	CommunityService service;
	
	@Inject
	ComCommentService service2;
	
	 
	@Autowired
	MemberService service4;
	
	
	
	@RequestMapping("/ldh/CommunityWrite")
	public String MoveinsertCommu(Model model) {
//		MemberVO mem = service4.detailViewMember(memId);
//	    model.addAttribute("mem", mem);
//		MemberVO gat = service.MoveinsertGather(memId);
//		model.addAttribute("gat", gat);
//	    GatheringVO gath = service3.detailViewSomoim();
//		model.addAttribute("gath", gath);
		return "/ldh/CommunityWrite";
	}
	

	
	@RequestMapping("/communityboard")
	public String insertComBoard ( @RequestParam("uploadFile") MultipartFile file, Model model ,CommunityVO com) throws IOException
	{
		String savedFileName ="";
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
		String uploadPath = "/images/";
//		String uploadPath = "C:/teamImage/";
		
		ArrayList<CommunityVO> commList = service.CountComBoard();
		int count2 = commList.size() +1;
		
		// 2. 원본 파일 이름 알아오기
		String originalFileName = file.getOriginalFilename();
		if(originalFileName.length()==0) {
			savedFileName = null;
		}
		//3. 파일 이름 중복되지 않도록 이름 변경: 서버에 저장할 이름, UUID 사용
//		UUID uuid = UUID.randomUUID();uuid.toString() + "_" +
		else {
			
		int checkk = originalFileName.indexOf(".",0)+1;
		
		savedFileName = "community" + count2 + ".";
		for(int i=checkk; i<originalFileName.length(); i++) {
			
			savedFileName+=originalFileName.charAt(i);
		}
		
		
		// 4. 파일 생성
		File file1 = new File(uploadPath + savedFileName);
		//5. 서버로 전송
		file.transferTo(file1);
		
		}
	// model
		model.addAttribute("originalFileName", originalFileName);
		
		String commuPhoto = savedFileName;
		com.setCommuPhoto(commuPhoto); 
//		int gatNo2 = gatNo;
//		count2 = count2 + 1;

//		int lastdata = service.Lastboard(gatNo);
		


//		gat.setGatDetNo(gatDetNo); 
		service.insertComBoard(com);
		System.out.println(count2); 
		
//		int gatDetNo = lastdata;
//		System.out.println(gatDetNo); 
		return "redirect:/ldh/Communityboard/re";
	}
	
	
	//리다이렉트
	@RequestMapping("/ldh/Communityboard/re")
	public String MoveinsertCommu2(Model model) {
		int lastdata = service.Lastcomboard();
		int commuNo = lastdata;
		System.out.println(commuNo); 
	return "redirect:/ldh/Communityboard/" + commuNo;
	
}
	
	
	//댓글작성
		@RequestMapping("/ComCommentcreate/{commuNo}")
		public String insertCommunityCom (@PathVariable int commuNo ,@RequestParam String commuComInfo,CommunityComVO comc) throws IOException
		{
			String check = commuComInfo;
			
			if(check.length()!=0) {
			ArrayList<CommunityComVO> cmList = service2.ComCommentCountBoard(commuNo);
			CommunityVO com = service.detailViewCommu(commuNo);
			int comcount = cmList.size() +1;
			com.setCommuComNum(comcount);

			int commuComNo = comcount;
			comc.setCommuComNo(commuComNo); 
			com.setCommuComNum(commuComNo);
			service.updateCommunity(com);
			service2.insertCommunityCom(comc);
			System.out.println(comcount); 
			}
			return "redirect:/ldh/Communityboard/"+ commuNo;
		}
		
		
		//글 상세보기
		@RequestMapping("/ldh/Communityboard/{commuNo}")
		public String detailViewComBoard(@PathVariable int commuNo,String memId, Model model, HttpSession session) throws Exception {
			System.out.println(commuNo); 
			CommunityVO com = service.detailViewCommu(commuNo);

		    MemberVO mem = service4.detailViewMember(memId);
		    model.addAttribute("mem", mem);
			model.addAttribute("com", com);

//			 System.out.println(memId); 
			
			 service.updateCommBoard2Read(commuNo);
			
			List<CommunityComVO> comcomList = service2.readComComment(commuNo);
			model.addAttribute("comcomList", comcomList);
			
			return "ldh/Communityboard";
		}

		
		//글 수정 페이지로 이동
		@RequestMapping("/ldh/CommunityUpdate/{commuNo}")
		public String UpdateCommu( @PathVariable int commuNo, Model model) {

			CommunityVO com = service.detailViewCommu(commuNo);
			model.addAttribute("com", com);
			return "/ldh/CommunityUpdate";
		}
		
		@RequestMapping("/communityupdate")
		public String UpdateCommuComp ( @RequestParam int commuNo, Model model ,CommunityVO com) throws IOException
		{

			
			service.UpdateCommuComp(com);

			
			return "redirect:/ldh/Communityboard/" + commuNo;
		}
		
		//글 삭제
		@RequestMapping("/CommunityDelete/{commuNo}")
		public String DeleteCommu( @PathVariable int commuNo) throws IOException
		{
			service.DeleteCommuCom(commuNo);
			service.DeleteCommuLike(commuNo);
			service.DeleteCommuHate(commuNo);
			service.DeleteCommuDet(commuNo);
			
			
			return "redirect:/sun/commumain/1";
		}
		
		@ResponseBody
		@RequestMapping("/CommunityLike")
		public int LikeCBoard( 	@RequestParam("commuNo")  int commuNo,  
													@RequestParam("memNick")  String memNick, 
													CLikeVO gl){
			
			service.LikeCBoard(gl);
			int result = service.LikeCBoard2(commuNo,memNick);
			service.LikeCUpdate(commuNo,memNick);
			
			
			System.out.println(result);
			
			return result;
		}
		
		//싫어요
		@ResponseBody
		@RequestMapping("/CommunityHate")
		public int HateCBoard( 	@RequestParam("commuNo")  int commuNo,  
													@RequestParam("memNick")  String memNick, 
													CHateVO gh){
			
			service.HateCBoard(gh);
			int result = service.HateCBoard2(commuNo,memNick);
			service.HateCUpdate(commuNo,memNick);
			
			
			System.out.println(result);
			
			return result;
		}
		
		//댓글 삭제
		@RequestMapping("/CommunityComDelete/{commuNo}/{commuComNo}")
		public String DeleteCommuCom ( @PathVariable int commuNo, @PathVariable int commuComNo) throws IOException
		{
			service.DeleteCommuCom2(commuNo, commuComNo);
			service.ComCReset(commuNo);
			
			return "redirect:/ldh/Communityboard/"+ commuNo;
		}
}
