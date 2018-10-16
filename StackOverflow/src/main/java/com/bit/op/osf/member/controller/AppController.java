package com.bit.op.osf.member.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.op.osf.job.model.SearchJob;
import com.bit.op.osf.member.app.model.AppFileInfo;
import com.bit.op.osf.member.app.model.AppInfo;
import com.bit.op.osf.member.app.model.AppJobInfo;
import com.bit.op.osf.member.daoImpl.AppImpl;
import com.bit.op.osf.job.daoImpl.ComJobDaoImpl;

@Controller
public class AppController {
	
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	@Inject
	private ComJobDaoImpl comJobDaoImpl;
	
	@Inject
	private AppImpl appImpl;
	
	
	//이력서 등록 
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String openUpdateAppInfo() {

		return "/memberMypage/memberUpdate";
	}
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String insertAppInfo(
			AppInfo appInfo,
			Model model, 
			MultipartFile[] app_fileName,
			HttpServletRequest request,
			@ModelAttribute(value="appJobInfo") AppJobInfo appJobInfo
			  ) throws IOException {
		System.out.println("진짜 여기를 안타나? 뭐지");
		int result = appImpl.insertAppInfo(appInfo);
		List<AppFileInfo> appFileInfoList = new ArrayList<AppFileInfo>();
		List<AppJobInfo> appJobInfoList1 = new ArrayList<AppJobInfo>();
		
		System.out.println(appJobInfo.getAppJobInfoList()+"여기");
		System.out.println(appJobInfo.getAppJobInfoList().get(0).getAppjobInfo());
		String uploadUri = "/resources/file";

		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		String[] app_fileType = request.getParameterValues("app_fileType");
/*		String[] appjobName = request.getParameterValues("appjobName");
		String[] appjobInfo = request.getParameterValues("appjobInfo");
		String[] appjobClass = request.getParameterValues("appjobClass");
		String[] appjobMonth = request.getParameterValues("appjobMonth");
		String[] appjobSal = request.getParameterValues("appjobSal");*/
		
		
		int index=0;
		for(String fileType : app_fileType){
			AppFileInfo appFileInfo = new AppFileInfo();
			
			appFileInfo.setAppNO(result);
			appFileInfo.setApp_fileType(fileType);
			appFileInfo.setApp_fileName(app_fileName[index].getOriginalFilename());
			appFileInfoList.add(appFileInfo) ;
			
		
			String fileName = System.currentTimeMillis() + appFileInfo.getApp_fileName();
			byte[] data = app_fileName[index++].getBytes();
			FileOutputStream fos = new FileOutputStream(dir + "/" + fileName);
			fos.write(data);
			fos.close();
			System.out.println(dir + "/" + fileName);
		}

		for(AppJobInfo appJobInfo1 : appJobInfo.getAppJobInfoList() ) {
			
			appJobInfo1.setAppNO(result);
		}
		
			
			
					
		
		

		appImpl.insertAppFileInfo(appFileInfoList);	
		appImpl.insertAppJobInfo(appJobInfo.getAppJobInfoList());
		
		
		
		return "/memberMypage/appInsertCheck";
	}
	
	//내가 지원한 목록 리스트
	  @RequestMapping(value="/memberAppList", method=RequestMethod.GET)
	    public String applyList(HttpServletRequest request, String pageNumberStr, SearchJob search , Model model){ 
	    	String comId = null;
	    	String[] jobTypeList = null;
	    	int pageNumber = 1;
	    	
	    	if(request.getParameter("jobType")!=null) {
	      	  jobTypeList = request.getParameterValues("jobType");
	    	}
	    	search.setJobTypeList(jobTypeList);
	    
	    	if(pageNumberStr!=null) {
	    		pageNumber =Integer.parseInt(pageNumberStr);
	    	}
	    	
	    	System.out.println(search);
	    	model.addAttribute("jobInfoListView", comJobDaoImpl.selectJobInfoListPage(pageNumber, comId, search, request));
	    	model.addAttribute("search", search);
	    	model.addAttribute("page", pageNumber);
	    	
	    	return "memberMypage/memberAppList";
	    }
	  
		//즐겨찾기한 채용 리스트
	  @RequestMapping(value="/memberInterestAppComList", method=RequestMethod.GET)
	    public String interestAppList(HttpServletRequest request, String pageNumberStr, SearchJob search , Model model){ 
	    	String comId = null;
	    	String[] jobTypeList = null;
	    	int pageNumber = 1;
	    	
	    	if(request.getParameter("jobType")!=null) {
	      	  jobTypeList = request.getParameterValues("jobType");
	    	}
	    	search.setJobTypeList(jobTypeList);
	    
	    	if(pageNumberStr!=null) {
	    		pageNumber =Integer.parseInt(pageNumberStr);
	    	}
	    	
	    	System.out.println(search);
	    	model.addAttribute("jobInfoListView", comJobDaoImpl.selectJobInfoListPage(pageNumber, comId, search, request));
	    	model.addAttribute("search", search);
	    	model.addAttribute("page", pageNumber);
	    	
	    	return "memberMypage/memberInterestAppComList";
	    }
	

}
