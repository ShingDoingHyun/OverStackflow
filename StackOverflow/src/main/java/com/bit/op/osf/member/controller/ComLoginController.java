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
import com.bit.op.osf.member.daoImpl.ComInfoImpl;
import com.bit.op.osf.member.daoImpl.MemberInfoImpl;
import com.bit.op.osf.member.model.ComRegInfo;

@Controller
public class ComLoginController {

	@Inject
	private ComInfoImpl comInfoImpl;

	@Autowired
	SHA256 SHA;

	@RequestMapping(value = "/comLoginForm", method = RequestMethod.GET)
	public String Loginform(Model model) {
		return "login/loginform";
	}

	@RequestMapping(value = "/comLoginForm", method = RequestMethod.POST)
	public String comLogin(@RequestParam("comId") String id, @RequestParam("comPw") String pw, Model model,
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
