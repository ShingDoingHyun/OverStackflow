package com.bit.op.osf.tagBoard.controller;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.op.osf.tagBoard.dao.ICommentDao;
import com.bit.op.osf.tagBoard.model.Comment;


@Controller
public class CommentController {
	
	@Inject
	private ICommentDao commentDao;
	
	
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public String insertComment(Comment comment) {
		commentDao.insertComment(comment);
		 
		return "redirect:/questionDetail/"+comment.getQuestionNo();
	}
	
	@RequestMapping(value = "/updateComment", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String updateComment(Comment comment){
		
		System.out.println(comment);
		
		commentDao.updateComment(comment);
		 
		return comment.getContent();
	}
	
	@RequestMapping(value = "/deleteComment", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String deleteComment(@RequestParam("commentNo") int commentNo){
		System.out.println(commentNo);
		commentDao.deleteComment(commentNo);
		return null;
	}

}
