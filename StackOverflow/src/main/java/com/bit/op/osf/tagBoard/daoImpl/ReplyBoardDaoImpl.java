package com.bit.op.osf.tagBoard.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.dao.IReplyBoardDao;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

@Repository
public class ReplyBoardDaoImpl implements IReplyBoardDao {

	@Inject
	private SqlSession sqlSession;
	
	@Inject
	private ICommentDao commentDao;

	private static final String COMMENT_NAMESPACE = "com.bit.op.osf.tagBoard.mapper.ReplyBoardMapper.";
	
	@Override
	public int insertReplyBoard(ReplyBoard replyBoard) {
		
		return sqlSession.insert(COMMENT_NAMESPACE + "insertReply", replyBoard);
	}

	@Override
	public List<ReplyBoard> selectReplyBoardList(int questionNo) {
		
		List<ReplyBoard> replyBoardList = new ArrayList<ReplyBoard>();
		replyBoardList = sqlSession.selectList(COMMENT_NAMESPACE + "selectReplyBoardList", questionNo);
		for(ReplyBoard replyBoard: replyBoardList){
			replyBoard.setCommentList(commentDao.selectCommentList(replyBoard.getReplyNo(), "reply"));
		}
		return replyBoardList;
	}

	@Override
	public void deleteReplyBoard(int replynBoardNo) {
		sqlSession.update(COMMENT_NAMESPACE + "deleteReplyBoard", replynBoardNo);
		
	}
	
}
