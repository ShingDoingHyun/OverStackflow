package com.bit.op.osf.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.bit.op.osf.member.app.model.AppFileInfo;
import com.bit.op.osf.member.app.model.AppInfo;
import com.bit.op.osf.member.daoImpl.AppImpl;

@Controller
public class AppController {
	
	@Inject
	private AppImpl appImpl;
	

	
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String openUpdateAppInfo() {

		return "/memberMypage/memberUpdate";
	}
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String insertAppInfo(AppInfo appInfo, Model model, String[] app_fileType, MultipartFile[] app_fileName) {
		
		int result = appImpl.insertAppInfo(appInfo);
		
		
		
		System.out.println(result);
		System.out.println(appInfo);
		
		List<AppFileInfo> appFileInfoList = new ArrayList<AppFileInfo>();
		
		int index=0;
		for(String fileType : app_fileType){
			AppFileInfo appFileInfo = new AppFileInfo();
			System.out.println(fileType);
			System.out.println(app_fileName[index].getOriginalFilename());
			appFileInfo.setAppNO(result);
			appFileInfo.setApp_fileType(fileType);
			appFileInfo.setApp_fileName(app_fileName[index++].getOriginalFilename());
			appFileInfoList.add(appFileInfo);
		}
		

	
		
	
		appImpl.insertAppFileInfo(appFileInfoList);
		
		
		return "/memberMypage/appInsertCheck";
	}
	

}
