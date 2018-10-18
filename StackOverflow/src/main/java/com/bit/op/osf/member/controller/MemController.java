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

import com.bit.op.osf.member.SHA256.SHA256;
import com.bit.op.osf.member.dao.MemberInfoDao;
import com.bit.op.osf.member.dao.MyPageInfoDao;
import com.bit.op.osf.member.model.MemRegInfo;
import com.bit.op.osf.tagBoard.model.QuestionBoard;
import com.bit.op.osf.tagBoard.model.ReplyBoard;

@Controller
public class MemController {
	
	
	@Inject
	private MemberInfoDao memberInfoDao;
	
	
	@Inject
	private MyPageInfoDao myPageInfoDao;
	
	
	@Autowired
	SHA256 SHA;
	
	
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
		
		int insertCnt = memberInfoDao.insertMemberInfo(memInfo, request);
		
		
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
	public String memberProfile(HttpSession session) throws Exception {	
		MemRegInfo memInfo = (MemRegInfo)session.getAttribute("memInfo");
		String memId=  memInfo.getMemberId();
		
		List<ReplyBoard> replyBoards  =  myPageInfoDao.selectAnswerInfo(memId);
		session.setAttribute("replyBoards", replyBoards);
		
		List<QuestionBoard> questionBoards  =  myPageInfoDao.selectQuestionInfo(memId);
		session.setAttribute("questionBoards", questionBoards);		
		
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
	public String memberProfileUpdate(HttpSession session,  @RequestParam String memberPwd, @RequestParam String memberIntro, @RequestParam String memberPhone ,@RequestParam String memberNickname) {
		MemRegInfo memInfo=(MemRegInfo)session.getAttribute("memInfo");
		memInfo.setMemberPwd(memberPwd);
		memInfo.setMemberIntro(memberIntro);
		memInfo.setMemberNickname(memberNickname);
		memInfo.setMemberPhone(memberPhone);
		
	  	//myPageInfoDao.memberProfileUpdate(memInfo);
		if(	myPageInfoDao.memberProfileUpdate(memInfo) > 0) {
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
