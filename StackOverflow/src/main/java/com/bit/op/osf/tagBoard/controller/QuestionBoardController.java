package com.bit.op.osf.tagBoard.controller;




import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;

@Controller
public class QuestionBoardController {
	
	
	@Inject
	private IQuestionBoardDao questionBoardDao;
	
	
	@RequestMapping(value = "/popQuestionList", method = RequestMethod.GET)
	public String board(Model model) {
		List<QuestionBoard> questionBoardList = new ArrayList<QuestionBoard>();
		questionBoardList = questionBoardDao.selectPopQuestionList();
		
		model.addAttribute("questionBoardList", questionBoardList);
		return "board/popQuestionList";
	}
	
	
	
	@RequestMapping(value = "/openWriteQuestion", method = RequestMethod.GET)
	public String openWriteQuestion(Model model) {

		
		return "board/boardWrite";
		
	}
	
	@RequestMapping(value = "/insertQuestion", method = RequestMethod.POST)
	public String insertQuestion(Model model, QuestionBoard questionBoardNo) {
		
		//시퀀스 1로 받아오는 문제 나중에 수정...
		model.addAttribute("questionBoard", questionBoardDao.insertQuestionAction(questionBoardNo));
		
		return "board/questionDetail";
		
	}
	
	@RequestMapping(value = "/questionDetail/{questionBoardNo}", method = RequestMethod.GET)
	public String questionDetail(Model model, @PathVariable("questionBoardNo") int questionBoardNo) {
		
		
		model.addAttribute("questionBoard", questionBoardDao.selectQuestionDeltail(questionBoardNo));
		
		return "board/questionDetail";
		
	}
	
	


	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	@ResponseBody
	public String profileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {

		String uploadUri = "/resources/image";

		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		String imgName = System.currentTimeMillis() + file.getOriginalFilename();
		byte[] data = file.getBytes();
		FileOutputStream fos = new FileOutputStream(dir + "/" + imgName);
		fos.write(data);
		fos.close();
		System.out.println(dir + "/" + imgName);

		return "/image/"+imgName;
	}
}
