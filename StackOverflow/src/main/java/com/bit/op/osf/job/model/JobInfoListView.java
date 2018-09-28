package com.bit.op.osf.job.model;

import java.util.List;

public class JobInfoListView {
	
    private int jobInfoTotalCount;
    private List<JobInfo> jobInfoList;
    private int currentPageNumber;
    private int pageTotalCount;
    private int jobInfoCountPerPage;
    
    private int firstRow;
    private int endRow;
    
    public JobInfoListView() {
	}
    

	public JobInfoListView(int jobInfoTotalCount, List<JobInfo> jobInfoList, int currentPageNumber,
			int jobInfoCountPerPage, int firstRow, int endRow) {
		super();
		this.jobInfoTotalCount = jobInfoTotalCount;
		this.jobInfoList = jobInfoList;
		this.currentPageNumber = currentPageNumber;
		this.jobInfoCountPerPage = jobInfoCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}

	//JobInfo의 수에 맞춰 페이지 개수 설정 메서드
	public void calculatePageTotalCount(){
		if(jobInfoTotalCount == 0) {
			pageTotalCount = 0;
		}else {
			pageTotalCount = jobInfoTotalCount / jobInfoCountPerPage;
			
			if(jobInfoTotalCount % jobInfoCountPerPage > 0) {
				pageTotalCount++;
			}
		}
    }

	public int getJobInfoTotalCount() {
		return jobInfoTotalCount;
	}

	public void setJobInfoTotalCount(int jobInfoTotalCount) {
		this.jobInfoTotalCount = jobInfoTotalCount;
	}

	public List<JobInfo> getJobInfoList() {
		return jobInfoList;
	}

	public void setJobInfoList(List<JobInfo> jobInfoList) {
		this.jobInfoList = jobInfoList;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getJobInfoCountPerPage() {
		return jobInfoCountPerPage;
	}

	public void setJobInfoCountPerPage(int jobInfoCountPerPage) {
		this.jobInfoCountPerPage = jobInfoCountPerPage;
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
	
	public boolean isEmpty() {
		return jobInfoTotalCount == 0;
	}

}
