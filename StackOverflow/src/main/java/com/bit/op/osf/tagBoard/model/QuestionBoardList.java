package com.bit.op.osf.tagBoard.model;

import java.util.List;


public class QuestionBoardList {
	private int questionBoardTotalCount;
	private int currentPageNumber;
	private List<QuestionBoard>  questionBoardList;
	private int pageTotalCount;
	private int questionBoardCountPerPage;
	private int firstRow;
	private int endRow;
	private boolean prev;
	private boolean next;
	
	

	public QuestionBoardList() {}
	
	public QuestionBoardList(List<QuestionBoard> questionBoardList, int currentPageNumber,int questionBoardTotalCount, int questionBoardCountPerPage, int firstRow, int endRow) {
		super();
		this.questionBoardTotalCount = questionBoardTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.questionBoardList = questionBoardList;
		this.questionBoardCountPerPage = questionBoardCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}



	private void calculatePageTotalCount() {
		System.out.println(pageTotalCount +"="+ questionBoardTotalCount +"/"+ questionBoardCountPerPage);
		if (questionBoardTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = questionBoardTotalCount / questionBoardCountPerPage;
			if (questionBoardTotalCount % questionBoardCountPerPage > 0) {
				pageTotalCount++;
			}
		}
		int startPage = 0;
		prev =  currentPageNumber == 9 ? false : true;
		
		int a = pageTotalCount - currentPageNumber;
		if(a> 10) {
			next = true;
		}else {
			int result1 = pageTotalCount/10;
			int result2 = currentPageNumber/10;
			
			if(result1>result2) {
				next = true;
			}else {
				next = false;
			}
			
		}
		/*next =  currentPageNumber == pageTotalCount ? false : true;*/
	}


	@Override
	public String toString() {
		return "QuestionBoardList [questionBoardTotalCount=" + questionBoardTotalCount + ", currentPageNumber="
				+ currentPageNumber + ", questionBoardList=" + questionBoardList + ", pageTotalCount=" + pageTotalCount
				+ ", questionBoardCountPerPage=" + questionBoardCountPerPage + ", firstRow=" + firstRow + ", endRow="
				+ endRow + "]";
	}

	public int getQuestionBoardTotalCount() {
		return questionBoardTotalCount;
	}

	public void setQuestionBoardTotalCount(int questionBoardTotalCount) {
		this.questionBoardTotalCount = questionBoardTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<QuestionBoard> getQuestionBoardList() {
		return questionBoardList;
	}

	public void setQuestionBoardList(List<QuestionBoard> questionBoardList) {
		this.questionBoardList = questionBoardList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getQuestionBoardCountPerPage() {
		return questionBoardCountPerPage;
	}

	public void setQuestionBoardCountPerPage(int questionBoardCountPerPage) {
		this.questionBoardCountPerPage = questionBoardCountPerPage;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	

}
