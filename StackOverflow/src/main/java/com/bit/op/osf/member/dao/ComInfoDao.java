package com.bit.op.osf.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.member.model.ComRegInfo;
import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

public interface ComInfoDao {
	public int insertComInfo(ComRegInfo comRegInfo, HttpServletRequest request) throws Exception;
	public ComRegInfo selectCom( String id, String pw);
	
	public int insertComInfo(ComRegInfo comInfo) throws Exception;

	
	
	//마이페이지
   
	public int comProfileUpdate(ComRegInfo comInfo, HttpServletRequest request) throws Exception;
}
