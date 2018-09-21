package com.bit.op.osf.tagBoard.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.model.Comment;


@Controller
public class CommentController {
	
	@Inject
	private ICommentDao commentDao;
	
	
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public String board(Comment comment) {
		commentDao.insertComment(comment);
		 
		return "redirect:/questionDetail/"+comment.getQuestionNo();
	}

}
