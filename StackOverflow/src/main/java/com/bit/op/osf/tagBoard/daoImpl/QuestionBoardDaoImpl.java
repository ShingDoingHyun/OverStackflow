package com.bit.op.osf.tagBoard.daoImpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.dao.IReplyBoardDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;

@Repository
public class QuestionBoardDaoImpl implements IQuestionBoardDao {

	@Inject
	private SqlSession sqlSession;
	
	@Inject
	private ICommentDao commentDao;
	
	@Inject
	private IReplyBoardDao replyBoardDao;
	

	private static final String QUSETION_NAMESPACE = "com.bit.op.osf.tagBoard.mapper.QuestionBoardMapper.";

	@Override
	public int insertQuestionBoard(QuestionBoard questionboard) {
		
		sqlSession.insert(QUSETION_NAMESPACE + "insertQuestion", questionboard);
		int result = questionboard.getQuestionNo();
		return result;
	}

	@Override
	public QuestionBoard selectQuestionNo(int questionNo) {
		
		return sqlSession.selectOne(QUSETION_NAMESPACE + "selectQuestionNo", questionNo);
	}

	@Override
	public List<QuestionBoard> selectPopQuestionList() {
		
		return sqlSession.selectList(QUSETION_NAMESPACE + "selectPopQuestion");
	}
	
	@Override
	public int updateQuestionView(int questionNo) {
		
		int result = sqlSession.update(QUSETION_NAMESPACE + "updateQuestionView", questionNo);
		return result;
	}
	
	

	
	@Override
	public QuestionBoard selectQuestionDeltail(int questionNo) {
		
		updateQuestionView(questionNo);
		QuestionBoard questionBoard = selectQuestionNo(questionNo);	
		questionBoard.setReplyBoardList(replyBoardDao.selectReplyBoardList(questionNo));
		questionBoard.setCommentList(commentDao.selectCommentList(questionBoard.getQuestionNo(), "question"));
		return questionBoard;
	}
	

}
