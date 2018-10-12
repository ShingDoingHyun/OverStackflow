package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import com.bit.op.osf.tagBoard.model.ReplyBoard;

public interface IReplyBoardDao {

	int insertReplyBoard(ReplyBoard replyBoard);

	List<ReplyBoard> selectReplyBoardList(int questionNo);

	void deleteReplyBoard(int replynBoardNo);

}
