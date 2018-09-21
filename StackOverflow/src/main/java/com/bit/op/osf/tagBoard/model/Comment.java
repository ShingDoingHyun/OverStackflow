package com.bit.op.osf.tagBoard.model;

import java.util.List;

public class Comment {
	private int commentNo;
	private int questionNo;
	private int replyNo;
	private String memId;
	private int upperCommentNo;
	private String content;
	private String regDate;
	private List<Comment> commentList;
	
	public Comment() {}

	public Comment(int commentNo, int questionNo, int replyNo, String memId, int upperCommentNo, String content,
			String regDate, List<Comment> commentList) {
		super();
		this.commentNo = commentNo;
		this.questionNo = questionNo;
		this.replyNo = replyNo;
		this.memId = memId;
		this.upperCommentNo = upperCommentNo;
		this.content = content;
		this.regDate = regDate;
		this.commentList = commentList;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getUpperCommentNo() {
		return upperCommentNo;
	}

	public void setUpperCommentNo(int upperCommentNo) {
		this.upperCommentNo = upperCommentNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", questionNo=" + questionNo + ", replyNo=" + replyNo + ", memId="
				+ memId + ", upperCommentNo=" + upperCommentNo + ", content=" + content + ", regDate=" + regDate
				+ ", commentList=" + commentList + "]";
	}
	
	
	
	
}
