package com.bit.op.osf.tagBoard.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.op.osf.tagBoard.dao.ITagDao;
import com.bit.op.osf.tagBoard.model.MemFavTag;
import com.bit.op.osf.tagBoard.model.Tag;


@Controller
public class TagContoller {

	@Inject
	ITagDao tagDao;
	
	
	@RequestMapping(value = "/selectTagList")
	public String selectTagList() {
		
		return "";

	}
	
	@RequestMapping(value = "/selectTagMainName")
	public @ResponseBody List<Tag> selectTaMainName() {
	
		return tagDao.selectTagMainNameList();

	}
	
	@RequestMapping(value = "/selectTagMiddleName")
	public @ResponseBody List<Tag> selectTagMiddleName(String mainTag) {
	
		return tagDao.selectTagMiddleNameList(mainTag);

	}
	
	@RequestMapping(value = "/selectTagName")
	public @ResponseBody List<Tag> selectTagName(String middleTag) {
	
		return tagDao.selectTagNameList(middleTag);

	}
	
	@RequestMapping(value = "/updateMemFavTag", method = RequestMethod.POST)
	@ResponseBody
	public String updateMemFavTag(MemFavTag memFavTag, HttpServletRequest request) {
		
		int result = tagDao.updateMemFavTag(memFavTag, request);
		return result+"";
		
	}
	
	
}
