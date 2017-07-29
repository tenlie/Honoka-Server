package com.underdogs.honoka.user;

public class UserVO {
	
	private String UserID;
	private String CrunchTime;
	private String AcID;
	private String AchvID;

	public UserVO(){}
	
	public UserVO(String userID, String userName) {
		super();
		this.UserID = userID;
	}
	
	public UserVO(String userID, String crunchTime, String acID, String achvID) {
		super();
		this.UserID = userID;
		this.CrunchTime = crunchTime;
		this.AcID = acID;
		this.AchvID = achvID;
	}
	
	public String getUserID() {
		return this.UserID;
	}
	
	public void setUserID(String userID) {
		this.UserID = userID;
	}
	
	public String getCrunchTime() {
		return this.CrunchTime;
	}

	public void setCrunchTime(String crunchTime) {
		this.CrunchTime = crunchTime;
	}

	public String getAcID() {
		return this.AcID;
	}

	public void setAcID(String acID) {
		this.AcID = acID;
	}

	public String getAchvID() {
		return this.AchvID;
	}

	public void setAchvID(String achvID) {
		this.AchvID = achvID;
	}

	@Override
	public String toString() {
		return "UserVO [UserID=" + UserID + ", CrunchTime=" + CrunchTime + ", AcID=" + AcID + ", AchvID=" + AchvID
				+ "]";
	}

}
