package com.bit.op.osf.job.model;

import java.util.Date;

public class ComMember {
    private String comId;
    private String comPwd;
    private String comNum;
    private String comName;
    private String comAddress;
    private String comZipcode;
    private String comCall;
    private String comPhoto;
    private String comHomePageUrl;
    private String comChargerName;
    private String comChargerEmail;
    private String comIntroduction;
    private String comBenefits;
/*    private List<Tag> comTagList;*/
    private Date comRegisterdate;
/*    private List<JobInfo> comJobInfoList;
    private List<JobApplicationInfo> comJobApplicationList;*/

    public ComMember() {
	}
    
    
	public ComMember(String comId, String comPwd, String comNum, String comName, String comAddress, String comPhoto,
			String comHomePageUrl, String comChargerName, String comChargerEmail, String comIntroduction,
			String comBenefits, Date comRegisterdate) {
		super();
		this.comId = comId;
		this.comPwd = comPwd;
		this.comNum = comNum;
		this.comName = comName;
		this.comAddress = comAddress;
		this.comPhoto = comPhoto;
		this.comHomePageUrl = comHomePageUrl;
		this.comChargerName = comChargerName;
		this.comChargerEmail = comChargerEmail;
		this.comIntroduction = comIntroduction;
		this.comBenefits = comBenefits;
		this.comRegisterdate = comRegisterdate;
	}
	
	public String getComZipcode() {
		return comZipcode;
	}


	public void setComZipcode(String comZipcode) {
		this.comZipcode = comZipcode;
	}


	public String getComCall() {
		return comCall;
	}


	public void setComCall(String comCall) {
		this.comCall = comCall;
	}


	public String getComId() {
		return comId;
	}


	public void setComId(String comId) {
		this.comId = comId;
	}


	public String getComPwd() {
		return comPwd;
	}


	public void setComPwd(String comPwd) {
		this.comPwd = comPwd;
	}


	public String getComNum() {
		return comNum;
	}


	public void setComNum(String comNum) {
		this.comNum = comNum;
	}


	public String getComName() {
		return comName;
	}


	public void setComName(String comName) {
		this.comName = comName;
	}


	public String getComAddress() {
		return comAddress;
	}


	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}


	public String getComPhoto() {
		return comPhoto;
	}


	public void setComPhoto(String comPhoto) {
		this.comPhoto = comPhoto;
	}


	public String getComHomePageUrl() {
		return comHomePageUrl;
	}


	public void setComHomePageUrl(String comHomePageUrl) {
		this.comHomePageUrl = comHomePageUrl;
	}


	public String getComChargerName() {
		return comChargerName;
	}


	public void setComChargerName(String comChargerName) {
		this.comChargerName = comChargerName;
	}


	public String getComChargerEmail() {
		return comChargerEmail;
	}


	public void setComChargerEmail(String comChargerEmail) {
		this.comChargerEmail = comChargerEmail;
	}


	public String getComIntroduction() {
		return comIntroduction;
	}


	public void setComIntroduction(String comIntroduction) {
		this.comIntroduction = comIntroduction;
	}


	public String getComBenefits() {
		return comBenefits;
	}


	public void setComBenefits(String comBenefits) {
		this.comBenefits = comBenefits;
	}


	public Date getComRegisterdate() {
		return comRegisterdate;
	}


	public void setComRegisterdate(Date comRegisterdate) {
		this.comRegisterdate = comRegisterdate;
	}
	
}
