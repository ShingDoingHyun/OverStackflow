package com.bit.op.osf.job.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.op.osf.job.daoImpl.ComJobAppDaoImpl;
import com.bit.op.osf.job.daoImpl.ComJobDaoImpl;
import com.bit.op.osf.job.model.ComMember;
import com.bit.op.osf.job.model.JobApplication;
import com.bit.op.osf.job.model.JobInfo;
import com.bit.op.osf.job.model.JobInfoListView;
import com.bit.op.osf.job.model.SearchJob;
import com.bit.op.osf.member.model.ComRegInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ComJobController {
	
	@Inject
	private ComJobDaoImpl comJobDaoImpl;
	
	//채용 공고 작성 폼
    @RequestMapping(value="/comJob/writeJobInfo", method=RequestMethod.GET)
	public String openWriteJobInfo(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
    	ComRegInfo comInfo= (ComRegInfo) request.getSession().getAttribute("comInfo");
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();

        if(comInfo != null) {
    	  String comId = comInfo.getComId();
      	  if(comId != null) {
      		  model.addAttribute("comMember", comJobDaoImpl.selectComMember(comId));
      	  }else {
  			out.println("<script>alert('로그인 후 이용해 주세요.'); history.back();</script>");
  			out.flush(); 
      	  }
        }else {
  		out.println("<script>alert('로그인 후 이용해 주세요.'); history.back();</script>");
  		out.flush(); 
        }
      		  
	  return "comJob/comInsertJobInfo";
	}
    
    //채용 공고 작성 실행
    @RequestMapping(value="/comJob/writeJobInfo", method=RequestMethod.POST)
    public String insertJobInfo(HttpServletRequest request, JobInfo jobInfo, Model model) throws IOException{
    
      String result = null;
      int jobNo = 0;
      comJobDaoImpl.insertJobInfo(jobInfo);
      System.out.println(comJobDaoImpl.selectJobno());
      
      if(request.getParameter("jobType")!=null) {
    	  String jobTypeList[] = request.getParameterValues("jobType");
    	  for(String jobType : jobTypeList) {
    		  result = comJobDaoImpl.insertJobType(jobType, jobNo);
    	  }
      }
      model.addAttribute("result", result);
      model.addAttribute("disting", "insert");

      return "comJob/comJobInfoCheck";
	}
    
    //채용 공고 리스트 페이지
    @RequestMapping(value="/comJob/seeJobInfoList/{page}", method=RequestMethod.GET)
    public String selectJobInfoList(HttpServletRequest request,@PathVariable(value = "page") String pageNumberStr, SearchJob search , Model model){ 
    	ComRegInfo comInfo= (ComRegInfo) request.getSession().getAttribute("comInfo");
    	String FcomId = null;   	
    	String[] jobTypeList = null;
    	int pageNumber = 1;
    
    	//페이지설정
    	if(pageNumberStr!=null) {
    		pageNumber =Integer.parseInt(pageNumberStr);
    	}
    	
    	//jobTypeList
    	if(request.getParameter("jobType")!=null) {
      	  jobTypeList = request.getParameterValues("jobType");
    	}
    	search.setJobTypeList(jobTypeList);
    	System.out.println(search);
    	
    	//Model 전송
    	model.addAttribute("jobInfoListView", comJobDaoImpl.selectJobInfoListPage(pageNumber, FcomId, search, request));
    	model.addAttribute("search", search);
    	model.addAttribute("page", pageNumber);
    	
    	if(comInfo != null) {
    		String comId = comInfo.getComId();
	    	if(comId != null) {
	    		System.out.println("yo"+comId);
	    		//나의 채용공고 불러오기
	    		model.addAttribute("myJobInfoListView", comJobDaoImpl.selectMyJobInfoList(pageNumber, comId));
	    		//즐겨찾기한 채용공고 불러오기
	    		model.addAttribute("myFavJobInfoList", comJobDaoImpl.selectFavJobInfoList(request));
	    	}	
	    }
    	
    	//방문한 채용공고 불러오기 - 쿠키
    	Cookie[] cookies = request.getCookies();
    	if(cookies.length>0) {
    		model.addAttribute("visitJobInfoList", comJobDaoImpl.selectVisitJobInfo(cookies));
    	}
    	
    	return "comJob/comSeeJobInfoList";
    } 
    
    //채용 공고 상세 페이지 
    @RequestMapping(value="/comJob/seeJobInfo/{jobNo}")
    public String selectJobInfo(@PathVariable("jobNo") int jobNo, JobInfo jobInfo, Model model){
    	
    	model.addAttribute("jobTypeList", comJobDaoImpl.selectJobTypeList(jobNo));
    	model.addAttribute("jobInfo", comJobDaoImpl.selectJobInfo(jobNo));
    	model.addAttribute("comMem", comJobDaoImpl.selectJobInfoCom(jobNo));
        return "comJob/comSeeJobInfo";
    }
    
    //채용 공고 관리 페이지
    @RequestMapping(value="/comJob/manageJobInfoList/{page}", method=RequestMethod.GET)
    public String selectJobInfoManageList(@PathVariable("page") String pageNumberStr, HttpServletRequest request, HttpServletResponse response, SearchJob search, Model model) throws IOException{
    	ComRegInfo comInfo= (ComRegInfo) request.getSession().getAttribute("comInfo");
    	response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
    	if(comInfo != null) {
    		String comId = comInfo.getComId();
    		if(comId != null) {
	    	int pageNumber =1;
	    	String[] jobTypeList = null;
	    	
	        //페이징 설정
	        if(pageNumberStr!=null) {
	        	pageNumber =Integer.parseInt(pageNumberStr);
	        }
	        
	    	//jobTypeList
	    	if(request.getParameter("jobType")!=null) {
	      	  jobTypeList = request.getParameterValues("jobType");
	    	}
	    	search.setJobTypeList(jobTypeList);
	    	System.out.println(search);
	
	        model.addAttribute("jobInfoListView", comJobDaoImpl.selectJobInfoListPage(pageNumber, comId, search, request));
	        model.addAttribute("search", search);
    		}else{
    			out.println("<script>alert('로그인 후 이용해 주세요.'); history.back();</script>");
    			out.flush(); 
    		}
    	}else {
    		out.println("<script>alert('로그인 후 이용해 주세요.'); history.back();</script>");
			out.flush(); 
    	}

    	return "comJob/comManageJobInfoList";
    }
    
    //채용 공고 수정 폼
    @RequestMapping(value="/comJob/updateJobInfo/{jobNo}", method=RequestMethod.GET)
    public String openUpdateJobInfo(@PathVariable("jobNo") int jobNo, JobInfo jobInfo ,Model model) {
    	System.out.println(jobInfo.getJobNo());
    
    	model.addAttribute("jobTypeList", comJobDaoImpl.selectJobTypeList(jobNo));
    	model.addAttribute("jobInfo", comJobDaoImpl.selectJobInfo(jobNo));

    	return "comJob/comUpdateJobInfo";
    }
    
    //채용 공고 수정 실행
    @RequestMapping(value="/comJob/updateJobInfo", method=RequestMethod.POST)
    public String updateJobInfo(HttpServletRequest request, JobInfo jobInfo ,Model model) {
    	
    	String result = null;
    	int jobNo = jobInfo.getJobNo();
    	System.out.println(jobInfo.getJobNo());
    	
    	//기존의 jobType 삭제 
    	if(!comJobDaoImpl.selectJobTypeList(jobInfo.getJobNo()).equals("[]")){
    	System.out.println(comJobDaoImpl.deleteJobType(jobInfo.getJobNo()));
    	}
    	
    	//새로 선택된 jobType 삽입
    	 if(request.getParameter("jobType")!=null) {
       	  String jobTypeList[] = request.getParameterValues("jobType");
       	  for(String jobType : jobTypeList) {
       		comJobDaoImpl.insertJobType(jobType, jobNo);
       		System.out.println(jobType);
       	  }
    	 }
    	model.addAttribute("result", comJobDaoImpl.updateJobInfo(jobInfo));
    	model.addAttribute("disting", "update");
    	return "comJob/comJobInfoCheck";
    }
    
    //채용 공고 기간 연장 실행 
    @RequestMapping(value="/comJob/updateJobInfoPeriod", method=RequestMethod.POST)
    public String updateJobInfoPeriod(@RequestParam("jobNo") int jobNo, 
    		@RequestParam(value="jobDueDate", required=false) @DateTimeFormat(pattern="yyyy-MM-dd") Date now, 
    		Model model) {
		 System.out.println(now); 
    	 System.out.println(jobNo);
    	 model.addAttribute("result", comJobDaoImpl.updateJobInfoPeriod(jobNo, now));
    	 model.addAttribute("disting", "edit");
    	return "comJob/comJobInfoCheck";
    }

    //채용 공고 마감 실행 
    @RequestMapping(value="/comJob/updateJobInfoPeriodForEnd/{jobNo}", method=RequestMethod.GET)
    public String updateJobInfoPeriodForEnd(@PathVariable("jobNo") int jobNo, Model model){
       Date now = new Date();
       System.out.println(now);
       comJobDaoImpl.setEndedJob();
       model.addAttribute("result", comJobDaoImpl.updateJobInfoPeriod(jobNo, now));
       model.addAttribute("disting", "end");
       return "comJob/comJobInfoCheck";
    }
    
    //채용 공고 삭제 실행
    @RequestMapping(value="/comJob/deleteJobInfo/{jobNo}", method=RequestMethod.GET)
    public String deleteJobInfo(@PathVariable("jobNo") int jobNo, Model model) {
    	model.addAttribute("result", comJobDaoImpl.deleteJobInfo(jobNo));
    	model.addAttribute("disting", "delete");
    	return "comJob/comJobInfoCheck";
    }
    
    //즐겨찾기
    @ResponseBody
    @RequestMapping(value="/comJob/checkJobInfoFav", method=RequestMethod.POST)
    public List<JobInfo> checkJobInfoFav(JobInfo jobInfo, HttpServletRequest request){
    	
    	int result1 = comJobDaoImpl.changeFavJobInfo(jobInfo);
    	System.out.println(comJobDaoImpl.selectFavJobInfoList(request));
    	return comJobDaoImpl.selectFavJobInfoList(request);
    }
   

/*



    public String deleteJobInfo(int jobSeqNum){
        return null;
    }

    public void countJobInfoManage(String comId, String endedJob){
    }*/

}

