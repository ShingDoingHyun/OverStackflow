package com.bit.op.osf.tagBoard.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.op.osf.tagBoard.dao.ITagDao;
import com.bit.op.osf.tagBoard.model.Tag;

@Repository
public class TagDaoImpl implements ITagDao {
	
	@Inject
	SqlSession sqlSession;
	
	private static final String COMMENT_NAMESPACE = "com.bit.op.osf.tagBoard.mapper.TagMapper.";
	
	@Override
	public List<Tag> selectTagList(){
		
		return sqlSession.selectList(COMMENT_NAMESPACE + "selectTagList");
		
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

		return sqlSession.selectList(COMMENT_NAMESPACE + "selectTagNameList", middleTag);
	}

	@Override
	public int insertQuestionTag(Integer tagNo, Integer questionNo) {
		Map<String, Integer> map = new  HashMap<String, Integer>();
		map.put("questionNo", questionNo);
		map.put("tagNo", tagNo);
		
		return sqlSession.insert(COMMENT_NAMESPACE + "insertQuestionTag", map);
	}


	
	
	
	
	
	

}
