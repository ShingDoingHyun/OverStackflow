package com.bit.op.osf.job.model;

import java.util.Arrays;
import java.util.List;

public class SearchJob {
    private String jobTitle;
    private String[] jobTypeList;
    private String jobLocation;
    private String jobPayType;
    private String jobPayAmount;
    private String order;
    /*private List<Tag> jobTagList;*/
    
    public SearchJob() {
    	
    }

	public SearchJob(String jobTitle, String[] jobTypeList, String jobLocation, String jobPayType, String jobPayAmount,
			String order) {
		super();
		this.jobTitle = jobTitle;
		this.jobTypeList = jobTypeList;
		this.jobLocation = jobLocation;
		this.jobPayType = jobPayType;
		this.jobPayAmount = jobPayAmount;
		this.order = order;
	}

	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String[] getJobTypeList() {
		return jobTypeList;
	}
	public void setJobTypeList(String[] jobTypeList) {
		this.jobTypeList = jobTypeList;
	}
	public String getJobLocation() {
		return jobLocation;
	}
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	public String getJobPayType() {
		return jobPayType;
	}
	public void setJobPayType(String jobPayType) {
		this.jobPayType = jobPayType;
	}
	public String getJobPayAmount() {
		return jobPayAmount;
	}
	public void setJobPayAmount(String jobPayAmount) {
		this.jobPayAmount = jobPayAmount;
	}
	
	public boolean check(){
		
		if(jobTitle != null && jobTitle != "") {
			return true;
		}else if(jobTypeList!=null ){
			return true;
		}else if(jobLocation!=null && jobLocation!= "" ){
			return true;
		}else if(jobPayType!=null && jobPayType!="" ) {
			return true;
		}else if(jobPayAmount!=null && jobPayAmount!=""){
			return true;
		}else if(order!=null && order!="") {
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return "SearchJob [jobTitle=" + jobTitle + ", jobTypeList=" + Arrays.toString(jobTypeList) + ", jobLocation="
				+ jobLocation + ", jobPayType=" + jobPayType + ", jobPayAmount=" + jobPayAmount + ", order=" + order
				+ "]";
	}
	
}
