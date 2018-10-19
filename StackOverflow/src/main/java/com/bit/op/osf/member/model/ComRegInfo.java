package com.bit.op.osf.member.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ComRegInfo {
	private String comId; //아이디
	private String comPwd; //비밀번호
	private String comNum; //이름
	private String comName; //닉네임
	private String comAddress;//기업주소
	private String comPhoto; //사진업로드한것 (DB용)
	private MultipartFile comPhotoFile; //사용자 첨부파일 (파일업로드용)
	private String comHomePageUrl;//회사 이메일
	private String comChargerName;//담당자 이름
	private String comChargerEmail;//담당자 이메일
	private String comChargerPhone;//담당자 연락처
	private String comIntro;
	private String realPath ;
	
	
	
	public String getRealPath() {
		return realPath;
	}
	
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	
	
	public String getComIntro() {
		return comIntro;
	}


	public void setComIntro(String comIntro) {
		this.comIntro = comIntro;
	}


	public ComRegInfo() {}


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


	public MultipartFile getComPhotoFile() {
		return comPhotoFile;
	}


	public void setComPhotoFile(MultipartFile comPhotoFile) {
		this.comPhotoFile = comPhotoFile;
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


	public String getComChargerPhone() {
		return comChargerPhone;
	}


	public void setComChargerPhone(String comChargerPhone) {
		this.comChargerPhone = comChargerPhone;
	}


	@Override
	public String toString() {
		return "ComRegInfo [comId=" + comId + ", comPwd=" + comPwd + ", comNum=" + comNum + ", comName=" + comName
				+ ", comAddress=" + comAddress + ", comPhoto=" + comPhoto + ", comPhotoFile=" + comPhotoFile
				+ ", comHomePageUrl=" + comHomePageUrl + ", comChargerName=" + comChargerName + ", comChargerEmail="
				+ comChargerEmail + ", comChargerPhone=" + comChargerPhone + ", comIntro=" + comIntro + "]";
	}



}
	
	
	
	
	
	
	


	