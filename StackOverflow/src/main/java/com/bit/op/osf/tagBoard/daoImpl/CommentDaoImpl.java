package com.bit.op.osf.tagBoard.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.model.Comment;


@Repository
public class CommentDaoImpl implements ICommentDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String COMMENT_NAMESPACE = "com.bit.op.osf.tagBoard.mapper.CommentMapper.";
	
	@Override
	public int insertComment(Comment comment) {

		return sqlSession.insert(COMMENT_NAMESPACE + "insertComment",comment);
	}
	
	@Override
	public List<Comment> selectCommentList(int questionNo, String boardType){
		String selectComment = "";
		String selectSubComment = "";
		if(boardType.equals("question")) {
			selectComment = "selectCommentList";
			selectSubComment = "selectSubCommentList";
		}
		else{
			selectComment = "selectReplyCommentList";
			selectSubComment = "selectSubReplyCommentList";
		}
		List<Comment> commentList = new ArrayList<Comment>();
		commentList = sqlSession.selectList(COMMENT_NAMESPACE + selectComment, questionNo);
		
		for(Comment comment: commentList){
			comment.setCommentList(sqlSession.selectList(COMMENT_NAMESPACE + selectSubComment, comment));
		}
	
		return commentList;
		
	}

	@Override
	public int updateComment(Comment comment) {
		// TODO Auto-generated method stub
		return sqlSession.update(COMMENT_NAMESPACE + "updateComment",comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		return sqlSession.update(COMMENT_NAMESPACE + "deleteComment",commentNo);
	}



}
