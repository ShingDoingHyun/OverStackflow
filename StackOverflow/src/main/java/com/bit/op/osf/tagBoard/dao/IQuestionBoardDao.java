package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import com.bit.op.osf.tagBoard.model.QuestionBoard;

public interface IQuestionBoardDao {


	int insertQuestionBoard(QuestionBoard questionboard);

	QuestionBoard selectQuestionNo(int questionNo);

	List<QuestionBoard> selectPopQuestionList();

	int updateQuestionView(int questionNo);

	Object selectQuestionDeltail(int questionBoardNo);

	int updateQuestionBoard(QuestionBoard questionBoard);

	int deleteQuestionBoard(int questionBoardNo);


}
