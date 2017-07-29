package com.scsa.busta.board;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class LostBoardVO {
	
	int lostnum;
	String title;
	String mid;
	String location;
	String content;
	String image;
	String writedate;
	int count;
	int replycount;
	
	public LostBoardVO() {
		super();
	}
	
	public LostBoardVO(String title, String location, String content, String image) {
		super();
		this.title = title;
		this.location = location;
		this.content = content;
		this.image = image;
	}
	
	public LostBoardVO(int lostnum, String title, String mid, String location,
			String content, String image, String writedate, int count) {
		super();
		this.lostnum = lostnum;
		this.title = title;
		this.mid = mid;
		this.location = location;
		this.content = content;
		this.image = image;
		this.writedate = writedate;
		this.count = count;
	}

	public LostBoardVO(int lostnum, String title, String mid, String location,
			String content, String image, String writedate, int count,
			int replycount) {
		super();
		this.lostnum = lostnum;
		this.title = title;
		this.mid = mid;
		this.location = location;
		this.content = content;
		this.image = image;
		this.writedate = writedate;
		this.count = count;
		this.replycount = replycount;
	}

	public int getLostnum() {
		return lostnum;
	}
	public void setLostnum(int lostnum) {
		this.lostnum = lostnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
		return "LostBoardVO [lostnum=" + lostnum + ", title=" + title
				+ ", mid=" + mid + ", location=" + location + ", content="
				+ content + ", image=" + image + ", writedate=" + writedate
				+ ", count=" + count + ", replycount=" + replycount + "]";
	}

}
