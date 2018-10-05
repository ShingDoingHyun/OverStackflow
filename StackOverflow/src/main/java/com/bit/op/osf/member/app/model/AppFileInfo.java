package com.bit.op.osf.member.app.model;

import java.util.List;

public class AppFileInfo {
	
	private int app_fileNo;
	private int appNO;
	private String app_fileType;
	private String app_fileName;
	public int getApp_fileNo() {
		return app_fileNo;
	}
	public void setApp_fileNo(int app_fileNo) {
		this.app_fileNo = app_fileNo;
	}
	public String getApp_fileType() {
		return app_fileType;
	}
	public int getAppNO() {
		return appNO;
	}
	public void setAppNO(int appNO) {
		this.appNO = appNO;
	}
	public void setApp_fileType(String app_fileType) {
		this.app_fileType = app_fileType;
	}
	public String getApp_fileName() {
		return app_fileName;
	}
	public void setApp_fileName(String app_fileName) {
		this.app_fileName = app_fileName;
	}
	@Override
	public String toString() {
		return "AppFileInfo [app_fileNo=" + app_fileNo + ", appNo=" + appNO + ", app_fileType=" + app_fileType
				+ ", app_fileName=" + app_fileName + "]";
	}

	
	



}
