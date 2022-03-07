package com.boot.teamMainProject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boot.teamMainProject.model.ChattingVO;
import com.boot.teamMainProject.model.GatheringVO;
import com.boot.teamMainProject.model.MemberVO;
import com.boot.teamMainProject.model.Room;
import com.boot.teamMainProject.service.ChattingService;
import com.boot.teamMainProject.service.GatheringService;
import com.boot.teamMainProject.service.MemberService;


@Controller
public class ChatController {
	@Autowired
	MemberService service;
	
	@Autowired
	GatheringService Gatherservice;

	@Autowired
	ChattingService ChatService;

	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;
	
//	@RequestMapping("/chat2/{memId}")
//	public ModelAndView chat(@PathVariable String memId, Model model) {
//
//		MemberVO mem = service.detailViewMember(memId); // 상세 회원 조회 메소드 그대로 사용
//		model.addAttribute("mem", mem);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("sej/searchTest");
//		return mv;
//	}
//	
//	@RequestMapping("/chat2/{gatNo}")
//	public ModelAndView chat2(@PathVariable int gatNo, Model model) {
//		ArrayList<GatheringVO> gatV = Gatherservice.detailgat(gatNo);
//		model.addAttribute("gatV", gatV);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("sej/chat");
//		return mv;
//	}
	
	@RequestMapping("/chat/{memId}/{gatNo}")
	public ModelAndView chat2(@PathVariable String memId, @PathVariable int gatNo, Model model) {

		MemberVO mem = service.detailViewMember(memId); // 상세 회원 조회 메소드 그대로 사용
		model.addAttribute("mem", mem);
		ArrayList<GatheringVO> gatV = Gatherservice.detailgat(gatNo);
		model.addAttribute("gatV", gatV);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sej/chat");
		return mv;
	}

	@RequestMapping("/askChat/{memId}/{gatNo}")
	public ModelAndView askChat(@PathVariable String memId, @PathVariable String gatNo, Model model) {
		MemberVO mem = service.detailViewMember(memId); // 상세 회원 조회 메소드 그대로 사용
		model.addAttribute("mem", mem);
		
		ChattingVO chat = ChatService.detailChatting(gatNo);
		model.addAttribute("chat", chat);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sej/askChat");
		return mv;
	}
	
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sej/room");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		
		List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("sej/chat");
		}else {
			mv.setViewName("sej/room");
		}
		return mv;
	}
	
}
