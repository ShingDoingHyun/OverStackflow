package com.bit.op.osf.job.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.op.osf.job.daoImpl.ComJobDaoImpl;
import com.bit.op.osf.job.model.JobInfo;

@Controller
public class ComJobController {
	
	@Inject
	private ComJobDaoImpl comJobDaoImpl;
	
    @RequestMapping(value="/comJob/writeJobInfo", method=RequestMethod.GET)
	public String openWriteJobInfo() {
	  return "comJob/comInsertJobInfo";
	}
    
    @RequestMapping(value="/comJob/writeJobInfo", method=RequestMethod.POST)
    public String insertJobInfo(JobInfo jobInfo, Model model){
    	
      model.addAttribute("result", comJobDaoImpl.insertJobInfo(jobInfo));
      return "comJob/comInsertCheck";
	}
    
/*  @RequestMapping(value="/comJob/insertJobType", method=RequestMethod.POST)
	public String insertJobType(@RequestParam("jobTypeList") List<String> jobTypeList) {
		return null;
		
	}*/

/*    public String insertJobInfo(JobInfo jobInfo){
        return null;
    }

    public String selectJobInfo(int jobSeqNum){
        return null;
    }

    public String selectJobInfoList(SearchJob searchJob, int page){
        return null;
    }

    public String selectJobInfoManageList(HttpServletRequest request, int page, String endedJob){
        return null;
    }

    public String updateJobInfoForm(){
        return null;
    }

    public String updateJobInfo(JobInfo jobInfo){
        return null;
    }

    public String updateJobInfoPeriod(int jobSeqNum, Date jobDueDate){
        return null;
    }

    public String endJobInfoPeriod(int jobSeqNum, Date jobDueDate){
        return null;
    }

    public String deleteJobInfo(int jobSeqNum){
        return null;
    }

    public void countJobInfoManage(String comId, String endedJob){
    }*/

}

