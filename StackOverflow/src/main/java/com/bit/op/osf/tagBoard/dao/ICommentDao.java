package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import com.bit.op.osf.tagBoard.model.Comment;

public interface ICommentDao {

	int insertComment(Comment comment);

	List<Comment> selectCommentList(int questionNo, String string);

	int updateComment(Comment comment);

	int deleteComment(int commentNo);

}
