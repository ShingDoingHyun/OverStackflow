package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import com.bit.op.osf.tagBoard.model.Comment;
import com.bit.op.osf.tagBoard.model.QuestionBoard;

public interface ICommentDao {

	int insertComment(Comment comment);

	List<Comment> selectCommentList(int questionNo, String string);

}
