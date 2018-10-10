package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.QuestionBoardList;
import com.bit.op.osf.tagBoard.model.Search;

public interface IQuestionBoardDao {


	int insertQuestionBoard(QuestionBoard questionboard);

	QuestionBoard selectQuestionNo(int questionNo);

	List<QuestionBoard> selectPopQuestionList();

	int updateQuestionView(int questionNo);

	QuestionBoard selectQuestionDeltail(int questionBoardNo);

	int updateQuestionBoard(QuestionBoard questionBoard);

	int deleteQuestionBoard(int questionBoardNo);

	QuestionBoardList selectQuestionList(Search search);

	List<QuestionBoard> selectVisitQuestion(Cookie[] cookies);


}
