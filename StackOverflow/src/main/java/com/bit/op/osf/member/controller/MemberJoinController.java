package com.bit.op.osf.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.op.osf.job.model.JobInfo;

@Controller
public class MemberJoinController {
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String openWriteJobInfo() {
	  return "signUp";
	}
    
    @RequestMapping(value="", method=RequestMethod.POST)
    public String insertJobInfo(JobInfo jobInfo, Model model){
    	
//      model.addAttribute("result", comJobDaoImpl.insertJobInfo(jobInfo));
      return "comJob/comInsertCheck";
	}
}
