package com.bit.op.osf.member.app.model;

import java.util.List;

public class AppJobInfo {
	private int appjobNo;
	private int appNO;
	private String appjobName;
	private String appjobInfo;
	private String appjobClass;
	private int appjobMonth;
	private String appjobSal;
	private List<AppJobInfo> appJobInfoList;

	public List<AppJobInfo> getAppJobInfoList() {
		return appJobInfoList;
	}
	public void setAppJobInfoList(List<AppJobInfo> appJobInfoList) {
		this.appJobInfoList = appJobInfoList;
	}
	public int getAppjobNo() {
		return appjobNo;
	}





	@Override
	public String toString() {
		return "AppJobInfo [appjobNo=" + appjobNo + ", appNO=" + appNO + ", appjobName=" + appjobName + ", appjobInfo="
				+ appjobInfo + ", appjobClass=" + appjobClass + ", appjobMonth=" + appjobMonth + ", appjobSal="
				+ appjobSal + ", appJobInfoList=" + appJobInfoList + "]";
	}
	public void setAppjobNo(int appjobNo) {
		this.appjobNo = appjobNo;
	}
	public int getAppNO() {
		return appNO;
	}
	public void setAppNO(int appNO) {
		this.appNO = appNO;
	}
	public String getAppjobName() {
		return appjobName;
	}
	public void setAppjobName(String appjobName) {
		this.appjobName = appjobName;
	}
	public String getAppjobInfo() {
		return appjobInfo;
	}
	public void setAppjobInfo(String appjobInfo) {
		this.appjobInfo = appjobInfo;
	}
	public String getAppjobClass() {
		return appjobClass;
	}
	public void setAppjobClass(String appjobClass) {
		this.appjobClass = appjobClass;
	}
	public int getAppjobMonth() {
		return appjobMonth;
	}
	public void setAppjobMonth(int appjobMonth) {
		this.appjobMonth = appjobMonth;
	}
	public String getAppjobSal() {
		return appjobSal;
	}
	public void setAppjobSal(String appjobSal) {
		this.appjobSal = appjobSal;
	}



}
