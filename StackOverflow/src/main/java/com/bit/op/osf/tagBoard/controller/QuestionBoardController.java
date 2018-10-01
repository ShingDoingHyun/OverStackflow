package com.bit.op.osf.tagBoard.controller;




import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

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
import com.bit.op.osf.tagBoard.model.QuestionBoardList;
import com.bit.op.osf.tagBoard.model.Search;

@Controller
public class QuestionBoardController {
	
	
	@Inject
	private IQuestionBoardDao questionBoardDao;
	

	
	@RequestMapping(value = "/popQuestionList", method = RequestMethod.GET)
	public String popQuestionList(Model model) {
		List<QuestionBoard> questionBoardList = new ArrayList<QuestionBoard>();
		questionBoardList = questionBoardDao.selectPopQuestionList();
		
		model.addAttribute("questionBoardList", questionBoardList);

		return "board/popQuestionList";
	}
	
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public String questionList(Model model, Search search) {
		QuestionBoardList questionBoardList = questionBoardList = questionBoardDao.selectQuestionList(search);
		System.out.println(questionBoardList);
		
		model.addAttribute("questionBoardList", questionBoardList);

		return "board/questionList";
	}
	
	
	
	@RequestMapping(value = "/openWriteQuestion", method = RequestMethod.GET)
	public String openWriteQuestion() {		
		
		return "board/boardWrite";
		
	}
	
	@RequestMapping(value = "/insertQuestion", method = RequestMethod.POST)
	public String insertQuestion(QuestionBoard questionBoard) {
		
		System.out.println(questionBoard);
		
		int result = questionBoardDao.insertQuestionBoard(questionBoard);
		
		return "redirect:/questionDetail/"+result;
		
	}

	@RequestMapping(value = "/openUpdateQuestion/{questionBoardNo}", method = RequestMethod.GET)
	public String openUpdateQuestion(Model model, @PathVariable("questionBoardNo") int questionBoardNo) {		
		
		model.addAttribute("questionBoard", questionBoardDao.selectQuestionDeltail(questionBoardNo));
		
		return "board/boardUpdate";
		
	}
	
	@RequestMapping(value = "/updateQuestion", method = RequestMethod.POST)
	public String updateQuestion(QuestionBoard questionBoard) {
		
		questionBoardDao.updateQuestionBoard(questionBoard);
		int result = questionBoard.getQuestionNo();
		return "redirect:/questionDetail/"+result;
		
	}
	
	
	@RequestMapping(value = "/questionDetail/{questionBoardNo}", method = RequestMethod.GET)
	public String questionDetail(Model model, @PathVariable("questionBoardNo") int questionBoardNo) {
		
		
		model.addAttribute("questionBoard", questionBoardDao.selectQuestionDeltail(questionBoardNo));
		
		return "board/questionDetail";
		
	}	
	
	@RequestMapping(value = "/deleteQuestion/{questionBoardNo}", method = RequestMethod.GET)
	public String deleteQuestion(Model model, @PathVariable("questionBoardNo") int questionBoardNo) {
		
		
		questionBoardDao.deleteQuestionBoard(questionBoardNo);
		
		return "redirect:/questionDetail/"+questionBoardNo;
		
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
