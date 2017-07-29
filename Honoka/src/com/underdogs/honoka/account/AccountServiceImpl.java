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
		// TODO Auto-generated method stub
		dao.registerAccount(account);
	}

	@Override
	public String accountCheck(String aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompanyVO> getCompanyInfo(String c_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAccount(String pwd, String field, String company) {
		// TODO Auto-generated method stub
		dao.updateAccount(pwd, field, company);
	}

	@Override
	public String loginAccount(String acid, String pwd) {
		// TODO Auto-generated method stub
		String result = dao.loginAccount(acid, pwd);
		return result;
	}

}
