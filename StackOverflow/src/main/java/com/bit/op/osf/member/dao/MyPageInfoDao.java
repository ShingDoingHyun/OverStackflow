package com.bit.op.osf.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

public interface MyPageInfoDao {
	public List<ReplyBoard> selectAnswerInfo(String memId) throws Exception;
	

	public List<QuestionBoard> selectQuestionInfo(String memId) throws Exception;


	public int memberProfileUpdate(MemRegInfo memInfo, HttpServletRequest request) throws Exception;
	
}
