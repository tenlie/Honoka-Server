package com.underdogs.honoka.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements IAccountService {

	@Autowired
	IAccountDAO dao;

	@Override
	public void registerAccount(AccountVO account) {
		dao.registerAccount(account);
	}

	@Override
	public String accountCheck(String aid) {
		return dao.accountCheck(aid);
	}

	@Override
	public List<CompanyVO> getCompanyInfo(String c_name) {
		return dao.getCompanyInfo(c_name);

	}

	@Override
	public void updateAccount(String pwd, String field, String company) {
		dao.updateAccount(pwd, field, company);
	}

	@Override
	public String loginAccount(String acid, String pwd) {
		String result = dao.loginAccount(acid, pwd);
		return result;
	}

}
