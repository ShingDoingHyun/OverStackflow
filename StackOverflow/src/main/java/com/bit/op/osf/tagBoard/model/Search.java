package com.bit.op.osf.tagBoard.model;

public class Search {
	private int firstRow;
	private int endRow;
	private int page;
	
	
	public Search() {}
	

	
	public Search(int firstRow, int endRow, int page) {
		super();
		this.firstRow = firstRow;
		this.endRow = endRow;
		this.page = page;
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
	
	
	
}
