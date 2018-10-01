package com.bit.op.osf.tagBoard.model;

public class Search {
	private int firstRow;
	private int endRow;
	
	
	public Search() {}
	
	public Search(int firstRow, int endRow) {
		super();
		this.firstRow = firstRow;
		this.endRow = endRow;
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
	
	
}
