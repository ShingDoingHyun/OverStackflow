package com.bit.op.osf.member.dao;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ex {
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		
		return "/memberMypage/MemberUpdate";
	}
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.POST)
	public String board(Locale locale, Model model) {

		
		return "/memberMypage/MemberUpdate";
	}

}
