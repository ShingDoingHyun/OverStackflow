package com.bit.op.osf.tagBoard.daoImpl;

import java.util.ArrayList;
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
	 public int boardList(QuestionBoard questionboard) {

	     return sqlSession.insert(QUSETION_NAMESPACE+"boardList", questionboard);
	 }

}
