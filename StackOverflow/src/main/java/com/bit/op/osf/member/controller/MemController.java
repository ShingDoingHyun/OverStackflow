package com.bit.op.osf.member.controller;

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
import com.bit.op.osf.member.daoImpl.MemberInfoImpl;
import com.bit.op.osf.member.model.MemRegInfo;

@Controller
public class MemController {
	
	@Inject
	private MemberInfoDao memberInfoDao;
	
	
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
	public String Join(MemRegInfo memInfo, Model model, HttpServletRequest request)throws Exception {
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
	
	//프로필 사진 클릭 프로필정보로 이동 
		@RequestMapping(value = "/memberProfile", method = RequestMethod.GET)
		public String Profile() {
				return "/memberMypage/memberProfile"; 
		}
		
		@RequestMapping(value = "/memberProSet", method = RequestMethod.GET)
		public String Profile4() {
				return "/memberMypage/memberProSet"; 
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
	

}
