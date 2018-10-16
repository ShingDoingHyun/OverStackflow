package com.bit.op.osf.tagBoard.model;

public class MemFavTag {

	private String memId;
	private int tagNo;
	
	
	public MemFavTag() {}
	
	public MemFavTag(String memId, int tagNo) {
		super();
		this.memId = memId;
		this.tagNo = tagNo;
	}
	
	
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	@Override
	public String toString() {
		return "MemFavTag [memId=" + memId + ", tagNo=" + tagNo + "]";
	}
	
	
}
