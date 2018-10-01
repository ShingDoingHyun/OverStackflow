package com.bit.op.osf.tagBoard.daoImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.dao.IReplyBoardDao;
import com.bit.op.osf.tagBoard.dao.ITagDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.QuestionBoardList;
import com.bit.op.osf.tagBoard.model.QuestionTag;
import com.bit.op.osf.tagBoard.model.Search;
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
	
	private static final int QUESTION_BOARD_COUNT_PER_PAGE = 5;

	@Override
	public int insertQuestionBoard(QuestionBoard questionboard) {

		System.out.println(questionboard);
		sqlSession.insert(QUSETION_NAMESPACE + "insertQuestion", questionboard);

		int result = questionboard.getQuestionNo();

		String[] tagList = questionboard.getTags().split("#");
		for (String tagNo : tagList) {

			if (tagNo != null && tagNo != "") {
				try {
					tagDao.insertQuestionTag(Integer.parseInt(tagNo), result);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}

		return result;
	}

	@Override
	public QuestionBoard selectQuestionNo(int questionNo) {

		QuestionBoard questionBoard = sqlSession.selectOne(QUSETION_NAMESPACE + "selectQuestionNo", questionNo);

		if (questionBoard.getTags() != null && questionBoard.getTags() != "") {
			String[] tags = questionBoard.getTags().split(" ");
			String[] tagNos = questionBoard.getTagNos().split(" ");

			List<Tag> tagList = new ArrayList<Tag>();
			int index = 0;
			for (String tag : tags) {
				Tag getTag = new Tag();
				getTag.setTagName(tag);
				getTag.setTagNo(Integer.parseInt(tagNos[index]));
				tagList.add(getTag);
				index++;
			}

			questionBoard.setTagList(tagList);
		}

		return questionBoard;
	}

	@Override
	public List<QuestionBoard> selectPopQuestionList() {
		List<QuestionBoard> questionBoardList = sqlSession.selectList(QUSETION_NAMESPACE + "selectPopQuestion");

		for (QuestionBoard questionBoard : questionBoardList) {
			if (questionBoard.getTags() != null && questionBoard.getTags() != "") {
				String[] tags = questionBoard.getTags().split(" ");

				List<Tag> tagList = new ArrayList<Tag>();

				for (String tag : tags) {
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
	public QuestionBoardList selectQuestionList() {
		// TODO Auto-generated method stub
		
		int pageNumber = 0;
		
		int currentPageNumber = pageNumber > 0 ? pageNumber : 1; 

		int questionBoardTotalCount = sqlSession.selectOne(QUSETION_NAMESPACE + "selectCount");
		System.out.println(questionBoardTotalCount);
		List<QuestionBoard> questionBoardList = null;
		
		int firstRow = 0;
		int endRow = 0;
		
		if (questionBoardTotalCount > 0) {
			Search search = new Search();
			search.setFirstRow(((currentPageNumber - 1) * QUESTION_BOARD_COUNT_PER_PAGE));
			search.setEndRow(QUESTION_BOARD_COUNT_PER_PAGE);
			
			questionBoardList = sqlSession.selectList(QUSETION_NAMESPACE + "selectQuestion", search);
			
			for (QuestionBoard questionBoard : questionBoardList) {
				if (questionBoard.getTags() != null && questionBoard.getTags() != "") {
					String[] tags = questionBoard.getTags().split(" ");

					List<Tag> tagList = new ArrayList<Tag>();

					for (String tag : tags) {
						Tag getTag = new Tag();
						getTag.setTagName(tag);
						tagList.add(getTag);
					}

					questionBoard.setTagList(tagList);
				}
			}
		} else {
			currentPageNumber = 0;
			questionBoardList = Collections.emptyList();
		}

		return new QuestionBoardList(questionBoardList, currentPageNumber, questionBoardTotalCount, QUESTION_BOARD_COUNT_PER_PAGE, firstRow, endRow);
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

		List<QuestionTag> questionTagList = tagDao.selectQuestionTag(result);

		String[] tagList = questionBoard.getTags().split("#");

		for (QuestionTag questionTag : questionTagList) {
			int check = 0;
			int val = 0;
			for (String tagNo : tagList) {
				val = questionTag.getTagNo();
				try {
					int tagNoInt = Integer.parseInt(tagNo);

					if (val == tagNoInt) {
						check = 1;
						break;
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			if (check == 0) {
				QuestionTag questionTag1 = new QuestionTag(result, val);
				tagDao.deleteQuestionTag(questionTag1);
			}
		}

		for (String tagNo : tagList) {
			if (tagNo != null && tagNo != "") {

				try {
					tagDao.insertQuestionTag(Integer.parseInt(tagNo), result);
				} catch (Exception e) {
					// TODO: handle exception
				}

			}
		}

		return result;
	}

	@Override
	public int deleteQuestionBoard(int questionBoardNo) {

		return sqlSession.update(QUSETION_NAMESPACE + "deleteQuestion", questionBoardNo);
	}


}
