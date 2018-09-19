package com.bit.op.osf.tagBoard.daoImpl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;

@Repository
public class QuestionBoardImpl implements IQuestionBoardDao {

	@Inject
	private SqlSession sqlSession;

	private static final String QUSETION_NAMESPACE = "com.bit.op.osf.tagBoard.mapper.QuestionBoardMapper.";

	@Override
	public int insertQuestionBoard(QuestionBoard questionboard) {

		int result = sqlSession.insert(QUSETION_NAMESPACE + "insertQuestion", questionboard);
		return result;
	}

	@Override
	public QuestionBoard selectQuestionNo(int questionNo) {
		return sqlSession.selectOne(QUSETION_NAMESPACE + "selectQuestionNo", questionNo);
	}

	@Override
	public List<QuestionBoard> selectPopQuestionList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(QUSETION_NAMESPACE + "selectPopQuestion");
	}
	
	@Override
	public int updateQuestionView(int questionNo) {

		int result = sqlSession.update(QUSETION_NAMESPACE + "updatQuestionView", questionNo);
		return result;
	}
	
	
	
	
	@Override
	public QuestionBoard insertQuestionAction(QuestionBoard questionboard) {
		int test = insertQuestionBoard(questionboard);
		System.out.println("시퀀스값은 = " + test);
		return selectQuestionNo(test);
	}
	
	@Override
	public QuestionBoard selectQuestionDeltail(int questionNo) {
		
		updateQuestionView(questionNo);
		QuestionBoard questionBoard = selectQuestionNo(questionNo);
		
		
		return questionBoard;
		
	}
	

}
