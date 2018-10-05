package com.bit.op.osf.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.op.osf.member.dao.ComInfoDao;
import com.bit.op.osf.member.model.ComRegInfo;


@Controller
public class ComJoinController {
	
	
	@Inject
	private ComInfoDao comInfoDao;
	
	
	@RequestMapping(value = "/comJoinForm", method = RequestMethod.GET)
	public String JoinForm() {
		
		return "login/comjoinform"; 
	}
	
	@RequestMapping(value = "/comJoinFormTest", method = RequestMethod.POST)
	public String JoinTest(ComRegInfo comInfo, HttpServletRequest request, Model model)throws Exception {
		System.out.println(comInfo);
		model.addAttribute("insertCnt", comInfoDao.insertComInfo(comInfo, request));
		model.addAttribute("comInfo",comInfo);
		model.addAttribute("comId",comInfo.getComId());
		return "login/joinInsertCheck"; 
	}
	
	@RequestMapping(value = "/comJoinForm", method = RequestMethod.POST)
	public String Join(ComRegInfo comInfo, Model model, HttpServletRequest request)throws Exception {
		System.out.println("cominfo : " + comInfo);
		
		int insertCnt = comInfoDao.insertComInfo(comInfo, request);
		
		
		model.addAttribute("comID",comInfo.getComId());
		model.addAttribute("comInfo",comInfo);
		model.addAttribute("insertCnt",insertCnt);
		
		System.out.println(comInfo);
		return "login/joinInsertCheck"; 
	}
}
