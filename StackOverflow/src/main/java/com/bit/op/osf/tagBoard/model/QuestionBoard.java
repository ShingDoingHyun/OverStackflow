package com.bit.op.osf.tagBoard.model;

import java.util.Date;
import java.util.List;

public class QuestionBoard{
	private int questionNo;
	private String memId;
	private String content;
	private int vote;
	private Date regDate;
	private String title;
	private int prise;
	private int view;
	private int fav;
	private String tags;//글 작성시 태그 리스트를 받기 위해 사용
	private String priseLimitDate;
	private List<Comment> commentList;
	private List<ReplyBoard> replyBoardList;
	private List<Tag> tagList;
	
	
	
	public QuestionBoard() {}



	public QuestionBoard(int questionNo, String memId, String content, int vote, Date regDate, String title, int prise,
			int view, int fav, String tags, String priseLimitDate, List<Comment> commentList,
			List<ReplyBoard> replyBoardList, List<Tag> tagList) {
		super();
		this.questionNo = questionNo;
		this.memId = memId;
		this.content = content;
		this.vote = vote;
		this.regDate = regDate;
		this.title = title;
		this.prise = prise;
		this.view = view;
		this.fav = fav;
		this.tags = tags;
		this.priseLimitDate = priseLimitDate;
		this.commentList = commentList;
		this.replyBoardList = replyBoardList;
		this.tagList = tagList;
	}



	@Override
	public String toString() {
		return "QuestionBoard [questionNo=" + questionNo + ", memId=" + memId + ", content=" + content + ", vote="
				+ vote + ", regDate=" + regDate + ", title=" + title + ", prise=" + prise + ", view=" + view + ", fav="
				+ fav + ", tags=" + tags + ", priseLimitDate=" + priseLimitDate + ", commentList=" + commentList
				+ ", replyBoardList=" + replyBoardList + ", tagList=" + tagList + "]";
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



	public int getFav() {
		return fav;
	}



	public void setFav(int fav) {
		this.fav = fav;
	}



	public String getTags() {
		return tags;
	}



	public void setTags(String tags) {
		this.tags = tags;
	}



	public String getPriseLimitDate() {
		return priseLimitDate;
	}



	public void setPriseLimitDate(String priseLimitDate) {
		this.priseLimitDate = priseLimitDate;
	}



	public List<Comment> getCommentList() {
		return commentList;
	}



	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}



	public List<ReplyBoard> getReplyBoardList() {
		return replyBoardList;
	}



	public void setReplyBoardList(List<ReplyBoard> replyBoardList) {
		this.replyBoardList = replyBoardList;
	}



	public List<Tag> getTagList() {
		return tagList;
	}



	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	
	
	
}
	