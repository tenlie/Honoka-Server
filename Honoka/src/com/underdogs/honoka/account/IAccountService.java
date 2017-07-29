package com.underdogs.honoka.account;

import java.util.List;

public interface IAccountService {
	//회원 가입
	public void registerAccount(AccountVO account);
	//중복 아이디 검사
	public String accountCheck(String aid);
	//회사 정보 검색
	public List<CompanyVO> getCompanyInfo(String c_name);
	//회원 정보 수정
	public void updateAccount(String pwd, String field, String company);
	//로그인
	public String loginAccount(String acid, String pwd);
	
}
