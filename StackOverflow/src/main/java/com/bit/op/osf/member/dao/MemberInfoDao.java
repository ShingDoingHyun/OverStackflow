package com.bit.op.osf.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

public interface MemberInfoDao {
	public int insertMemberInfo(MemRegInfo memRegInfo, HttpServletRequest request) throws Exception;
	public MemRegInfo selectMember( String id, String pw);
	public List<MemRegInfo> selectMemberRankList();
	public int insertMemberInfo(MemRegInfo memInfo) throws Exception;
	
	
	//마이페이지
    public List<ReplyBoard> selectAnswerInfo(String memId) throws Exception;
	public List<QuestionBoard> selectQuestionInfo(String memId) throws Exception;
	public int memberProfileUpdate(MemRegInfo memInfo, HttpServletRequest request) throws Exception;
	
}
