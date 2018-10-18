package com.bit.op.osf.member.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemRegInfo {
	private String memberId; //아이디
	private String memberPwd; //비밀번호
	private String memberName; //이름
	private String memberNickname; //닉네임
	private String memberPhoto; //사진업로드한것 (DB용)
	private MultipartFile memberPhotoFile; //사용자 첨부파일 (파일업로드용)
	private String memberBirth;
	private String memberGender;
	private String memberPhone;
	private String memberRegisterDate;
	private String memberIntro;
	private int count;
	
	public String getRealPath() {
		return realPath;
	}



	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}



	private String realPath ;



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getMemberIntro() {
		return memberIntro;
	}



	public void setMemberIntro(String memberIntro) {
		this.memberIntro = memberIntro;
	}



	public MemRegInfo() {}
	
	
	
	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getMemberPwd() {
		return memberPwd;
	}



	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberNickname() {
		return memberNickname;
	}



	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}



	public String getMemberPhoto() {
		return memberPhoto;
	}



	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}



	public MultipartFile getMemberPhotoFile() {
		return memberPhotoFile;
	}



	public void setMemberPhotoFile(MultipartFile memberPhotoFile) {
		this.memberPhotoFile = memberPhotoFile;
	}



	public String getMemberBirth() {
		return memberBirth;
	}



	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}



	public String getMemberGender() {
		return memberGender;
	}



	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}



	public String getMemberPhone() {
		return memberPhone;
	}



	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}



	public String getMemberRegisterDate() {
		return memberRegisterDate;
	}



	public void setMemberRegisterDate(String memberRegisterDate) {
		this.memberRegisterDate = memberRegisterDate;
	}



	@Override
	public String toString() {
		return "MemRegInfo [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberNickname=" + memberNickname + ", memberPhoto=" + memberPhoto + ", memberPhotoFile="
				+ memberPhotoFile + ", memberBirth=" + memberBirth + ", memberGender=" + memberGender + ", memberPhone="
				+ memberPhone + ", memberRegisterDate=" + memberRegisterDate + ", memberIntro=" + memberIntro
				+ ", count=" + count + ", realPath=" + realPath + "]";
	}
	
	
}
