package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.QuestionBoardList;
import com.bit.op.osf.tagBoard.model.Search;

public interface IQuestionBoardDao {


	int insertQuestionBoard(QuestionBoard questionboard);

	List<QuestionBoard> selectPopQuestionList(HttpServletRequest request);

	int updateQuestionView(int questionNo);

	QuestionBoard selectQuestionDeltail(int questionBoardNo, HttpServletRequest request);

	int updateQuestionBoard(QuestionBoard questionBoard);

	int deleteQuestionBoard(int questionBoardNo);

	QuestionBoardList selectQuestionList(Search search, HttpServletRequest request);

	List<QuestionBoard> selectVisitQuestion(Cookie[] cookies);

	int changeFavQuestion(QuestionBoard questionBoard);

	List<QuestionBoard> selectFavQuestionList(HttpServletRequest request);

	int chageVote(QuestionBoard questionBoard);


}
