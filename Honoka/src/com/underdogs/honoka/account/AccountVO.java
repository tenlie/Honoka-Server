package com.underdogs.honoka.account;

//회원 정보
public class AccountVO {
	private String acid; // 필
	private String pwd;// 
	private String gender; 
	private int age;
	private String email; //필 
	private String field; //
	private String company;//필 
	private int career;
	private String regdate;
	private String firstregid;
	private String firstregdate;
	private String lastupdateid;
	private String lastupdatedate;
	private String status; 
	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public AccountVO(String acid, String pwd, String email, String field, String company) {
		super();
		this.acid = acid;
		this.pwd = pwd;
		this.email = email;
		this.field = field;
		this.company = company;
	}


	public AccountVO(String acid, String pwd, String gender, int age, String email, String field, String company,
			int career, String regdate, String firstregid, String firstregdate, String lastupdateid,
			String lastupdatedate, String status) {
		super();
		this.acid = acid;
		this.pwd = pwd;
		this.gender = gender;
		this.age = age;
		this.email = email;
		this.field = field;
		this.company = company;
		this.career = career;
		this.regdate = regdate;
		this.firstregid = firstregid;
		this.firstregdate = firstregdate;
		this.lastupdateid = lastupdateid;
		this.lastupdatedate = lastupdatedate;
		this.status = status;
	}
	public String getAcid() {
		return acid;
	}
	public void setAcid(String acid) {
		this.acid = acid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getCareer() {
		return career;
	}
	public void setCareer(int career) {
		this.career = career;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getFirstregid() {
		return firstregid;
	}
	public void setFirstregid(String firstregid) {
		this.firstregid = firstregid;
	}
	public String getFirstregdate() {
		return firstregdate;
	}
	public void setFirstregdate(String firstregdate) {
		this.firstregdate = firstregdate;
	}
	public String getLastupdateid() {
		return lastupdateid;
	}
	public void setLastupdateid(String lastupdateid) {
		this.lastupdateid = lastupdateid;
	}
	public String getLastupdatedate() {
		return lastupdatedate;
	}
	public void setLastupdatedate(String lastupdatedate) {
		this.lastupdatedate = lastupdatedate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AccountVO [acid=" + acid + ", pwd=" + pwd + ", gender=" + gender + ", age=" + age + ", email=" + email
				+ ", field=" + field + ", company=" + company + ", career=" + career + ", regdate=" + regdate
				+ ", firstregid=" + firstregid + ", firstregdate=" + firstregdate + ", lastupdateid=" + lastupdateid
				+ ", lastupdatedate=" + lastupdatedate + ", status=" + status + "]";
	}
	
	

}
