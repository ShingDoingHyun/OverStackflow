package com.bit.op.osf.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.op.osf.member.daoImpl.MemberInfoImpl;
import com.bit.op.osf.member.model.MemRegInfo;

@Controller
public class MemLogoutController {


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
		/*Object obj = session.getAttribute("sessionMemberID");

		if (obj != null) {

			session.removeAttribute("sessionMemberID");
			session.invalidate();*/

//	 Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
//	 
//	 if(loginCookie ! = null) {
//	 loginCookie.setPath("/");
//	 loginCookie.setMaxAge(0);
//	 response.addCookie(loginCookie);
//	 service.keepLogin(vo.getUid(),session.getId(),new Date());
//	 }
//	 }
//	 }
			
			
			/*if(session.getAttribute("sessionMemberID") != null) {
				Object obj1 = session.getAttribute("sessionMemberID");
			}else if(session.getAttribute("sessionComMemberID") != null) {
				Object obj2 = session.getAttribute("sessionComMemberID");
			}
			
			if (obj1 != null) {
				session.removeAttribute("sessionMemberID");
				session.invalidate();
			}else if(obj2 != null) {
				session.removeAttribute("sessionComMemberID");
				session.invalidate();
			}*/

		/*}*/
	 return "redirect:/";
	}
}
