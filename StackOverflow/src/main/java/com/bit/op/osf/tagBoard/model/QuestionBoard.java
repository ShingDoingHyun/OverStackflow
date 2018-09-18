package com.bit.op.osf.tagBoard.model;

import java.util.Date;

public class QuestionBoard{
	private int questionNo;
	private String memId;
	private String content;
	private int vote;
	private Date regDate;
	private String title;
	private int prise;
	private int view;
	private Date priseLimitDate;
	
	
	
	public QuestionBoard() {}
	
	
	
	public QuestionBoard(int questionNo, String memId, String content, int vote, Date regDate, String title, int prise,
			int view, Date priseLimitDate) {
		super();
		this.questionNo = questionNo;
		this.memId = memId;
		this.content = content;
		this.vote = vote;
		this.regDate = regDate;
		this.title = title;
		this.prise = prise;
		this.view = view;
		this.priseLimitDate = priseLimitDate;
	}

	@Override
	public String toString() {
		return "Board [questionNo=" + questionNo + ", memId=" + memId + ", content=" + content + ", vote=" + vote
				+ ", regDate=" + regDate + ", title=" + title + ", prise=" + prise + ", view=" + view
				+ ", priseLimitDate=" + priseLimitDate + "]";
	}
	
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrise() {
		return prise;
	}
	public void setPrise(int prise) {
		this.prise = prise;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public Date getPriseLimitDate() {
		return priseLimitDate;
	}
	public void setPriseLimitDate(Date priseLimitDate) {
		this.priseLimitDate = priseLimitDate;
	}
	

	
	
}
