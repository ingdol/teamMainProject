package com.boot.teamMainProject.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



import com.boot.teamMainProject.model.GatherDetComVO;


public interface ICommentService {
	public List<GatherDetComVO> readComment(int gatDetNo) throws Exception;
	ArrayList<GatherDetComVO> CommentCountBoard (int gatDetNo);
	void insertGatDetCom (GatherDetComVO gatc) throws IOException;
}
