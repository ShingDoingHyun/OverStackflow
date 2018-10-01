package com.bit.op.osf.tagBoard.model;

public class QuestionTag {
	private int questionNo;
	private int tagNo;
	
	public QuestionTag() {}
	
	public QuestionTag(int questionNo, int tagNo) {
		super();
		this.questionNo = questionNo;
		this.tagNo = tagNo;
	}

	@Override
	public String toString() {
		return "QuestionTag [questionNo=" + questionNo + ", tagNo=" + tagNo + "]";
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	
	
	
}
