package com.bit.op.osf.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.op.osf.member.dao.MemberInfoDao;
import com.bit.op.osf.member.model.MemRegInfo;

@Controller
public class MemJoinController {
	
	@Inject
	private MemberInfoDao memberInfoDao;
	
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
}
