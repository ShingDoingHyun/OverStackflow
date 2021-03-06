package com.bit.op.osf.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.op.osf.member.SHA256.SHA256;
import com.bit.op.osf.member.dao.MemberInfoDao;
import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.dao.IQuestionBoardDao;
import com.bit.op.osf.tagBoard.dao.ITagDao;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.ReplyBoard;
import com.bit.op.osf.tagBoard.model.Tag;

@Controller
public class MemController {
	
	
	@Inject
	private MemberInfoDao memberInfoDao;
	
	

	
	@Inject
	private ITagDao tagDao;
	
	@Inject
	private IQuestionBoardDao questionBoardDao;
	
	@Autowired
	SHA256 SHA;
	
	// 1. 저장 경로 설정
	String uploadUri = "/resources/uploadFile/memberPhoto";
	String uploadUriDir;
	// 개인/기업회원가입 선택페이지
	@RequestMapping(value = "/joinChoiceForm", method = RequestMethod.GET)
	public String ChoiceJoinForm() {
		
		return "login/joinchoiceform"; 
	}
	
	
	@RequestMapping(value = "/memJoinForm", method = RequestMethod.GET)
	public String JoinForm() {
		
		return "login/memjoinform"; 
	}
	
	
	@RequestMapping(value = "/memJoinFormTest", method = RequestMethod.POST)
	public String JoinTest(MemRegInfo memInfo, HttpServletRequest request, Model model)throws Exception {
		System.out.println(memInfo);
		model.addAttribute("insertCnt", memberInfoDao.insertMemberInfo(memInfo, request));
		model.addAttribute("memInfo",memInfo);
		model.addAttribute("memberId",memInfo.getMemberId());
		return "login/joinInsertCheck"; 
	}
	
	
	@RequestMapping(value = "/memJoinForm", method = RequestMethod.POST)
	public String memberJoin(MemRegInfo memInfo, Model model, HttpServletRequest request)throws Exception {
		System.out.println("meminfo : " + memInfo);
		// 2. 시스템의 물리적인 경로
		uploadUriDir = request.getSession().getServletContext().getRealPath(uploadUri);
		/*int insertCnt = memberInfoDao.insertMemberInfo(memInfo, request);
		*/
		memInfo.setRealPath(uploadUriDir);
		int insertCnt = memberInfoDao.insertMemberInfo(memInfo);
		
		model.addAttribute("memberID",memInfo.getMemberId());
		model.addAttribute("insertCnt",insertCnt);
		
		System.out.println(memInfo);
		return "login/joinInsertCheck"; 
	}
	
	
	@RequestMapping(value = "/memLoginForm", method = RequestMethod.GET)
	public String Loginform(Model model) {
		return "login/loginform";
	}
	
	
	@RequestMapping(value = "/memberProfile", method = RequestMethod.GET)
	public String memberProfile(HttpSession session, Model model) throws Exception {	
		MemRegInfo memInfo = (MemRegInfo)session.getAttribute("memInfo");
		String memId=  memInfo.getMemberId();
		
		List<ReplyBoard> replyBoards  =  memberInfoDao.selectAnswerInfo(memId);
		session.setAttribute("replyBoards", replyBoards);
		
		List<QuestionBoard> questionBoards  =  memberInfoDao.selectQuestionInfo(memId);
		session.setAttribute("questionBoards", questionBoards);		
		
		model.addAttribute("favQuestionList", questionBoardDao.selectFavQuestionList(memInfo));
		model.addAttribute("favTagList", tagDao.selectMemFavTagList(memInfo));
		//tags
		
		
			return "/memberMypage/memberProfile"; 
	}
	
	
	
	@RequestMapping(value = "/memberProSet", method = RequestMethod.GET)
	public String memberProfileSet(HttpSession session) {
		MemRegInfo memInfo = (MemRegInfo)session.getAttribute("memInfo");
		
		session.setAttribute("memInfo",memInfo);
		
			return "/memberMypage/memberProSet"; 
	}
	
	
	
		
	
	
	//memberProfileUpdate   post
	
	@RequestMapping(value = "/memberProfileUpdate")
	public String memberProfileUpdate(HttpSession session,  @RequestParam String memberPwd, @RequestParam String memberIntro, @RequestParam String memberPhone ,
			@RequestParam String memberNickname,@RequestParam  MultipartFile memberPhotoFile, HttpServletRequest request) throws Exception {
		
		
//	public String memberProfileUpdate(HttpSession session, MemRegInfo memInfo, Model model ) throws Exception {
		
	
		
		MemRegInfo memInfo=(MemRegInfo)session.getAttribute("memInfo");
		memInfo.setMemberPwd(memberPwd);
		memInfo.setMemberIntro(memberIntro);
		memInfo.setMemberNickname(memberNickname);
		memInfo.setMemberPhone(memberPhone);
		memInfo.setMemberPhotoFile(memberPhotoFile);
	  	//myPageInfoDao.memberProfileUpdate(memInfo);
		if(	memberInfoDao.memberProfileUpdate(memInfo, request) > 0) {
			session.setAttribute("memInfo", memInfo);
			
			return  "/memberMypage/memberProfile" ;
		}else {			
			return  "/memberMypage/memberProSet" ; 
		}	
	}
	
	
	
	
	  @RequestMapping(value = "/memLoginForm", method = RequestMethod.POST)
	   public String memberLogin(@RequestParam("memberId") String id, @RequestParam("memberPwd") String pw, Model model,
			HttpServletRequest request) {
	
		// 2-1.세션 만들기
		HttpSession session = request.getSession();
	
		// 1-1.회원 정보 불러오기
		MemRegInfo memInfo = memberInfoDao.selectMember(id, pw);
	
		if (memInfo!= null) {
	
			if (id.equals(memInfo.getMemberId()) && SHA.encrypt(pw).equals(memInfo.getMemberPwd())) {
				model.addAttribute("memInfo", memInfo);
				session.setAttribute("memInfo", memInfo);
			}
		}
	
		return "login/logincheck";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		if(session.getAttribute("memInfo")!=null) {
		session.removeAttribute("memInfo");
		session.invalidate();
		}
		
		else if(session.getAttribute("comInfo")!=null) {
			session.removeAttribute("comInfo");
			session.invalidate();
		}
	
	 return "redirect:/";
	}

	
	
	@RequestMapping(value = "/selectMemberList")
	public String selectMemberList(Model model) {
		
		model.addAttribute("memberRackList", memberInfoDao.selectMemberRankList());
		return "rank/memberRank";

	}

}
