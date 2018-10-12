package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.op.osf.tagBoard.model.MemFavTag;
import com.bit.op.osf.tagBoard.model.QuestionTag;
import com.bit.op.osf.tagBoard.model.Tag;



public interface ITagDao {

	List<Tag> selectTagList();

	List<Tag> selectTagMainNameList();

	List<Tag> selectTagMiddleNameList(String mainTag);
	
	List<Tag> selectTagNameList(String middleTag);

	int insertQuestionTag(Integer tagNo, Integer questionNo);

	List<QuestionTag> selectQuestionTag(int result);

	void deleteQuestionTag(QuestionTag questionTag1);

	int updateMemFavTag(MemFavTag memFavTag, HttpServletRequest request);

	List<Tag> selectMemFavTagList(HttpServletRequest request);

}
