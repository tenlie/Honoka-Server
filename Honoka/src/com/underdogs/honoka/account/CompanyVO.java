package com.underdogs.honoka.account;


//회사 정보
public class CompanyVO {
	private int c_num;
	private String c_name;
	private String c_kink;
	private String c_product;
	private String c_location;
	
	public CompanyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompanyVO(int c_num, String c_name, String c_kink, String c_product, String c_location) {
		super();
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_kink = c_kink;
		this.c_product = c_product;
		this.c_location = c_location;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_kink() {
		return c_kink;
	}

	public void setC_kink(String c_kink) {
		this.c_kink = c_kink;
	}

	public String getC_product() {
		return c_product;
	}

	public void setC_product(String c_product) {
		this.c_product = c_product;
	}

	public String getC_location() {
		return c_location;
	}

	public void setC_location(String c_location) {
		this.c_location = c_location;
	}

	@Override
	public String toString() {
		return "CompanyVO [c_num=" + c_num + ", c_name=" + c_name + ", c_kink=" + c_kink + ", c_product=" + c_product
				+ ", c_location=" + c_location + "]";
	}
	
	

}
