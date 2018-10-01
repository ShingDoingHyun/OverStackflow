package com.bit.op.osf.tagBoard.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.dao.IReplyBoardDao;
import com.bit.op.osf.tagBoard.dao.ITagDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.Tag;

@Repository
public class QuestionBoardDaoImpl implements IQuestionBoardDao {

	@Inject
	private SqlSession sqlSession;
	
	@Inject
	private ICommentDao commentDao;
	
	@Inject
	private IReplyBoardDao replyBoardDao;
	
	@Inject
	private ITagDao tagDao;
	

	private static final String QUSETION_NAMESPACE = "com.bit.op.osf.tagBoard.mapper.QuestionBoardMapper.";

	@Override
	public int insertQuestionBoard(QuestionBoard questionboard) {
		
	
		sqlSession.insert(QUSETION_NAMESPACE + "insertQuestion", questionboard);
		int result = questionboard.getQuestionNo();
		
		System.out.println(questionboard.getTags());
		String[] tagList =  questionboard.getTags().split("#");
		System.out.println(tagList);
		for(String tagNo : tagList) {
			
			if(tagNo!=null && tagNo!= "") {
				System.out.println("태그의 값 빈값은 안나온다 : " + tagNo);
				try {
					tagDao.insertQuestionTag(Integer.parseInt(tagNo), result);
				}catch (Exception e) {
					// TODO: handle exception
				}
			}
		}


		return result;
	}

	@Override
	public QuestionBoard selectQuestionNo(int questionNo) {
		
		return sqlSession.selectOne(QUSETION_NAMESPACE + "selectQuestionNo", questionNo);
	}

	@Override
	public List<QuestionBoard> selectPopQuestionList() {
		List<QuestionBoard> questionBoardList = sqlSession.selectList(QUSETION_NAMESPACE + "selectPopQuestion");
		
		for(QuestionBoard questionBoard : questionBoardList) {
			if(questionBoard.getTags()!=null && questionBoard.getTags()!= "") {
				String[] tags = questionBoard.getTags().split(" ");
				
				List<Tag> tagList = new ArrayList<Tag>();
				
				for(String tag : tags) {
					Tag getTag = new Tag();
					getTag.setTagName(tag);
					tagList.add(getTag);
				}
				
				questionBoard.setTagList(tagList);
			}
		}
		
		return questionBoardList;
	}
	
	@Override
	public int updateQuestionView(int questionNo) {
		
		int result = sqlSession.update(QUSETION_NAMESPACE + "updateQuestionView", questionNo);
		return result;
	}
	
	

	
	@Override
	public QuestionBoard selectQuestionDeltail(int questionNo) {
		
		updateQuestionView(questionNo);
		QuestionBoard questionBoard = selectQuestionNo(questionNo);	
		questionBoard.setReplyBoardList(replyBoardDao.selectReplyBoardList(questionNo));
		questionBoard.setCommentList(commentDao.selectCommentList(questionBoard.getQuestionNo(), "question"));
		return questionBoard;
	}

	@Override
	public int updateQuestionBoard(QuestionBoard questionBoard) {
		
		sqlSession.update(QUSETION_NAMESPACE + "updateQuestion", questionBoard);
		int result = questionBoard.getQuestionNo();
		return result;
	}

	@Override
	public int deleteQuestionBoard(int questionBoardNo) {

		return sqlSession.update(QUSETION_NAMESPACE + "deleteQuestion", questionBoardNo);
	}
	

}
