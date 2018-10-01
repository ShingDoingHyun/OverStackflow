package com.bit.op.osf.tagBoard.dao;

import java.util.List;

import com.bit.op.osf.tagBoard.model.Tag;



public interface ITagDao {

	List<Tag> selectTagList();

	List<Tag> selectTagMainNameList();

	List<Tag> selectTagMiddleNameList(String mainTag);
	
	List<Tag> selectTagNameList(String middleTag);

	int insertQuestionTag(Integer tagNo, Integer questionNo);

}
