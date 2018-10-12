package com.bit.op.osf.tagBoard.controller;




import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.op.osf.member.daoImpl.MemberInfoImpl;
import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.QuestionBoardList;
import com.bit.op.osf.tagBoard.model.Search;

@Controller
public class QuestionBoardController {
	
	
	@Inject
	private IQuestionBoardDao questionBoardDao;
	
	@Inject
	private MemberInfoImpl memberInfoImpl;

	
	@RequestMapping(value = "/popQuestionList", method = RequestMethod.GET)
	public String popQuestionList(Model model, HttpServletRequest request) {
		
		List<QuestionBoard> questionBoardList = new ArrayList<QuestionBoard>();
		List<QuestionBoard> favQuestionList = new ArrayList<QuestionBoard>();
		
		questionBoardList = questionBoardDao.selectPopQuestionList(request);
		favQuestionList = questionBoardDao.selectFavQuestionList(request);
		
	
		Cookie[] cookies = request.getCookies();
		if(cookies.length> 0) {
			model.addAttribute("visitQuestionBoard", questionBoardDao.selectVisitQuestion(cookies));
		}
		
		
		model.addAttribute("questionBoardList", questionBoardList);
		model.addAttribute("favQuestionList", favQuestionList);
		
		return "board/popQuestionList";
	}
	
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public String questionList(Model model, Search search, HttpServletRequest request) {
		
		List<QuestionBoard> favQuestionList = new ArrayList<QuestionBoard>();
		
		MemRegInfo memInfo =  (MemRegInfo)  request.getSession().getAttribute("memInfo");
		QuestionBoardList questionBoardList = questionBoardDao.selectQuestionList(search, memInfo);
		favQuestionList = questionBoardDao.selectFavQuestionList(request);

		
		
		Cookie[] cookies = request.getCookies();
		if(cookies.length> 0) {
			model.addAttribute("visitQuestionBoard", questionBoardDao.selectVisitQuestion(cookies));
		}
		
		model.addAttribute("questionBoardList", questionBoardList);
		model.addAttribute("favQuestionList", favQuestionList);
		
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
	public String openUpdateQuestion(Model model, @PathVariable("questionBoardNo") int questionBoardNo, HttpServletRequest request) {		
		
		model.addAttribute("questionBoard", questionBoardDao.selectQuestionDeltail(questionBoardNo, request));
		
		return "board/boardUpdate";
		
	}
	
	@RequestMapping(value = "/updateQuestion", method = RequestMethod.POST)
	public String updateQuestion(QuestionBoard questionBoard) {
		
		questionBoardDao.updateQuestionBoard(questionBoard);
		int result = questionBoard.getQuestionNo();
		return "redirect:/questionDetail/"+result;
		
	}
	
	
	@RequestMapping(value = "/questionDetail/{questionBoardNo}", method = RequestMethod.GET)
	public String questionDetail(Model model, @PathVariable("questionBoardNo") int questionBoardNo, HttpServletRequest request) {
		QuestionBoard questionBoard = questionBoardDao.selectQuestionDeltail(questionBoardNo, request);
		
		model.addAttribute("questionBoard", questionBoard);
		
		
		model.addAttribute("memberInfo", memberInfoImpl.selectMember(questionBoard.getMemId(), null));
		int  a = questionBoardDao.selectMemberQuestionVote(questionBoard, request);
		System.out.println(a+"뭐냐");
		model.addAttribute("memberVote", a);
		
		
		
		return "board/questionDetail";
		
	}	
	
	@RequestMapping(value = "/deleteQuestion/{questionBoardNo}", method = RequestMethod.GET)
	public String deleteQuestion(Model model, @PathVariable("questionBoardNo") int questionBoardNo) {
		
		
		questionBoardDao.deleteQuestionBoard(questionBoardNo);
		
		return "redirect:/questionDetail/"+questionBoardNo;
		
	}	
	
	@RequestMapping(value = "/checkQuestionFav", method = RequestMethod.POST)
	@ResponseBody
	public List<QuestionBoard> checkQuestionFav(QuestionBoard questionBoard, HttpServletRequest request ) {
		
		int result = questionBoardDao.changeFavQuestion(questionBoard);
	
		return questionBoardDao.selectFavQuestionList(request);

		
	}
	
	@RequestMapping(value = "/changeVote", method = RequestMethod.POST)
	@ResponseBody
	public String chageVote(QuestionBoard questionBoard) {
		
		int result = questionBoardDao.chageVote(questionBoard);
		return result+"";
		
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
