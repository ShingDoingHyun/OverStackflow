package com.bit.op.osf.tagBoard.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.dao.ITagDao;
import com.bit.op.osf.tagBoard.model.MemFavTag;
import com.bit.op.osf.tagBoard.model.QuestionTag;
import com.bit.op.osf.tagBoard.model.Search;
import com.bit.op.osf.tagBoard.model.Tag;

@Repository
public class TagDaoImpl implements ITagDao {
	
	@Inject
	SqlSession sqlSession;
	
	private static final String COMMENT_NAMESPACE = "com.bit.op.osf.tagBoard.mapper.TagMapper.";
	
	@Override
	public List<Tag> selectTagList(Search search){
		
		return sqlSession.selectList(COMMENT_NAMESPACE + "selectTagList", search);
		
	}
	
	@Override
	public List<Tag> selectTagMainNameList(){
		
		return sqlSession.selectList(COMMENT_NAMESPACE + "selectTagMainNameList");
		
	}

	@Override
	public List<Tag> selectTagMiddleNameList(String mainTag) {

		return sqlSession.selectList(COMMENT_NAMESPACE + "selectTagMiddleNameList", mainTag);
	}

	@Override
	public List<Tag> selectTagNameList(String middleTag) {
		System.out.println(middleTag);
		return sqlSession.selectList(COMMENT_NAMESPACE + "selectTagNameList", middleTag);
	}

	@Override
	public int insertQuestionTag(Integer tagNo, Integer questionNo) {
		Map<String, Integer> map = new  HashMap<String, Integer>();
		map.put("questionNo", questionNo);
		map.put("tagNo", tagNo);
		
		return sqlSession.insert(COMMENT_NAMESPACE + "insertQuestionTag", map);
	}

	@Override
	public List<QuestionTag> selectQuestionTag(int result) {

		return sqlSession.selectList(COMMENT_NAMESPACE + "selectQuestionTag", result);
	}

	@Override
	public void deleteQuestionTag(QuestionTag questionTag1) {
		// TODO Auto-generated method stub
		sqlSession.delete(COMMENT_NAMESPACE + "delectQuestionTag", questionTag1);
	}

	@Override
	public int updateMemFavTag(MemFavTag memFavTag, MemRegInfo memInfo) {
		
		memFavTag.setMemId(memInfo.getMemberId());
		
		System.out.println(memFavTag);
		int result = sqlSession.selectOne(COMMENT_NAMESPACE + "seleteMemFavTag", memFavTag );
		System.out.println(result);
		if(result==0)
			sqlSession.insert(COMMENT_NAMESPACE + "insertMemFavTag", memFavTag );
		else
			sqlSession.delete(COMMENT_NAMESPACE + "deleteMemFavTag", memFavTag );
		
		return 1;
	}

	@Override
	public List<Tag> selectMemFavTagList(MemRegInfo memInfo) {

		return sqlSession.selectList(COMMENT_NAMESPACE + "selectMemFavTagList", memInfo);
	}

	@Override
	public Object selectTagListBySearch(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNewTagName(Tag tag) {
		// TODO Auto-generated method stub
		System.out.println("1"+tag);
		return sqlSession.insert(COMMENT_NAMESPACE + "insertTag", tag);
	}

	@Override
	public List<Tag> selectTagRankList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(COMMENT_NAMESPACE + "selecteTagRackList");
	}

	@Override
	public void updateTagDeatil(Tag tag) {
		sqlSession.update(COMMENT_NAMESPACE + "updateTagDeatil", tag);
		
	}

	@Override
	public Tag selectTag(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(COMMENT_NAMESPACE + "selectTag", search);
	}


	
	
	
	
	
	

}
