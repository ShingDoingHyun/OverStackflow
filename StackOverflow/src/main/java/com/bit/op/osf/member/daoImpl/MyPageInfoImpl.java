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

	

	private static final String MYPAGEINFO_NAMESPACE = "com.bit.op.osf.member.mapper.MyPageInfoMapper.";


/*
	public MemRegInfo selectMember(String id, String pw) {

	
		// 비밀번호 SHA암호화로 변경
		System.out.println("pw       "+pw);  
		

	
		MemRegInfo memInfo = sqlSession.selectOne(MYPAGEINFO_NAMESPACE +"selectId",id);
		System.out.println("memInfo       "+memInfo);  
		
		return memInfo;
	}
*/


	@Override
	public List<ReplyBoard> selectAnswerInfo(String memId) throws Exception {
		// TODO Auto-generated method stub   sqlSession.selectList(QUSETION_NAMESPACE + "selectQuestion", search);
		//  selectReplyMember
		
		List<ReplyBoard>  replyBoards = sqlSession.selectList(MYPAGEINFO_NAMESPACE+"selectReplyMember", memId);
		System.out.println("selectAnswerInfo==="+replyBoards);
		return replyBoards;
	}



	@Override
	public List<QuestionBoard> selectQuestionInfo(String memId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
