package com.underdogs.honoka.account;

import java.util.List;


public interface IAccountDAO {
	//회원 가입
	void registerAccount(List<AccountVO> list);
	//중복 아이디 검사
	String accountCheck(String aid);
	//회사 정보 검색
	List<CompanyVO> getCompanyInfo(String c_name);
	//회원 정보 수정
	void updateAccount(String pwd, String field, String company);
	
}
