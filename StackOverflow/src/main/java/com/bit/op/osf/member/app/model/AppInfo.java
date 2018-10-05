package com.bit.op.osf.member.app.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class AppInfo {

	private int appNO;
	private String appName; //이름
	private String appBirth; // 생일
	private String appGender; // 성별
	private String appEmail; // email
	private String appPhone; // 휴대폰
	private String appCall; // 집전화
	private String appAddress; // 주소
	private MultipartFile appPhoto; // 사진
	//----------------------------------
	private String appPhotoName; //사진명
	//----------------------------------
	private String appEduLevel; // 학교구분
	private String appEduName; // 학교명
	private String appEntraDate; // 입학일
	private String appGraduDate; // 졸업일
	private String appEduState; //상태(졸업,휴학)
	private String appIntroduction;
	
	//----------------------------------

	//----------------------------------
	
	public AppInfo() {
		
	
	}



	public AppInfo(int appNO, String appName,  String appBirth, String appGender,
			String appEmail, String appPhone, String appCall, String appAddress, MultipartFile appPhoto,
			String appEduLevel, String appEduName, String appEntraDate, String appGraduDate, String appEduState,
			 String appIntroduction 
			) {
		super();
		this.appNO = appNO;
		this.appIntroduction = appIntroduction;
		this.appName = appName;
		this.appBirth = appBirth;
		this.appGender = appGender;
		this.appEmail = appEmail;
		this.appPhone = appPhone;
		this.appCall = appCall;
		this.appAddress = appAddress;
		this.appPhoto = appPhoto;
		this.appEduLevel = appEduLevel;
		this.appEduName = appEduName;
		this.appEntraDate = appEntraDate;
		this.appGraduDate = appGraduDate;
		this.appEduState = appEduState;
	

	}

	public int getAppNO() {
		return appNO;
	}

	public String getAppIntroduction() {
		return appIntroduction;
	}

	public void setAppIntroduction(String appIntroduction) {
		this.appIntroduction = appIntroduction;
	}

	public void setAppNO(int appNO) {
		this.appNO = appNO;
	}


	public String getAppPhotoName() {
		return appPhotoName;
	}

	public void setAppPhotoName(String appPhotoName) {
		this.appPhotoName = appPhotoName;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	
	public String getAppBirth() {
		return appBirth;
	}

	public void setAppBirth(String appBirth) {
		this.appBirth = appBirth;
	}

	public String getAppGender() {
		return appGender;
	}

	public void setAppGender(String appGender) {
		this.appGender = appGender;
	}

	public String getAppEmail() {
		return appEmail;
	}

	public void setAppEmail(String appEmail) {
		this.appEmail = appEmail;
	}

	public String getAppPhone() {
		return appPhone;
	}

	public void setAppPhone(String appPhone) {
		this.appPhone = appPhone;
	}

	public String getAppCall() {
		return appCall;
	}

	public void setAppCall(String appCall) {
		this.appCall = appCall;
	}

	public String getAppAddress() {
		return appAddress;
	}

	public void setAppAddress(String appAddress) {
		this.appAddress = appAddress;
	}

	public MultipartFile getAppPhoto() {
		return appPhoto;
	}

	public void setAppPhoto(MultipartFile appPhoto) {
		this.appPhoto = appPhoto;
	}

	public String getAppEduLevel() {
		return appEduLevel;
	}

	public void setAppEduLevel(String appEduLevel) {
		this.appEduLevel = appEduLevel;
	}

	public String getAppEduName() {
		return appEduName;
	}

	public void setAppEduName(String appEduName) {
		this.appEduName = appEduName;
	}

	public String getAppEntraDate() {
		return appEntraDate;
	}

	public void setAppEntraDate(String appEntraDate) {
		this.appEntraDate = appEntraDate;
	}

	public String getAppGraduDate() {
		return appGraduDate;
	}

	public void setAppGraduDate(String appGraduDate) {
		this.appGraduDate = appGraduDate;
	}

	public String getAppEduState() {
		return appEduState;
	}

	public void setAppEduState(String appEduState) {
		this.appEduState = appEduState;
	}



	@Override
	public String toString() {
		return "AppInfo [appNO=" + appNO + ", appName=" + appName + ", appBirth=" + appBirth + ", appGender="
				+ appGender + ", appEmail=" + appEmail + ", appPhone=" + appPhone + ", appCall=" + appCall
				+ ", appAddress=" + appAddress + ", appPhoto=" + appPhoto + ", appPhotoName=" + appPhotoName
				+ ", appEduLevel=" + appEduLevel + ", appEduName=" + appEduName + ", appEntraDate=" + appEntraDate
				+ ", appGraduDate=" + appGraduDate + ", appEduState=" + appEduState + ", appIntroduction="
				+ appIntroduction + "]";
	}










	
}
