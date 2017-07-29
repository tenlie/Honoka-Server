package com.scsa.busta.board;

public class SuggestionVO {

	int sugnum;
	String mid;
	String title;
	String content;
	String writedate;
	int count;
	int replycount;
	
	public SuggestionVO() {
		super();
	}
	
	public SuggestionVO(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}
	
	public SuggestionVO(String mid, String title, String content) {
		super();
		this.mid = mid;
		this.title = title;
		this.content = content;
	}
	
	public SuggestionVO(int sugnum, String mid, String title, String content,
			String writedate, int count) {
		super();
		this.sugnum = sugnum;
		this.mid = mid;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.count = count;
	}

	public SuggestionVO(int sugnum, String mid, String title, String content,
			String writedate, int count, int replycount) {
		super();
		this.sugnum = sugnum;
		this.mid = mid;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.count = count;
		this.replycount = replycount;
	}

	public int getSugnum() {
		return sugnum;
	}
	public void setSugnum(int sugnum) {
		this.sugnum = sugnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	@Override
	public String toString() {
		return "SuggestionVO [sugnum=" + sugnum + ", mid=" + mid + ", title="
				+ title + ", content=" + content + ", writedate=" + writedate
				+ ", count=" + count + ", replyCount=" + replycount + "]";
	}

}
