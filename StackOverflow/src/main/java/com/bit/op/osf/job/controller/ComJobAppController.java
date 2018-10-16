package com.bit.op.osf.job.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.op.osf.job.daoImpl.ComJobAppDaoImpl;
import com.bit.op.osf.job.daoImpl.ComJobDaoImpl;
import com.bit.op.osf.job.model.JobApplication;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ComJobAppController {
	@Inject
	private ComJobAppDaoImpl comJobAppDaoImpl;
	
	@Inject
	private ComJobDaoImpl comJobDaoImpl;

    //지원서 관리 목록 
    @RequestMapping(value="/comJob/manageJobAppList/{jobNo}", method=RequestMethod.GET)
    public String selectJobAppManageList(HttpServletRequest request, @PathVariable("jobNo") int jobNo, Model model) {
    	String comId = "test1";
    	String appResult = null;
    	
    	model.addAttribute("jobInfoList", comJobAppDaoImpl.selectJobInfoListForApp(comId));
    	model.addAttribute("jobAppList", comJobAppDaoImpl.selectJobAppManageList(comId, jobNo, appResult));
    	model.addAttribute("job", comJobDaoImpl.selectJobInfo(jobNo));
    	model.addAttribute("jobAppNum", comJobAppDaoImpl.countJobAppByJobNo(jobNo, comId, appResult));
    	model.addAttribute("graph", comJobAppDaoImpl.countJobAppForGraph(comId, jobNo, appResult));
    	return "comJob/comManageJobAppList";
    }
    
    //지원서 관리 목록 By AppResult
    @RequestMapping(value="/comJob/manageJobAppListByAppResult/{jobNo}/{appResult}", method=RequestMethod.GET)
    public String selectJobAppManageListByAppResult(HttpServletRequest request, @PathVariable("jobNo") int jobNo, @PathVariable("appResult") String appResult, Model model) {
    	String comId = "test1";

    	model.addAttribute("jobInfoList", comJobAppDaoImpl.selectJobInfoListForApp(comId));
    	model.addAttribute("jobAppList", comJobAppDaoImpl.selectJobAppManageList(comId, jobNo, appResult));
    	model.addAttribute("job", comJobDaoImpl.selectJobInfo(jobNo));
    	model.addAttribute("jobAppNum", comJobAppDaoImpl.countJobAppByJobNo(jobNo, comId, appResult));
    	model.addAttribute("graph", comJobAppDaoImpl.countJobAppForGraph(comId, jobNo, appResult));
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
    	
    	if(comJobAppDaoImpl.updateAppResult(appNo, appResult, appResultDate) == null) {
    		returnApp = comJobAppDaoImpl.selectAppResult(appNo);
    	}
    	
    	result.put("appResult", returnApp.getAppResult());
    	result.put("appResultDate", returnApp.getAppResultDate());
    	
    	String data = new ObjectMapper().writeValueAsString(result);
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
    	if(comJobAppDaoImpl.updateAppInterviewDate(appNo, appInterviewDate, appInterviewDateDate) == null) {
    		returnApp = comJobAppDaoImpl.selectAppInterviewDate(appNo);
    	}

    	result.put("appInterviewDate", returnApp.getAppInterviewDate());
    	result.put("appInterviewDateDate", returnApp.getAppInterviewDateDate());
    	
    	String data = new ObjectMapper().writeValueAsString(result);
    	return data;
    }

}
