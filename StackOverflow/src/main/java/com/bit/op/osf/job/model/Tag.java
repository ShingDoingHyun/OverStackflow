package com.bit.op.osf.job.model;

public class Tag {
    private int tagNo;
    private String tagName;
    private String tagContent;
    private String tagMiddleName;
    private String tagBigName;
    
    
	public Tag() {

	}

	public Tag(int tagNo, String tagName, String tagContent, String tagMiddleName, String tagBigName) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.tagContent = tagContent;
		this.tagMiddleName = tagMiddleName;
		this.tagBigName = tagBigName;
	}
	
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getTagContent() {
		return tagContent;
	}
	public void setTagContent(String tagContent) {
		this.tagContent = tagContent;
	}
	public String getTagMiddleName() {
		return tagMiddleName;
	}
	public void setTagMiddleName(String tagMiddleName) {
		this.tagMiddleName = tagMiddleName;
	}
	public String getTagBigName() {
		return tagBigName;
	}
	public void setTagBigName(String tagBigName) {
		this.tagBigName = tagBigName;
	}

	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagName=" + tagName + ", tagContent=" + tagContent + ", tagMiddleName="
				+ tagMiddleName + ", tagBigName=" + tagBigName + "]";
	}

    
}
