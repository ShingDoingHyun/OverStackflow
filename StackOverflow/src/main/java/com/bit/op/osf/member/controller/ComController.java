package com.bit.op.osf.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.op.osf.member.SHA256.SHA256;
import com.bit.op.osf.member.dao.ComInfoDao;
import com.bit.op.osf.member.daoImpl.ComInfoImpl;
import com.bit.op.osf.member.model.ComRegInfo;
import com.bit.op.osf.member.model.MemRegInfo;


@Controller
public class ComController {
	
	
	@Inject
	private ComInfoDao comInfoDao;
	
	@Inject
	private ComInfoImpl comInfoImpl;
	
	
	@Autowired
	SHA256 SHA;

	
	// 1. 저장 경로 설정 10/18
		String uploadUri = "/resources/uploadFile/comrPhoto";
		String uploadUriDir;
	
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
		
		// 2. 시스템의 물리적인 경로 10 18
				uploadUriDir = request.getSession().getServletContext().getRealPath(uploadUri);
				/*int insertCnt = memberInfoDao.insertMemberInfo(memInfo, request);
				*/
				comInfo.setRealPath(uploadUriDir);
		
		int insertCnt = comInfoDao.insertComInfo(comInfo, request);
		
		
		model.addAttribute("comID",comInfo.getComId());
		model.addAttribute("comInfo",comInfo);
		model.addAttribute("insertCnt",insertCnt);
		
		System.out.println(comInfo);
		return "login/joinInsertCheck"; 
	}
	
	@RequestMapping(value = "/comLoginForm", method = RequestMethod.GET)
	public String Loginform(Model model) {
		return "login/loginform";
	}
	
	@RequestMapping(value = "/comProfile", method = RequestMethod.GET)
	public String Profile() {
			return "/comMypage/comProfile"; 
	}
	
	
	@RequestMapping(value = "/comProSet", method = RequestMethod.GET)
	public String comProfileSet(HttpSession session) {
		ComRegInfo comInfo = (ComRegInfo)session.getAttribute("comInfo");
		
		session.setAttribute("comInfo",comInfo);
		
			return "/comMypage/comProSet"; 
	}
	
	//comProfileUpdate   post
	
		@RequestMapping(value = "/comProfileUpdate")
		public String memberProfileUpdate(HttpSession session,  @RequestParam String comPwd, @RequestParam String comIntro, @RequestParam String com ,
				@RequestParam String comChargerName,@RequestParam  MultipartFile comPhotoFile, @RequestParam  String comChargerPhone, HttpServletRequest request) throws Exception {
			
			
//		public String comProfileUpdate(HttpSession session, comRegInfo memInfo, Model model ) throws Exception {
			
			
			ComRegInfo comInfo=(ComRegInfo)session.getAttribute("comInfo");
			comInfo.setComPwd(comPwd);
			comInfo.setComIntro(comIntro);
			comInfo.setComChargerName(comChargerName);
			comInfo.setComChargerPhone(comChargerPhone);
			comInfo.setComPhotoFile(comPhotoFile);
	
		  	//myPageInfoDao.memberProfileUpdate(memInfo);
			if(	comInfoDao.comProfileUpdate(comInfo, request) > 0) {
				session.setAttribute("memInfo", comInfo);
				
				return  "/comMypage/comProfile" ;
			}else {			
				return  "/comMypage/comProSet" ; 
			}	
		}

	@RequestMapping(value = "/comLoginForm", method = RequestMethod.POST)
	public String comLogin(@RequestParam("comId") String id, @RequestParam("comPwd") String pw, Model model,
			HttpServletRequest request) {

		// 2-1.세션 만들기
		HttpSession session = request.getSession();

		// 1-1.회원 정보 불러오기
		ComRegInfo comInfo = comInfoImpl.selectCom(id, pw);

		if (comInfo != null) {

			if (id.equals(comInfo.getComId()) && SHA.encrypt(pw).equals(comInfo.getComPwd())) {
				model.addAttribute("comInfo", comInfo);
				session.setAttribute("comInfo", comInfo);
			}

		}

		return "login/logincheck2";
	}

}
