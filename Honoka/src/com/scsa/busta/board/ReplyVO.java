package com.scsa.busta.board;

public class ReplyVO {

	int replynum;
	String content;
	int gulnum;
	String mid;
	String writedate;
	
	public ReplyVO() {
		super();
	}
	public ReplyVO(int replynum, String content) {
		super();
		this.replynum = replynum;
		this.content = content;
	}
	public ReplyVO(String content) {
		super();
		this.content = content;
	}
	public ReplyVO(int replynum, String content, int gulnum, String mid,
			String writedate) {
		super();
		this.replynum = replynum;
		this.content = content;
		this.gulnum = gulnum;
		this.mid = mid;
		this.writedate = writedate;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGulnum() {
		return gulnum;
	}
	public void setGulnum(int gulnum) {
		this.gulnum = gulnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replynum=" + replynum + ", content=" + content
				+ ", gulnum=" + gulnum + ", mid=" + mid + ", writedate="
				+ writedate + "]";
	}
	
	
}
