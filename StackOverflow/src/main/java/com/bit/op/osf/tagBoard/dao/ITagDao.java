package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.model.MemFavTag;
import com.bit.op.osf.tagBoard.model.QuestionTag;
import com.bit.op.osf.tagBoard.model.Search;
import com.bit.op.osf.tagBoard.model.Tag;



public interface ITagDao {

	List<Tag> selectTagList(Search search);

	List<Tag> selectTagMainNameList();

	List<Tag> selectTagMiddleNameList(String mainTag);
	
	List<Tag> selectTagNameList(String middleTag);

	int insertQuestionTag(Integer tagNo, Integer questionNo);

	List<QuestionTag> selectQuestionTag(int result);

	void deleteQuestionTag(QuestionTag questionTag1);

	int updateMemFavTag(MemFavTag memFavTag, MemRegInfo memInfo);

	List<Tag> selectMemFavTagList(MemRegInfo memInfo);

	Object selectTagListBySearch(Search search);

	int insertNewTagName(Tag tag);

	List<Tag> selectTagRankList();

	void updateTagDeatil(Tag tag);

	Tag selectTag(Search search);

}
