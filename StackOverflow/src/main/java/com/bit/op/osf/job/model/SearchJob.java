package com.bit.op.osf.job.model;

import java.util.List;

public class SearchJob {
    private String jobTitle;
    private String[] jobTypeList;
    private String jobLocation;
    private String jobPayType;
    private String jobPayAmount;
    /*private List<Tag> jobTagList;*/
    
    public SearchJob() {
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
		
		if(jobTitle != null) {
			return true;
		}else if(jobTypeList!=null){
			return true;
		}else if(jobLocation!=null){
			return true;
		}else if(jobPayType!=null) {
			return true;
		}else if(jobPayAmount!=null){
			return true;
		}
		return false;
	}
	
	@Override
	public String toString() {
		return "SearchJob [jobTitle=" + jobTitle + ", jobTypeList=" + jobTypeList + ", jobLocation=" + jobLocation
				+ ", jobPayType=" + jobPayType + ", jobPayAmount=" + jobPayAmount + "]";
	}

}
