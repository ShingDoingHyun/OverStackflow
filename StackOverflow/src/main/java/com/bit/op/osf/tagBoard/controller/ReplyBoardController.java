package com.bit.op.osf.tagBoard.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.op.osf.tagBoard.dao.IReplyBoardDao;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

@Controller
public class ReplyBoardController {
	
	@Inject
	private IReplyBoardDao replyBoardDao;
	
	
	@RequestMapping(value = "/insertReply", method = RequestMethod.POST)
	public String insertReply(ReplyBoard replyBoard) {
		
		replyBoardDao.insertReplyBoard(replyBoard);

		return "redirect:/questionDetail/"+replyBoard.getQuestionNo();
	}

	@RequestMapping(value = "/deleteReply/{replynBoardNo}", method = RequestMethod.GET)
	public String deleteQuestion(Model model, @PathVariable("replynBoardNo") int replynBoardNo) {
		
		
		replyBoardDao.deleteReplyBoard(replynBoardNo);
		
		return "redirect:/questionDetail/"+replynBoardNo;
		
	}	
}
