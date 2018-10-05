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

import com.bit.op.osf.member.SHA256.SHA256;
import com.bit.op.osf.member.daoImpl.MemberInfoImpl;
import com.bit.op.osf.member.model.MemRegInfo;

@Controller
public class MemLoginController {

	@Inject
	private MemberInfoImpl memberInfoImpl;

	@Autowired
	SHA256 SHA;

	@RequestMapping(value = "/memLoginForm", method = RequestMethod.GET)
	public String Loginform(Model model) {
		return "login/loginform";
	}

	@RequestMapping(value = "/memLoginForm", method = RequestMethod.POST)
	public String memberLogin(@RequestParam("memberId") String id, @RequestParam("memberPwd") String pw, Model model,
			HttpServletRequest request) {

		// 2-1.세션 만들기
		HttpSession session = request.getSession();

		// 1-1.회원 정보 불러오기
		MemRegInfo memInfo = memberInfoImpl.selectMember(id, pw);

		if (memInfo!= null) {

			if (id.equals(memInfo.getMemberId()) && SHA.encrypt(pw).equals(memInfo.getMemberPwd())) {
				model.addAttribute("memInfo", memInfo);
				session.setAttribute("memInfo", memInfo);
			}
		}

		return "login/logincheck";
	}

}
