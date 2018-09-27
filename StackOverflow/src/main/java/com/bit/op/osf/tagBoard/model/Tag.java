package com.bit.op.osf.tagBoard.model;

public class Tag {

	private int tagNo;
	private String tagMainName;
	private String tagMiddleName;
	private String tagName;
	private String tagDetail;
	
	
	public Tag() {}
	
	public Tag(int tagNo, String tagMainName, String tagMiddleName, String tagName, String tagDetail) {
		super();
		this.tagNo = tagNo;
		this.tagMainName = tagMainName;
		this.tagMiddleName = tagMiddleName;
		this.tagName = tagName;
		this.tagDetail = tagDetail;
	}
	
	

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagMainName() {
		return tagMainName;
	}

	public void setTagMainName(String tagMainName) {
		this.tagMainName = tagMainName;
	}

	public String getTagMiddleName() {
		return tagMiddleName;
	}

	public void setTagMiddleName(String tagMiddleName) {
		this.tagMiddleName = tagMiddleName;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getTagDetail() {
		return tagDetail;
	}

	public void setTagDetail(String tagDetail) {
		this.tagDetail = tagDetail;
	}

	@Override
	public String toString() {
		return "tag [tagNo=" + tagNo + ", tagMainName=" + tagMainName + ", tagMiddleName=" + tagMiddleName
				+ ", tagName=" + tagName + ", tagDetail=" + tagDetail + "]";
	}
	
	
}
