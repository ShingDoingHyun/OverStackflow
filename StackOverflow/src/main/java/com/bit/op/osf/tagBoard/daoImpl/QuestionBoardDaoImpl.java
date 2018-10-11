package com.bit.op.osf.tagBoard.daoImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.dao.IReplyBoardDao;
import com.bit.op.osf.tagBoard.dao.ITagDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.QuestionBoardList;
import com.bit.op.osf.tagBoard.model.QuestionTag;
import com.bit.op.osf.tagBoard.model.Search;
import com.bit.op.osf.tagBoard.model.Tag;
import com.mysql.fabric.xmlrpc.base.Member;


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
	
	private static final int QUESTION_BOARD_COUNT_PER_PAGE = 10;

	@Override
	public int insertQuestionBoard(QuestionBoard questionboard) {

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
	public List<QuestionBoard> selectPopQuestionList(HttpServletRequest request) {
		List<QuestionBoard> questionBoardList = sqlSession.selectList(QUSETION_NAMESPACE + "selectPopQuestion");

		
		HttpSession session = request.getSession();
		MemRegInfo memInfo =  (MemRegInfo) session.getAttribute("memInfo");
		
		for (QuestionBoard questionBoard : questionBoardList) {
			
			//즐겨찾기
			if(memInfo!=null) {
				Map map = new HashMap();
				map.put("questionNo", questionBoard.getQuestionNo());
				map.put("memberId", memInfo.getMemberId());	
				int result = sqlSession.selectOne(QUSETION_NAMESPACE + "selectFavQuestion", map) != null ? 1 : 0;
				questionBoard.setFav(result);
			}
			
			//태그설정
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
			
		}

		return questionBoardList;
	}

	@Override
	public QuestionBoardList selectQuestionList(Search search, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemRegInfo memInfo =  (MemRegInfo) session.getAttribute("memInfo");
		
		int currentPageNumber = search.getPage() > 0 ? search.getPage() : 1; 

		int questionBoardTotalCount = sqlSession.selectOne(QUSETION_NAMESPACE + "selectCount", search);

		List<QuestionBoard> questionBoardList = null;
		
		int firstRow = 0;
		int endRow = 0;
		
		if (questionBoardTotalCount > 0) {
			search.setFirstRow(((currentPageNumber - 1) * QUESTION_BOARD_COUNT_PER_PAGE));
			search.setEndRow(QUESTION_BOARD_COUNT_PER_PAGE);
			
			questionBoardList = sqlSession.selectList(QUSETION_NAMESPACE + "selectQuestion", search);
			
			for (QuestionBoard questionBoard : questionBoardList) {
				
				//즐겨찾기
				if(memInfo!=null) {
					Map map = new HashMap();
					map.put("questionNo", questionBoard.getQuestionNo());
					map.put("memberId", memInfo.getMemberId());	
					int result = sqlSession.selectOne(QUSETION_NAMESPACE + "selectFavQuestion", map) != null ? 1 : 0;
					questionBoard.setFav(result);
				}
				
				
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
	public QuestionBoard selectQuestionDeltail(int questionNo, HttpServletRequest request) {

		updateQuestionView(questionNo);
		QuestionBoard questionBoard = selectQuestionNo(questionNo, request);
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
	
	
	
	@Override
	public List<QuestionBoard> selectVisitQuestion(Cookie[] cookies) {

		List<QuestionBoard> vistiQuestionBoardList = new ArrayList<QuestionBoard>();
		for(int i=0; i < cookies.length; i++) {

			if(cookies[i].getName().equals("visitQuestion")) {
				String[] visitQuestionArr = cookies[i].getValue().split("%2C");
				
				List<String> list = Arrays.asList(visitQuestionArr);			
				Collections.reverse(list);			
				visitQuestionArr = list.toArray(new String[list.size()]);
				
				int lenght = visitQuestionArr.length < 5 ? visitQuestionArr.length : 5;
				for(int index=0; index < lenght; i++) {
					QuestionBoard question = new QuestionBoard();
					question.setQuestionNo(Integer.parseInt(visitQuestionArr[index++]));
					vistiQuestionBoardList.add(question);
				}
				
			}
		}

		for(QuestionBoard question : vistiQuestionBoardList) {
			question.setTitle(sqlSession.selectOne(QUSETION_NAMESPACE + "selectVisitQuestion", question.getQuestionNo()));
		}	
		return vistiQuestionBoardList;
	}

	@Override
	public int changeFavQuestion(QuestionBoard questionBoard) {
		int a = sqlSession.delete(QUSETION_NAMESPACE + "deleteFavQuestion", questionBoard);
		System.out.println(a+":결과");
		if(a<=0) {
			sqlSession.insert(QUSETION_NAMESPACE + "insertFavQuestion", questionBoard);
			return 1;
		}else {		
			return 0;
		}
	}
	
	
	
	
	
	public QuestionBoard selectQuestionNo(int questionNo, HttpServletRequest request) {

		QuestionBoard questionBoard = sqlSession.selectOne(QUSETION_NAMESPACE + "selectQuestionNo", questionNo);
		
		HttpSession session = request.getSession();
		MemRegInfo memInfo =  (MemRegInfo) session.getAttribute("memInfo");
		
		//즐겨찾기
		if(memInfo!=null) {
			Map map = new HashMap();
			map.put("questionNo", questionBoard.getQuestionNo());
			map.put("memberId", memInfo.getMemberId());	
			int result = sqlSession.selectOne(QUSETION_NAMESPACE + "selectFavQuestion", map) != null ? 1 : 0;
			questionBoard.setFav(result);
		}
		
		
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
	public List<QuestionBoard> selectFavQuestionList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemRegInfo memInfo =  (MemRegInfo) session.getAttribute("memInfo");
		
		return sqlSession.selectList(QUSETION_NAMESPACE + "selectFavQuestionList", memInfo);
	}



	@Override
	public int chageVote(QuestionBoard questionBoard) {
		if(questionBoard.getView() != 0){
			sqlSession.insert(QUSETION_NAMESPACE + "voteUpDown", questionBoard);
		}else {
			sqlSession.delete(QUSETION_NAMESPACE + "deleteVoteUpDown", questionBoard);
		}
	
		int qustionVote  = sqlSession.selectOne(QUSETION_NAMESPACE + "questionVoteCheck", questionBoard);
		questionBoard.setVote(qustionVote);
		sqlSession.update(QUSETION_NAMESPACE + "questionVoteUpdate", questionBoard);
		return qustionVote;
		
	}

	


}
