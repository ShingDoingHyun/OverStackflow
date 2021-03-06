package com.bit.op.osf.tagBoard.model;

import java.util.Date;
import java.util.List;

public class ReplyBoard {
	private int replyNo;
	private String memId;
	private String memberPhoto;
	private int questionNo;
	private String content;
	private int vote;
	private String selection;
	private Date regDate;
	private List<Comment> commentList;

	public ReplyBoard() {
	}



	public ReplyBoard(int replyNo, String memId, String memberPhoto, int questionNo, String content, int vote,
			String selection, Date regDate, List<Comment> commentList) {
		super();
		this.replyNo = replyNo;
		this.memId = memId;
		this.memberPhoto = memberPhoto;
		this.questionNo = questionNo;
		this.content = content;
		this.vote = vote;
		this.selection = selection;
		this.regDate = regDate;
		this.commentList = commentList;
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

	public String getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
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

	public String getSelection() {
		return selection;
	}

	public void setSelection(String selection) {
		this.selection = selection;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
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
		return "ReplyBoard [replyNo=" + replyNo + ", memId=" + memId + ", questionNo=" + questionNo + ", content="
				+ content + ", vote=" + vote + ", selection=" + selection + ", regDate=" + regDate + ", commentList="
				+ commentList + "]";
	}

}
