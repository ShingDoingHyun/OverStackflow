package com.bit.op.osf.job.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

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

import com.bit.op.osf.job.daoImpl.ComJobDaoImpl;
import com.bit.op.osf.job.model.ComMember;
import com.bit.op.osf.job.model.JobApplication;
import com.bit.op.osf.job.model.JobInfo;
import com.bit.op.osf.job.model.JobInfoListView;
import com.bit.op.osf.job.model.SearchJob;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ComJobController {
	
	@Inject
	private ComJobDaoImpl comJobDaoImpl;
	
	//채용 공고 작성 폼
    @RequestMapping(value="/comJob/writeJobInfo", method=RequestMethod.GET)
	public String openWriteJobInfo(HttpServletRequest request, Model model) {
      String comId = "test1";
      model.addAttribute("comMember", comJobDaoImpl.selectComMember(comId));
	  return "comJob/comInsertJobInfo";
	}
    
    //채용 공고 작성 실행
    @RequestMapping(value="/comJob/writeJobInfo", method=RequestMethod.POST)
    public String insertJobInfo(HttpServletRequest request, JobInfo jobInfo, Model model){
      
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
    	String comId = null;
    	String[] jobTypeList = null;
    	int pageNumber = 1;
    	
    	//jobTypeList
    	if(request.getParameter("jobType")!=null) {
      	  jobTypeList = request.getParameterValues("jobType");
    	}
    	search.setJobTypeList(jobTypeList);
    	System.out.println(search);
    	System.out.println(search.getOrder());

    	//페이지설정
    	if(pageNumberStr!=null) {
    		pageNumber =Integer.parseInt(pageNumberStr);
    	}
    	
    	System.out.println(search);
    	model.addAttribute("jobInfoListView", comJobDaoImpl.selectJobInfoListPage(pageNumber, comId, search));
    	model.addAttribute("search", search);
    	model.addAttribute("page", pageNumber);
    	
    	/*model.addAttribute("memberListView", );*/
    	return "comJob/comSeeJobInfoList";
       
    }
    
    //채용 공고 상세 페이지 
    @RequestMapping(value="/comJob/seeJobInfo/{jobNo}")
    public String selectJobInfo(@PathVariable("jobNo") int jobNo, JobInfo jobInfo, Model model){
    	
    	model.addAttribute("jobTypeList", comJobDaoImpl.selectJobTypeList(jobNo));
    	model.addAttribute("jobInfo", comJobDaoImpl.selectJobInfo(jobNo));
        return "comJob/comSeeJobInfo";
    }
    
    //채용 공고 관리 페이지
    @RequestMapping(value="/comJob/manageJobInfoList/{page}", method=RequestMethod.GET)
    public String selectJobInfoManageList(@PathVariable("page") String pageNumberStr, HttpServletRequest request ,SearchJob search, Model model){
    	String comId = "test1";
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

        model.addAttribute("jobInfoListView", comJobDaoImpl.selectJobInfoListPage(pageNumber, comId, search));
        model.addAttribute("search", search);
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
    
    //지원서 관리 목록 
    @RequestMapping(value="/comJob/manageJobAppList/{jobNo}", method=RequestMethod.GET)
    public String selectJobAppManageList(HttpServletRequest request, @PathVariable("jobNo") int jobNo, Model model) {
    	String comId = "test1";
    
    	model.addAttribute("jobAppList", comJobDaoImpl.selectJobAppManageList(comId, jobNo));
    	return "comJob/comManageJobAppList";
    }
    
    //지원서 결과 통보
    @ResponseBody
    @RequestMapping(value="/comJob/updateAppResult", produces = "application/text; charset=utf8", method=RequestMethod.POST)  
    public String updateAppResult(JobApplication jobapp) throws JsonProcessingException {
    	//넘겨주는 데이터
    	int appNo = jobapp.getAppNo();
    	String appResult = jobapp.getAppResult();
    	Date appResultDate = new Date();
    	//받는 데이터
    	JobApplication returnApp = null;  	
    	Map<String, String> result = new HashMap<String, String>();
    	
    	System.out.println(appResultDate);
    	
    	if(comJobDaoImpl.updateAppResult(appNo, appResult, appResultDate) == null) {
    		returnApp = comJobDaoImpl.selectAppResult(appNo);
    	}
    	
    	result.put("appResult", returnApp.getAppResult());
    	result.put("appResultDate", returnApp.getAppResultDate());
    	
    	String data = new ObjectMapper().writeValueAsString(result);
    	System.out.println("결과는" + data);
    	return data; 
    }
    
    //지원서 면접날짜 통보
    @ResponseBody
    @RequestMapping(value="/comJob/updateAppInterviewDate", produces = "application/text; charset=utf8", method=RequestMethod.POST)  
    public String updateAppInterviewDate(JobApplication jobapp) throws JsonProcessingException {
    	//넘겨주는 데이터
    	int appNo = jobapp.getAppNo();
    	String appInterviewDate = jobapp.getAppInterviewDate();
        Date appInterviewDateDate = new Date();
        //받는 데이터
        JobApplication returnApp = null;  	
        Map<String, String> result = new HashMap<String, String>();
        
        System.out.println(appInterviewDateDate);
    	if(comJobDaoImpl.updateAppInterviewDate(appNo, appInterviewDate, appInterviewDateDate) == null) {
    		returnApp = comJobDaoImpl.selectAppInterviewDate(appNo);
    	}

    	result.put("appInterviewDate", returnApp.getAppInterviewDate());
    	result.put("appInterviewDateDate", returnApp.getAppInterviewDateDate());
    	
    	String data = new ObjectMapper().writeValueAsString(result);
    	System.out.println("결과2는" + data);
    	return data;
    }

    /*@RequestMapping(value="/comJob/seeJobInfoListBySearch/{page}", method=RequestMethod.GET)
    public String selectJobInfoListBySearch(@PathVariable(value = "page") String pageNumberStr, Model model){ 
    	String comId = null;
    	int pageNumber = 1;
    	
    	if(pageNumberStr!=null) {
    		pageNumber =Integer.parseInt(pageNumberStr);
    	}
    	
    	model.addAttribute("jobInfoListView", comJobDaoImpl.selectJobInfoListPage(pageNumber, comId));
    	
    	model.addAttribute("memberListView", );
    	return "comJob/comSeeJobInfoList";
       
    }*/

/*



    public String deleteJobInfo(int jobSeqNum){
        return null;
    }

    public void countJobInfoManage(String comId, String endedJob){
    }*/

}

