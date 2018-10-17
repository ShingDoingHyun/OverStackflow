package com.bit.op.osf.member.daoImpl;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.job.daoImpl.DaoImpl;
import com.bit.op.osf.member.SHA256.SHA256;
import com.bit.op.osf.member.dao.MemberInfoDao;
import com.bit.op.osf.member.dao.MyPageInfoDao;
import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

@Repository
public class MyPageInfoImpl extends DaoImpl implements MyPageInfoDao {

	@Autowired
	SHA256 SHA;


	private static final String MYPAGEINFO_NAMESPACE = "com.bit.op.osf.member.mapper.MyPageInfoMapper.";

	
	
	@Override
	public List<ReplyBoard> selectAnswerInfo(String memId) throws Exception {

		List<ReplyBoard>  replyBoards = sqlSession.selectList(MYPAGEINFO_NAMESPACE+"selectReplyMember", memId);
	
		return replyBoards;
	}

	
	@Override
	public List<QuestionBoard> selectQuestionInfo(String memId) throws Exception {
		
		List<QuestionBoard>  questionBoards = sqlSession.selectList(MYPAGEINFO_NAMESPACE+"selectQuestionMember", memId);
		return questionBoards;
	}

	
	@Override
	public int memberProfileUpdate(MemRegInfo memInfo) {
		// TODO Auto-generated method stub
				
		String memberPw = SHA.encrypt(memInfo.getMemberPwd());
		memInfo.setMemberPwd(memberPw);

		
		
	return	sqlSession.update(MYPAGEINFO_NAMESPACE+"memberProfileUpdate",memInfo);
	}
}
