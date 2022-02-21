package com.boot.teamMainProject.service;

import java.util.List;



import com.boot.teamMainProject.model.GatherDetComVO;


public interface ICommentService {
	public List<GatherDetComVO> readComment(int gatDetNo) throws Exception;

}
