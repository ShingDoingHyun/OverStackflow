package com.bit.op.osf.tagBoard.model;

import java.util.List;

public class Search {
	private int firstRow;
	private int endRow;
	private int page;
	private String order;
	private String keyword;
	private String tagNo;
	private String tagName;
	private List<Tag> tagList;
	
	public Search() {}


	public Search(int firstRow, int endRow, int page, String order, String keyword, String tagNo, String tagName,
			List<Tag> tagList) {
		super();
		this.firstRow = firstRow;
		this.endRow = endRow;
		this.page = page;
		this.order = order;
		this.keyword = keyword;
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.tagList = tagList;
	}


	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	

	public String getTagNo() {
		return tagNo;
	}

	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}
	
	
}
